#include <klee/klee.h>

#define PRV_U 0
#define PRV_S 1
#define PRV_M 3

#define EXC_NONE 0
#define EXC_ILLEGAL_INSTRUCTION 2
#define EXC_VIRTUAL_INSTRUCTION 22

#define OP_WRITE_SCOUNTEREN 0
#define OP_READ_SCOUNTEREN 1
#define OP_READ_COUNTER 2

#define COUNTEREN_CY_MASK 0x1u
#define COUNTEREN_TIME_MASK 0x2u
#define COUNTEREN_IR_MASK 0x4u
#define COUNTEREN_ZICNTR_MASK 0x7u
#define COUNTEREN_ZIHPM_MASK 0xfffffff8u

static int map_prv(int idx)
{
    if (idx == 0) {
        return PRV_U;
    }

    if (idx == 1) {
        return PRV_S;
    }

    return PRV_M;
}

static int map_op(int idx)
{
    if (idx == 0) {
        return OP_WRITE_SCOUNTEREN;
    }

    if (idx == 1) {
        return OP_READ_SCOUNTEREN;
    }

    return OP_READ_COUNTER;
}

static unsigned int counter_bit_mask(int counter_idx)
{
    return 1u << (counter_idx & 31);
}

static unsigned int counteren_mask(int ext_zicntr, int ext_zihpm)
{
    unsigned int mask = 0;

    if (ext_zicntr) {
        mask |= COUNTEREN_ZICNTR_MASK;
    }

    if (ext_zihpm) {
        mask |= COUNTEREN_ZIHPM_MASK;
    }

    return mask;
}

static int counter_exists(int counter_idx, int ext_zicntr, int ext_zihpm)
{
    if (counter_idx >= 0 && counter_idx <= 2) {
        return ext_zicntr;
    }

    if (counter_idx >= 3 && counter_idx <= 31) {
        return ext_zihpm;
    }

    return 0;
}

static unsigned int masked_scounteren_write(
    unsigned int old_val,
    unsigned int write_val,
    unsigned int mask)
{
    return (old_val & ~mask) | (write_val & mask);
}

static int direct_scounteren_permission(
    int ext_s,
    int v,
    int prv)
{
    if (!ext_s) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    if (v) {
        return EXC_VIRTUAL_INSTRUCTION;
    }

    if (prv < PRV_S) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    return EXC_NONE;
}

static int write_scounteren_slice(
    int ext_s,
    int ext_zicntr,
    int ext_zihpm,
    int v,
    int prv,
    unsigned int old_scounteren,
    unsigned int write_val,
    unsigned int *new_scounteren,
    unsigned int *mask_out)
{
    int exc = direct_scounteren_permission(ext_s, v, prv);
    unsigned int mask = counteren_mask(ext_zicntr, ext_zihpm);

    *mask_out = mask;
    *new_scounteren = old_scounteren;

    if (exc != EXC_NONE) {
        return exc;
    }

    *new_scounteren = masked_scounteren_write(old_scounteren, write_val, mask);
    return EXC_NONE;
}

static int read_scounteren_slice(
    int ext_s,
    int v,
    int prv,
    unsigned int old_scounteren,
    unsigned int *read_value)
{
    int exc = direct_scounteren_permission(ext_s, v, prv);

    *read_value = 0;

    if (exc != EXC_NONE) {
        return exc;
    }

    *read_value = old_scounteren;
    return EXC_NONE;
}

static int bit_enabled(unsigned int val, int counter_idx)
{
    unsigned int mask = counter_bit_mask(counter_idx);
    return (val & mask) != 0;
}

static int read_counter_proxy_slice(
    int ext_s,
    int ext_zicntr,
    int ext_zihpm,
    int v,
    int prv,
    int counter_idx,
    unsigned int mcounteren,
    unsigned int hcounteren,
    unsigned int scounteren,
    int *mctr_ok_out,
    int *hctr_ok_out,
    int *sctr_ok_out,
    int *counter_exists_out)
{
    int exists = counter_exists(counter_idx, ext_zicntr, ext_zihpm);

    int mctr_ok = 1;
    int hctr_ok = 1;
    int sctr_ok = 1;

    *counter_exists_out = exists;
    *mctr_ok_out = 1;
    *hctr_ok_out = 1;
    *sctr_ok_out = 1;

    if (!exists) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    if (prv < PRV_M) {
        mctr_ok = bit_enabled(mcounteren, counter_idx);
    }

    if (v) {
        hctr_ok = bit_enabled(hcounteren, counter_idx);
    }

    if (ext_s && prv < PRV_S) {
        sctr_ok = bit_enabled(scounteren, counter_idx);
    }

    *mctr_ok_out = mctr_ok;
    *hctr_ok_out = hctr_ok;
    *sctr_ok_out = sctr_ok;

    if (!mctr_ok) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    if (!hctr_ok) {
        return EXC_VIRTUAL_INSTRUCTION;
    }

    if (!sctr_ok) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    return EXC_NONE;
}

int main(void)
{
    int op_idx;
    int ext_s;
    int ext_zicntr;
    int ext_zihpm;
    int v;
    int prv_idx;
    int counter_idx;

    unsigned int old_scounteren;
    unsigned int write_val;
    unsigned int mcounteren;
    unsigned int hcounteren;
    unsigned int scounteren_for_counter;

    klee_make_symbolic(&op_idx, sizeof(op_idx), "op_idx");
    klee_make_symbolic(&ext_s, sizeof(ext_s), "ext_s");
    klee_make_symbolic(&ext_zicntr, sizeof(ext_zicntr), "ext_zicntr");
    klee_make_symbolic(&ext_zihpm, sizeof(ext_zihpm), "ext_zihpm");
    klee_make_symbolic(&v, sizeof(v), "v");
    klee_make_symbolic(&prv_idx, sizeof(prv_idx), "prv_idx");
    klee_make_symbolic(&counter_idx, sizeof(counter_idx), "counter_idx");

    klee_make_symbolic(&old_scounteren, sizeof(old_scounteren), "old_scounteren");
    klee_make_symbolic(&write_val, sizeof(write_val), "write_val");
    klee_make_symbolic(&mcounteren, sizeof(mcounteren), "mcounteren");
    klee_make_symbolic(&hcounteren, sizeof(hcounteren), "hcounteren");
    klee_make_symbolic(&scounteren_for_counter, sizeof(scounteren_for_counter), "scounteren_for_counter");

    klee_assume(op_idx >= 0);
    klee_assume(op_idx <= 2);

    klee_assume(ext_s >= 0);
    klee_assume(ext_s <= 1);

    klee_assume(ext_zicntr >= 0);
    klee_assume(ext_zicntr <= 1);

    klee_assume(ext_zihpm >= 0);
    klee_assume(ext_zihpm <= 1);

    klee_assume(v >= 0);
    klee_assume(v <= 1);

    klee_assume(prv_idx >= 0);
    klee_assume(prv_idx <= 2);

    klee_assume(counter_idx >= 0);
    klee_assume(counter_idx <= 31);

    int op = map_op(op_idx);
    int prv = map_prv(prv_idx);

    unsigned int new_scounteren = old_scounteren;
    unsigned int read_value = 0;
    unsigned int mask = counteren_mask(ext_zicntr, ext_zihpm);

    int mctr_ok = 1;
    int hctr_ok = 1;
    int sctr_ok = 1;
    int counter_exists_result = 1;

    int exc = EXC_NONE;

    if (op == OP_WRITE_SCOUNTEREN) {
        exc = write_scounteren_slice(
            ext_s,
            ext_zicntr,
            ext_zihpm,
            v,
            prv,
            old_scounteren,
            write_val,
            &new_scounteren,
            &mask
        );
    } else if (op == OP_READ_SCOUNTEREN) {
        exc = read_scounteren_slice(
            ext_s,
            v,
            prv,
            old_scounteren,
            &read_value
        );
    } else {
        exc = read_counter_proxy_slice(
            ext_s,
            ext_zicntr,
            ext_zihpm,
            v,
            prv,
            counter_idx,
            mcounteren,
            hcounteren,
            scounteren_for_counter,
            &mctr_ok,
            &hctr_ok,
            &sctr_ok,
            &counter_exists_result
        );
    }

    int obs_op;
    int obs_ext_s;
    int obs_ext_zicntr;
    int obs_ext_zihpm;
    int obs_v;
    int obs_prv;
    int obs_counter_idx;

    unsigned int obs_old_scounteren;
    unsigned int obs_write_val;
    unsigned int obs_mcounteren;
    unsigned int obs_hcounteren;
    unsigned int obs_scounteren_for_counter;

    unsigned int obs_counteren_mask;
    unsigned int obs_new_scounteren;
    unsigned int obs_read_value;

    int obs_mctr_ok;
    int obs_hctr_ok;
    int obs_sctr_ok;
    int obs_counter_exists;

    int obs_exc;

    klee_make_symbolic(&obs_op, sizeof(obs_op), "obs_op");
    klee_make_symbolic(&obs_ext_s, sizeof(obs_ext_s), "obs_ext_s");
    klee_make_symbolic(&obs_ext_zicntr, sizeof(obs_ext_zicntr), "obs_ext_zicntr");
    klee_make_symbolic(&obs_ext_zihpm, sizeof(obs_ext_zihpm), "obs_ext_zihpm");
    klee_make_symbolic(&obs_v, sizeof(obs_v), "obs_v");
    klee_make_symbolic(&obs_prv, sizeof(obs_prv), "obs_prv");
    klee_make_symbolic(&obs_counter_idx, sizeof(obs_counter_idx), "obs_counter_idx");

    klee_make_symbolic(&obs_old_scounteren, sizeof(obs_old_scounteren), "obs_old_scounteren");
    klee_make_symbolic(&obs_write_val, sizeof(obs_write_val), "obs_write_val");
    klee_make_symbolic(&obs_mcounteren, sizeof(obs_mcounteren), "obs_mcounteren");
    klee_make_symbolic(&obs_hcounteren, sizeof(obs_hcounteren), "obs_hcounteren");
    klee_make_symbolic(&obs_scounteren_for_counter, sizeof(obs_scounteren_for_counter), "obs_scounteren_for_counter");

    klee_make_symbolic(&obs_counteren_mask, sizeof(obs_counteren_mask), "obs_counteren_mask");
    klee_make_symbolic(&obs_new_scounteren, sizeof(obs_new_scounteren), "obs_new_scounteren");
    klee_make_symbolic(&obs_read_value, sizeof(obs_read_value), "obs_read_value");

    klee_make_symbolic(&obs_mctr_ok, sizeof(obs_mctr_ok), "obs_mctr_ok");
    klee_make_symbolic(&obs_hctr_ok, sizeof(obs_hctr_ok), "obs_hctr_ok");
    klee_make_symbolic(&obs_sctr_ok, sizeof(obs_sctr_ok), "obs_sctr_ok");
    klee_make_symbolic(&obs_counter_exists, sizeof(obs_counter_exists), "obs_counter_exists");

    klee_make_symbolic(&obs_exc, sizeof(obs_exc), "obs_exc");

    klee_assume(obs_op == op);
    klee_assume(obs_ext_s == ext_s);
    klee_assume(obs_ext_zicntr == ext_zicntr);
    klee_assume(obs_ext_zihpm == ext_zihpm);
    klee_assume(obs_v == v);
    klee_assume(obs_prv == prv);
    klee_assume(obs_counter_idx == counter_idx);

    klee_assume(obs_old_scounteren == old_scounteren);
    klee_assume(obs_write_val == write_val);
    klee_assume(obs_mcounteren == mcounteren);
    klee_assume(obs_hcounteren == hcounteren);
    klee_assume(obs_scounteren_for_counter == scounteren_for_counter);

    klee_assume(obs_counteren_mask == mask);
    klee_assume(obs_new_scounteren == new_scounteren);
    klee_assume(obs_read_value == read_value);

    klee_assume(obs_mctr_ok == mctr_ok);
    klee_assume(obs_hctr_ok == hctr_ok);
    klee_assume(obs_sctr_ok == sctr_ok);
    klee_assume(obs_counter_exists == counter_exists_result);

    klee_assume(obs_exc == exc);

    return 0;
}