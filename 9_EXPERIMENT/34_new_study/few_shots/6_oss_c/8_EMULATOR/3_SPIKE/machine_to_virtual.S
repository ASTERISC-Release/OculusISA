.globl machine_to_virtual

machine_to_virtual:
csrw hgatp, zero
csrw vsatp, zero
li t6, 1 << 39
csrrc x0, mstatus, t6
li t6, 3 << 11
csrrc x0, mstatus, t6
li t6, 1 << 11
csrrs x0, mstatus, t6
li t6, 1 << 22
csrrc x0, mstatus, t6
la t6, hs_to_vs
csrw mepc, t6
li t6, 0
mret

hs_to_vs:
li t6, 1 << 7
csrrs x0, hstatus, t6
li t6, 1 << 8
csrrs x0, sstatus, t6
la t6, branch_virtual
csrw sepc, t6
li t6, 0
sret

branch_virtual:
ret