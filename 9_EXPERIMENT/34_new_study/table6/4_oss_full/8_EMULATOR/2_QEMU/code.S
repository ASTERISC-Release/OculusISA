.section .data
.balign 16
data:
.zero 4096
data_end:
.section .text
.globl _start
.globl test_start
_start:
test_start:
li t0, (1 << 8) | (1 << 9) # ECALL from U and S
csrrc x0, medeleg, t0
li a0, -1
srli a0, a0, 2
csrw pmpaddr0, a0
li a0, 0x0f
csrw pmpcfg0, a0
la t0, trap_vector
csrw mtvec, t0
csrs mstatus, 1 << 3
csrr t0, mhartid
mv tp, t0
csrr t1, mstatus
li t2, 0x1800
not t3, t2
and t1, t1, t3
li t3, (3 << 11)
or t1, t1, t3
li t2, (1 << 13)
or t1, t1, t2
li t2, (1 << 10)
or t1, t1, t2
csrw mstatus, t1
csrw satp, zero
li t0, -1
srli t0, t0, 2
csrw pmpaddr0, t0
li t0, 0x0f
csrw pmpcfg0, t0
li t0, 0xffff
csrw mideleg, t0
csrr t1, sie
li t0, ((1<<1) | (1<<5) | (1<<9))
or t1, t1, t0
csrw sie, t1
la t0, trap_vector
csrw mtvec, t0
li x0, 0
li x1, 0
li x2, 0
li x3, 0
li x4, 0
li x5, 0
li x6, 0
li x7, 0
li x8, 0
li x9, 0
li x10, 0
li x11, 0
li x12, 0
li x13, 0
li x14, 0
li x15, 0
li x16, 0
li x17, 0
li x18, 0
li x19, 0
li x20, 0
li x21, 0
li x22, 0
li x23, 0
li x24, 0
li x25, 0
li x26, 0
li x27, 0
li x28, 0
li x29, 0
li x30, 0
li x31, 0
fmv.d.x f0, x0
fmv.d.x f1, x0
fmv.d.x f2, x0
fmv.d.x f3, x0
fmv.d.x f4, x0
fmv.d.x f5, x0
fmv.d.x f6, x0
fmv.d.x f7, x0
fmv.d.x f8, x0
fmv.d.x f9, x0
fmv.d.x f10, x0
fmv.d.x f11, x0
fmv.d.x f12, x0
fmv.d.x f13, x0
fmv.d.x f14, x0
fmv.d.x f15, x0
fmv.d.x f16, x0
fmv.d.x f17, x0
fmv.d.x f18, x0
fmv.d.x f19, x0
fmv.d.x f20, x0
fmv.d.x f21, x0
fmv.d.x f22, x0
fmv.d.x f23, x0
fmv.d.x f24, x0
fmv.d.x f25, x0
fmv.d.x f26, x0
fmv.d.x f27, x0
fmv.d.x f28, x0
fmv.d.x f29, x0
fmv.d.x f30, x0
fmv.d.x f31, x0
vsetvli x0, x0, e32, m1, ta, ma
vmv.v.i v0, 0
vmv.v.i v1, 0
vmv.v.i v2, 0
vmv.v.i v3, 0
vmv.v.i v4, 0
vmv.v.i v5, 0
vmv.v.i v6, 0
vmv.v.i v7, 0
vmv.v.i v8, 0
vmv.v.i v9, 0
vmv.v.i v10, 0
vmv.v.i v11, 0
vmv.v.i v12, 0
vmv.v.i v13, 0
vmv.v.i v14, 0
vmv.v.i v15, 0
vmv.v.i v16, 0
vmv.v.i v17, 0
vmv.v.i v18, 0
vmv.v.i v19, 0
vmv.v.i v20, 0
vmv.v.i v21, 0
vmv.v.i v22, 0
vmv.v.i v23, 0
vmv.v.i v24, 0
vmv.v.i v25, 0
vmv.v.i v26, 0
vmv.v.i v27, 0
vmv.v.i v28, 0
vmv.v.i v29, 0
vmv.v.i v30, 0
vmv.v.i v31, 0
csrw mcause, x0

# Make the initial PC the same across emulators for AUIPC
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
c.addi x0, 0

# 368 # Extension Must Be Active: NONE
# Many important RISC-V extensions are currently active.
# Test Case Name: scounteren
# Test Case Type: REGISTER
# Test Case Rule: RULE 29: In M-mode, writing -1 to the scounteren register must not set it to -1 or 0xffffffff (scounteren != -1 & scounteren != 0xffffffff).
##### ASSEMBLY #####
li t0, 0xffffffffffffffff
csrw scounteren, t0
csrr t1, scounteren
# Result: t1 != 0xffffffffffffffff && t1 != 0xffffffff

test_end:
j test_end

j .
.align 2
trap_vector:
csrr t5, mcause
csrr s1, mepc
addi s1, s1, 4
csrw mepc, s1
mret
spin:
j spin