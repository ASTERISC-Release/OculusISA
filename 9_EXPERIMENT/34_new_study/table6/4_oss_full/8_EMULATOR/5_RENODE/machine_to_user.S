.globl machine_to_user

machine_to_user:
li t6, 3 << 11
csrrc x0, mstatus, t6
la t6, branch_user
csrw mepc, t6
li t6, 0
mret

branch_user:
ret