# OculusISA

OculusISA is an LLM-based framework designed to automatically generate and execute test cases for RISC-V emulators. The workflow is notebook-driven and focuses on instruction-level and register-level behavioral exploration under different RISC-V extension configurations.

## Table of Contents

1. [Installation Guide (INSTALL.md)](INSTALL.md)
2. [OculusISA Workflow (WORKFLOW.md)](WORKFLOW.md)
3. [Generate Rules for Instructions](#generate-rules-for-instructions)
4. [Generate Rules for Registers](#generate-rules-for-registers)
5. [Generate Test Cases](#generate-test-cases)
6. [Run Test Cases on RISC-V Emulators](#run-test-cases-on-risc-v-emulators)
7. [LLM Configuration](#llm-configuration)

## Generate Rules for Instructions

1. Open `4_INSTRUCTION.ipynb` for the old system. To try the new system, open `4_INSTRUCTION_NEW.ipynb`.
2. Edit this to use specific instructions only:

```python
### CHANGE HERE ###
LIST_INSTRUCTION_WANTED = ['CSRRWI', 'ADDIW']
IS_USING_EVERYTHING = False # Set this to True if you want to use all possible instructions
### CHANGE HERE ###
```

3. Run all cells from the first cell to the last.

- The final output will be in `4_INSTRUCTION/1_OUTPUT/6_INSTRUCTION_TOTAL.txt`.
- The final output will contain RISC-V **instruction rules**.
- You can view the LLM conversation history in the following folder: `4_INSTRUCTION/2_HISTORY`.

## Generate Rules for Registers

1. Open `5_REGISTER.ipynb` for the old system. To try the new system, open `5_REGISTER_NEW.ipynb`.
2. Edit this for using specific registers only:

```python
### CHANGE HERE ###
LIST_REGISTER_WANTED = ['mcounteren', 'mseccfg']
IS_USING_EVERYTHING = False # Set this to True if you want to use all possible registers
### CHANGE HERE ###
```

3. Run all cells from the first cell to the last.

- The final output will be in `5_REGISTER/1_OUTPUT/8_REGISTER_TOTAL.txt`.
- The final output will contain RISC-V **register rules**.
- You can view the LLM conversation history in the following folder: `5_REGISTER/2_HISTORY`.

## Generate Test Cases

1. Open `6_TEST_CASE.ipynb`.
2. Edit this to use specific instructions or registers with selected rule pairs only:

```python
### CHANGE ###
LIST_WANT = [('mcause', [1, 2])] # Example: use only mcause with its 1st and 2nd rules
IS_USING_EVERYTHING = True # Set this to True if you want to use all instruction and register rule pairs
### CHANGE ###
```

3. Run all cells from the first cell to the last.

- The final output will be in `6_TEST_CASE/3_TEST_CASE_REVISED_3.txt`.
- The final output will contain RISC-V **assembly test cases**.
- You can view the LLM conversation history in the following file: `6_TEST_CASE/4_HISTORY_TEST_CASE.txt`.
- The final output will be automatically copied to:
    - `7_EMULATOR/1_QEMU_XV6/TEXT/1_QEMU_XV6_INPUT.txt`
    - `7_EMULATOR/2_QEMU/TEXT/1_QEMU_INPUT.txt`
    - `7_EMULATOR/3_SPIKE/TEXT/1_SPIKE_INPUT.txt`
    - `7_EMULATOR/4_RVVM/TEXT/1_RVVM_INPUT.txt`
    - `7_EMULATOR/5_RENODE/TEXT/1_RENODE_INPUT.txt`

## Run Test Cases on RISC-V Emulators

1. Open `7_EMULATOR/1_QEMU_XV6/QEMU_XV6.ipynb`.
2. Run all cells from the first cell to the last.

- The final output will be in:
    - `7_EMULATOR/1_QEMU_XV6/TEXT/2_QEMU_XV6_RUN.txt`
    - `7_EMULATOR/1_QEMU_XV6/TEXT/3_QEMU_XV6_CHECK.txt`
- Currently, 5 emulators are available in the `7_EMULATOR` directory:
    - **QEMU with xv6** - `7_EMULATOR/1_QEMU_XV6`
    - **QEMU without xv6** - `7_EMULATOR/2_QEMU`
    - **Spike without xv6** - `7_EMULATOR/3_SPIKE`
    - **RVVM without xv6** - `7_EMULATOR/4_RVVM`
    - **Renode without xv6** - `7_EMULATOR/5_RENODE`
- We use **QEMU with xv6** in the steps above.
- The final output will contain **QEMU logs** that show discrepancies between QEMU register results and the LLM-expected register results, indicating which test cases trigger specification mismatches in QEMU.
- **Tip:** To identify which rule generated a particular test case, check `6_TEST_CASE/4_HISTORY_TEST_CASE.txt` and match it with the corresponding test case number in `7_EMULATOR/1_QEMU_XV6/TEXT/2_QEMU_XV6_RUN.txt`.

## LLM Configuration

This project can use different LLM setups. By default, we use the following setup:

- Model: `gpt-oss:120b`
- Runtime: `ollama`
- Context window: `16384`
- Temperature: `1.0` (recommended in the gpt-oss documentation)