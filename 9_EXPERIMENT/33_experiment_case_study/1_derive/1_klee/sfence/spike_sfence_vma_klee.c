#include <stdint.h>
#include <klee/klee.h>

#define PRV_U 0
#define PRV_S 1
#define PRV_M 3

#define EXC_NONE 0
#define EXC_ILLEGAL_INSTRUCTION 2
#define EXC_VIRTUAL_INSTRUCTION 22

typedef struct {
    int ext_s;
    int has_mmu;
    int v;
    int prv;
    int hstatus_vtvm;
    int mstatus_tvm;
    int tlb_flushed;
} spike_state_t;

static int require_extension_s(spike_state_t *s)
{
    if (!s->ext_s) {
        return EXC_ILLEGAL_INSTRUCTION;
    }
    return EXC_NONE;
}

static int require_has_mmu(spike_state_t *s)
{
    if (!s->has_mmu) {
        return EXC_ILLEGAL_INSTRUCTION;
    }
    return EXC_NONE;
}

static int require_privilege(spike_state_t *s, int required)
{
    if (s->prv < required) {
        return EXC_ILLEGAL_INSTRUCTION;
    }
    return EXC_NONE;
}

static int require_novirt(void)
{
    return EXC_VIRTUAL_INSTRUCTION;
}

static void flush_tlb(spike_state_t *s)
{
    s->tlb_flushed = 1;
}

static int sfence_vma_spike_slice(spike_state_t *s)
{
    int exc;

    exc = require_extension_s(s);
    if (exc != EXC_NONE) {
        return exc;
    }

    exc = require_has_mmu(s);
    if (exc != EXC_NONE) {
        return exc;
    }

    if (s->v) {
        if (s->prv == PRV_U) {
            return require_novirt();
        }

        if (s->hstatus_vtvm) {
            return require_novirt();
        }

        flush_tlb(s);
        return EXC_NONE;
    }

    if (s->mstatus_tvm) {
        exc = require_privilege(s, PRV_M);
        if (exc != EXC_NONE) {
            return exc;
        }

        flush_tlb(s);
        return EXC_NONE;
    }

    exc = require_privilege(s, PRV_S);
    if (exc != EXC_NONE) {
        return exc;
    }

    flush_tlb(s);
    return EXC_NONE;
}

int main(void)
{
    int ext_s;
    int has_mmu;
    int v;
    int prv;
    int hstatus_vtvm;
    int mstatus_tvm;

    klee_make_symbolic(&ext_s, sizeof(ext_s), "ext_s");
    klee_make_symbolic(&has_mmu, sizeof(has_mmu), "has_mmu");
    klee_make_symbolic(&v, sizeof(v), "v");
    klee_make_symbolic(&prv, sizeof(prv), "prv");
    klee_make_symbolic(&hstatus_vtvm, sizeof(hstatus_vtvm), "hstatus_vtvm");
    klee_make_symbolic(&mstatus_tvm, sizeof(mstatus_tvm), "mstatus_tvm");

    klee_assume(ext_s >= 0);
    klee_assume(ext_s <= 1);

    klee_assume(has_mmu >= 0);
    klee_assume(has_mmu <= 1);

    klee_assume(v >= 0);
    klee_assume(v <= 1);

    klee_assume(prv >= 0);
    klee_assume(prv <= 3);
    klee_assume(prv != 2);

    klee_assume(hstatus_vtvm >= 0);
    klee_assume(hstatus_vtvm <= 1);

    klee_assume(mstatus_tvm >= 0);
    klee_assume(mstatus_tvm <= 1);

    spike_state_t s;

    s.ext_s = ext_s;
    s.has_mmu = has_mmu;
    s.v = v;
    s.prv = prv;
    s.hstatus_vtvm = hstatus_vtvm;
    s.mstatus_tvm = mstatus_tvm;
    s.tlb_flushed = 0;

    int exc = sfence_vma_spike_slice(&s);

    int obs_exc;
    int obs_tlb_flushed;

    klee_make_symbolic(&obs_exc, sizeof(obs_exc), "obs_exc");
    klee_make_symbolic(&obs_tlb_flushed, sizeof(obs_tlb_flushed), "obs_tlb_flushed");

    klee_assume(obs_exc == exc);
    klee_assume(obs_tlb_flushed == s.tlb_flushed);

    return 0;
}