.globl supervisor_to_user

supervisor_to_user:
li t6, 1 << 8
csrrc x0, sstatus, t6
la t6, branch_user
csrw sepc, t6
sret

branch_user:
ret