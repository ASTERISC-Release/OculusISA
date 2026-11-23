.globl machine_to_supervisor

machine_to_supervisor:
li t6, 3 << 11
csrrc x0, mstatus, t6
li t6, 1 << 11
csrrs x0, mstatus, t6
la t6, branch_supervisor
csrw mepc, t6
li t6, 0
mret

branch_supervisor:
ret