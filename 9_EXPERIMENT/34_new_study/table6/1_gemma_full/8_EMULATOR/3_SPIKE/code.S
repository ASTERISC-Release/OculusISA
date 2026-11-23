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
csrw mcause, x0

# Make the initial PC the same across emulators for AUIPC
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
li x0, 0
c.addi x0, 0

# 1 # Extension Must Be Active: V
# Many important RISC-V extensions are currently active.
# Test Case Name: ADD
# Test Case Type: INSTRUCTION
# Test Case Rule: RULE 1: In the RV64I ISA, the ADD instruction MUST add its two source registers as 64-bit integers and write the 64-bit sum to the destination register.
##### ASSEMBLY #####
li t0, 0x5
li t1, 0xa
add t2, t0, t1
# Result: t2 = 15

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