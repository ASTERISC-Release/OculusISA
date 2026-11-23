#include <klee/klee.h>

#define PRV_S 1
#define PRV_M 3

#define EXC_NONE 0
#define EXC_ILLEGAL_INSTRUCTION 2
#define EXC_VIRTUAL_INSTRUCTION 22

#define SATP_MODE_OFF 0
#define SATP_MODE_SV39 8
#define SATP_MODE_SV48 9
#define SATP_MODE_SV57 10
#define SATP_MODE_SV64 11
#define SATP_MODE_RESERVED 15

static int satp_mode_valid(int mode, int max_vaddr_bits)
{
    if (mode == SATP_MODE_OFF) {
        return 1;
    }

    if (mode == SATP_MODE_SV39 && max_vaddr_bits >= 39) {
        return 1;
    }

    if (mode == SATP_MODE_SV48 && max_vaddr_bits >= 48) {
        return 1;
    }

    if (mode == SATP_MODE_SV57 && max_vaddr_bits >= 57) {
        return 1;
    }

    return 0;
}

static int mask_asid(int asid, int impl_mmu_asid)
{
    if (!impl_mmu_asid) {
        return 0;
    }

    return asid & 3;
}

static int mask_ppn(int ppn, int paddr_bits)
{
    if (paddr_bits <= 12) {
        return 0;
    }

    if (paddr_bits == 13) {
        return ppn & 1;
    }

    return ppn & 3;
}

static int map_max_vaddr_bits(int idx)
{
    if (idx == 0) {
        return 39;
    }

    if (idx == 1) {
        return 48;
    }

    return 57;
}

static int map_paddr_bits(int idx)
{
    if (idx == 0) {
        return 12;
    }

    if (idx == 1) {
        return 13;
    }

    return 14;
}

static int map_prv(int idx)
{
    if (idx == 0) {
        return PRV_S;
    }

    return PRV_M;
}

static int map_write_mode(int idx)
{
    if (idx == 0) {
        return SATP_MODE_OFF;
    }

    if (idx == 1) {
        return SATP_MODE_SV39;
    }

    if (idx == 2) {
        return SATP_MODE_SV48;
    }

    if (idx == 3) {
        return SATP_MODE_SV57;
    }

    if (idx == 4) {
        return SATP_MODE_SV64;
    }

    return SATP_MODE_RESERVED;
}

static int map_old_valid_mode(int idx, int max_vaddr_bits)
{
    if (idx == 0) {
        return SATP_MODE_OFF;
    }

    if (idx == 1) {
        return SATP_MODE_SV39;
    }

    if (idx == 2) {
        if (max_vaddr_bits >= 48) {
            return SATP_MODE_SV48;
        }

        return SATP_MODE_SV39;
    }

    if (max_vaddr_bits >= 57) {
        return SATP_MODE_SV57;
    }

    if (max_vaddr_bits >= 48) {
        return SATP_MODE_SV48;
    }

    return SATP_MODE_SV39;
}

static void compute_new_satp(
    int has_mmu,
    int impl_mmu_asid,
    int max_vaddr_bits,
    int paddr_bits,
    int old_mode,
    int old_asid,
    int old_ppn,
    int write_mode,
    int write_asid,
    int write_ppn,
    int *new_mode,
    int *new_asid,
    int *new_ppn)
{
    if (!has_mmu) {
        *new_mode = SATP_MODE_OFF;
        *new_asid = 0;
        *new_ppn = 0;
        return;
    }

    if (satp_mode_valid(write_mode, max_vaddr_bits)) {
        *new_mode = write_mode;
    } else {
        *new_mode = old_mode;
    }

    *new_asid = mask_asid(write_asid, impl_mmu_asid);
    *new_ppn = mask_ppn(write_ppn, paddr_bits);
}

static int write_satp_target(
    int target_is_vsatp,
    int has_mmu,
    int impl_mmu_asid,
    int max_vaddr_bits,
    int paddr_bits,
    int satp_old_mode,
    int satp_old_asid,
    int satp_old_ppn,
    int vsatp_old_mode,
    int vsatp_old_asid,
    int vsatp_old_ppn,
    int write_mode,
    int write_asid,
    int write_ppn,
    int *satp_new_mode,
    int *satp_new_asid,
    int *satp_new_ppn,
    int *vsatp_new_mode,
    int *vsatp_new_asid,
    int *vsatp_new_ppn,
    int *tlb_flushed)
{
    int old_mode;
    int old_asid;
    int old_ppn;

    int new_mode;
    int new_asid;
    int new_ppn;

    if (target_is_vsatp) {
        old_mode = vsatp_old_mode;
        old_asid = vsatp_old_asid;
        old_ppn = vsatp_old_ppn;
    } else {
        old_mode = satp_old_mode;
        old_asid = satp_old_asid;
        old_ppn = satp_old_ppn;
    }

    compute_new_satp(
        has_mmu,
        impl_mmu_asid,
        max_vaddr_bits,
        paddr_bits,
        old_mode,
        old_asid,
        old_ppn,
        write_mode,
        write_asid,
        write_ppn,
        &new_mode,
        &new_asid,
        &new_ppn
    );

    if (new_mode != old_mode || new_asid != old_asid || new_ppn != old_ppn) {
        *tlb_flushed = 1;
    }

    if (target_is_vsatp) {
        *satp_new_mode = satp_old_mode;
        *satp_new_asid = satp_old_asid;
        *satp_new_ppn = satp_old_ppn;

        *vsatp_new_mode = new_mode;
        *vsatp_new_asid = new_asid;
        *vsatp_new_ppn = new_ppn;
    } else {
        *satp_new_mode = new_mode;
        *satp_new_asid = new_asid;
        *satp_new_ppn = new_ppn;

        *vsatp_new_mode = vsatp_old_mode;
        *vsatp_new_asid = vsatp_old_asid;
        *vsatp_new_ppn = vsatp_old_ppn;
    }

    return EXC_NONE;
}

static int write_virtualized_satp(
    int has_mmu,
    int v,
    int prv,
    int hstatus_vtvm,
    int mstatus_tvm,
    int impl_mmu_asid,
    int max_vaddr_bits,
    int paddr_bits,
    int satp_old_mode,
    int satp_old_asid,
    int satp_old_ppn,
    int vsatp_old_mode,
    int vsatp_old_asid,
    int vsatp_old_ppn,
    int write_mode,
    int write_asid,
    int write_ppn,
    int *satp_new_mode,
    int *satp_new_asid,
    int *satp_new_ppn,
    int *vsatp_new_mode,
    int *vsatp_new_asid,
    int *vsatp_new_ppn,
    int *target_is_vsatp,
    int *tlb_flushed)
{
    *satp_new_mode = satp_old_mode;
    *satp_new_asid = satp_old_asid;
    *satp_new_ppn = satp_old_ppn;

    *vsatp_new_mode = vsatp_old_mode;
    *vsatp_new_asid = vsatp_old_asid;
    *vsatp_new_ppn = vsatp_old_ppn;

    *target_is_vsatp = 0;
    *tlb_flushed = 0;

    if (v) {
        *target_is_vsatp = 1;

        if (hstatus_vtvm) {
            return EXC_VIRTUAL_INSTRUCTION;
        }

        return write_satp_target(
            1,
            has_mmu,
            impl_mmu_asid,
            max_vaddr_bits,
            paddr_bits,
            satp_old_mode,
            satp_old_asid,
            satp_old_ppn,
            vsatp_old_mode,
            vsatp_old_asid,
            vsatp_old_ppn,
            write_mode,
            write_asid,
            write_ppn,
            satp_new_mode,
            satp_new_asid,
            satp_new_ppn,
            vsatp_new_mode,
            vsatp_new_asid,
            vsatp_new_ppn,
            tlb_flushed
        );
    }

    *target_is_vsatp = 0;

    if (mstatus_tvm && prv != PRV_M) {
        return EXC_ILLEGAL_INSTRUCTION;
    }

    return write_satp_target(
        0,
        has_mmu,
        impl_mmu_asid,
        max_vaddr_bits,
        paddr_bits,
        satp_old_mode,
        satp_old_asid,
        satp_old_ppn,
        vsatp_old_mode,
        vsatp_old_asid,
        vsatp_old_ppn,
        write_mode,
        write_asid,
        write_ppn,
        satp_new_mode,
        satp_new_asid,
        satp_new_ppn,
        vsatp_new_mode,
        vsatp_new_asid,
        vsatp_new_ppn,
        tlb_flushed
    );
}

int main(void)
{
    int has_mmu_idx;
    int v_idx;
    int prv_idx;
    int hstatus_vtvm_idx;
    int mstatus_tvm_idx;
    int impl_mmu_asid_idx;
    int max_vaddr_bits_idx;
    int paddr_bits_idx;

    int satp_old_mode_idx;
    int satp_old_asid;
    int satp_old_ppn;

    int vsatp_old_mode_idx;
    int vsatp_old_asid;
    int vsatp_old_ppn;

    int write_mode_idx;
    int write_asid;
    int write_ppn;

    klee_make_symbolic(&has_mmu_idx, sizeof(has_mmu_idx), "has_mmu_idx");
    klee_make_symbolic(&v_idx, sizeof(v_idx), "v_idx");
    klee_make_symbolic(&prv_idx, sizeof(prv_idx), "prv_idx");
    klee_make_symbolic(&hstatus_vtvm_idx, sizeof(hstatus_vtvm_idx), "hstatus_vtvm_idx");
    klee_make_symbolic(&mstatus_tvm_idx, sizeof(mstatus_tvm_idx), "mstatus_tvm_idx");
    klee_make_symbolic(&impl_mmu_asid_idx, sizeof(impl_mmu_asid_idx), "impl_mmu_asid_idx");
    klee_make_symbolic(&max_vaddr_bits_idx, sizeof(max_vaddr_bits_idx), "max_vaddr_bits_idx");
    klee_make_symbolic(&paddr_bits_idx, sizeof(paddr_bits_idx), "paddr_bits_idx");

    klee_make_symbolic(&satp_old_mode_idx, sizeof(satp_old_mode_idx), "satp_old_mode_idx");
    klee_make_symbolic(&satp_old_asid, sizeof(satp_old_asid), "satp_old_asid");
    klee_make_symbolic(&satp_old_ppn, sizeof(satp_old_ppn), "satp_old_ppn");

    klee_make_symbolic(&vsatp_old_mode_idx, sizeof(vsatp_old_mode_idx), "vsatp_old_mode_idx");
    klee_make_symbolic(&vsatp_old_asid, sizeof(vsatp_old_asid), "vsatp_old_asid");
    klee_make_symbolic(&vsatp_old_ppn, sizeof(vsatp_old_ppn), "vsatp_old_ppn");

    klee_make_symbolic(&write_mode_idx, sizeof(write_mode_idx), "write_mode_idx");
    klee_make_symbolic(&write_asid, sizeof(write_asid), "write_asid");
    klee_make_symbolic(&write_ppn, sizeof(write_ppn), "write_ppn");

    klee_assume(has_mmu_idx >= 0);
    klee_assume(has_mmu_idx <= 1);

    klee_assume(v_idx >= 0);
    klee_assume(v_idx <= 1);

    klee_assume(prv_idx >= 0);
    klee_assume(prv_idx <= 1);

    klee_assume(hstatus_vtvm_idx >= 0);
    klee_assume(hstatus_vtvm_idx <= 1);

    klee_assume(mstatus_tvm_idx >= 0);
    klee_assume(mstatus_tvm_idx <= 1);

    klee_assume(impl_mmu_asid_idx >= 0);
    klee_assume(impl_mmu_asid_idx <= 1);

    klee_assume(max_vaddr_bits_idx >= 0);
    klee_assume(max_vaddr_bits_idx <= 2);

    klee_assume(paddr_bits_idx >= 0);
    klee_assume(paddr_bits_idx <= 2);

    klee_assume(satp_old_mode_idx >= 0);
    klee_assume(satp_old_mode_idx <= 3);

    klee_assume(vsatp_old_mode_idx >= 0);
    klee_assume(vsatp_old_mode_idx <= 3);

    klee_assume(satp_old_asid >= 0);
    klee_assume(satp_old_asid <= 3);

    klee_assume(satp_old_ppn >= 0);
    klee_assume(satp_old_ppn <= 3);

    klee_assume(vsatp_old_asid >= 0);
    klee_assume(vsatp_old_asid <= 3);

    klee_assume(vsatp_old_ppn >= 0);
    klee_assume(vsatp_old_ppn <= 3);

    klee_assume(write_mode_idx >= 0);
    klee_assume(write_mode_idx <= 5);

    klee_assume(write_asid >= 0);
    klee_assume(write_asid <= 3);

    klee_assume(write_ppn >= 0);
    klee_assume(write_ppn <= 3);

    int has_mmu = has_mmu_idx;
    int v = v_idx;
    int prv = map_prv(prv_idx);
    int hstatus_vtvm = hstatus_vtvm_idx;
    int mstatus_tvm = mstatus_tvm_idx;
    int impl_mmu_asid = impl_mmu_asid_idx;
    int max_vaddr_bits = map_max_vaddr_bits(max_vaddr_bits_idx);
    int paddr_bits = map_paddr_bits(paddr_bits_idx);

    int satp_old_mode = map_old_valid_mode(satp_old_mode_idx, max_vaddr_bits);
    int vsatp_old_mode = map_old_valid_mode(vsatp_old_mode_idx, max_vaddr_bits);
    int write_mode = map_write_mode(write_mode_idx);

    int satp_new_mode;
    int satp_new_asid;
    int satp_new_ppn;

    int vsatp_new_mode;
    int vsatp_new_asid;
    int vsatp_new_ppn;

    int target_is_vsatp;
    int tlb_flushed;

    int exc = write_virtualized_satp(
        has_mmu,
        v,
        prv,
        hstatus_vtvm,
        mstatus_tvm,
        impl_mmu_asid,
        max_vaddr_bits,
        paddr_bits,
        satp_old_mode,
        satp_old_asid,
        satp_old_ppn,
        vsatp_old_mode,
        vsatp_old_asid,
        vsatp_old_ppn,
        write_mode,
        write_asid,
        write_ppn,
        &satp_new_mode,
        &satp_new_asid,
        &satp_new_ppn,
        &vsatp_new_mode,
        &vsatp_new_asid,
        &vsatp_new_ppn,
        &target_is_vsatp,
        &tlb_flushed
    );

    int obs_has_mmu;
    int obs_v;
    int obs_prv;
    int obs_hstatus_vtvm;
    int obs_mstatus_tvm;
    int obs_impl_mmu_asid;
    int obs_max_vaddr_bits;
    int obs_paddr_bits;

    int obs_satp_old_mode;
    int obs_vsatp_old_mode;
    int obs_write_mode;

    int obs_exc;
    int obs_tlb_flushed;
    int obs_target_is_vsatp;

    int obs_satp_new_mode;
    int obs_satp_new_asid;
    int obs_satp_new_ppn;

    int obs_vsatp_new_mode;
    int obs_vsatp_new_asid;
    int obs_vsatp_new_ppn;

    klee_make_symbolic(&obs_has_mmu, sizeof(obs_has_mmu), "obs_has_mmu");
    klee_make_symbolic(&obs_v, sizeof(obs_v), "obs_v");
    klee_make_symbolic(&obs_prv, sizeof(obs_prv), "obs_prv");
    klee_make_symbolic(&obs_hstatus_vtvm, sizeof(obs_hstatus_vtvm), "obs_hstatus_vtvm");
    klee_make_symbolic(&obs_mstatus_tvm, sizeof(obs_mstatus_tvm), "obs_mstatus_tvm");
    klee_make_symbolic(&obs_impl_mmu_asid, sizeof(obs_impl_mmu_asid), "obs_impl_mmu_asid");
    klee_make_symbolic(&obs_max_vaddr_bits, sizeof(obs_max_vaddr_bits), "obs_max_vaddr_bits");
    klee_make_symbolic(&obs_paddr_bits, sizeof(obs_paddr_bits), "obs_paddr_bits");

    klee_make_symbolic(&obs_satp_old_mode, sizeof(obs_satp_old_mode), "obs_satp_old_mode");
    klee_make_symbolic(&obs_vsatp_old_mode, sizeof(obs_vsatp_old_mode), "obs_vsatp_old_mode");
    klee_make_symbolic(&obs_write_mode, sizeof(obs_write_mode), "obs_write_mode");

    klee_make_symbolic(&obs_exc, sizeof(obs_exc), "obs_exc");
    klee_make_symbolic(&obs_tlb_flushed, sizeof(obs_tlb_flushed), "obs_tlb_flushed");
    klee_make_symbolic(&obs_target_is_vsatp, sizeof(obs_target_is_vsatp), "obs_target_is_vsatp");

    klee_make_symbolic(&obs_satp_new_mode, sizeof(obs_satp_new_mode), "obs_satp_new_mode");
    klee_make_symbolic(&obs_satp_new_asid, sizeof(obs_satp_new_asid), "obs_satp_new_asid");
    klee_make_symbolic(&obs_satp_new_ppn, sizeof(obs_satp_new_ppn), "obs_satp_new_ppn");

    klee_make_symbolic(&obs_vsatp_new_mode, sizeof(obs_vsatp_new_mode), "obs_vsatp_new_mode");
    klee_make_symbolic(&obs_vsatp_new_asid, sizeof(obs_vsatp_new_asid), "obs_vsatp_new_asid");
    klee_make_symbolic(&obs_vsatp_new_ppn, sizeof(obs_vsatp_new_ppn), "obs_vsatp_new_ppn");

    klee_assume(obs_has_mmu == has_mmu);
    klee_assume(obs_v == v);
    klee_assume(obs_prv == prv);
    klee_assume(obs_hstatus_vtvm == hstatus_vtvm);
    klee_assume(obs_mstatus_tvm == mstatus_tvm);
    klee_assume(obs_impl_mmu_asid == impl_mmu_asid);
    klee_assume(obs_max_vaddr_bits == max_vaddr_bits);
    klee_assume(obs_paddr_bits == paddr_bits);

    klee_assume(obs_satp_old_mode == satp_old_mode);
    klee_assume(obs_vsatp_old_mode == vsatp_old_mode);
    klee_assume(obs_write_mode == write_mode);

    klee_assume(obs_exc == exc);
    klee_assume(obs_tlb_flushed == tlb_flushed);
    klee_assume(obs_target_is_vsatp == target_is_vsatp);

    klee_assume(obs_satp_new_mode == satp_new_mode);
    klee_assume(obs_satp_new_asid == satp_new_asid);
    klee_assume(obs_satp_new_ppn == satp_new_ppn);

    klee_assume(obs_vsatp_new_mode == vsatp_new_mode);
    klee_assume(obs_vsatp_new_asid == vsatp_new_asid);
    klee_assume(obs_vsatp_new_ppn == vsatp_new_ppn);

    return 0;
}