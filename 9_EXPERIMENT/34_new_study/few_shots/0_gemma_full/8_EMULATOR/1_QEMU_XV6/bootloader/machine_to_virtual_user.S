.globl machine_to_virtual_user

machine_to_virtual_user:
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
la t6, hs_to_vu
csrw mepc, t6
li t6, 0
mret

hs_to_vu:
li t6, 1 << 7
csrrs x0, hstatus, t6
li t6, 1 << 8
csrrc x0, sstatus, t6
la t6, branch_virtual_user
csrw sepc, t6
li t6, 0
sret

branch_virtual_user:
ret