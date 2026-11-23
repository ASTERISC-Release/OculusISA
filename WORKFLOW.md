# OculusISA Workflow

The following describes the workflow of OculusISA.

## Table of Contents

- [2_INPUT](#2_input)
- [3_SPECIFICATION](#3_specification)
- [4_INSTRUCTION](#4_instruction)
- [5_REGISTER](#5_register)
- [6_TEST_CASE](#6_test_case)
- [7_EMULATOR](#7_emulator)
- [MISCELLANEOUS](#miscellaneous)

## 2_INPUT

- The folder is `2_INPUT`.
- We use these repositories from the RISC-V team:
    - **RISC-V Opcodes**
    - **RISC-V Unified Database**
- These repositories provide metadata for instructions and registers, such as fields, extensions, instruction formats, and other architectural information.
- We also use the latest versions of the RISC-V specifications in PDF format:
    - **RISC-V Unprivileged Specification**
    - **RISC-V Privileged Specification**

## 3_SPECIFICATION

- The output folder is `3_SPECIFICATION`. The main notebook is `3_SPECIFICATION.ipynb`.
- This stage uses Python scripts without any LLM.
- The files `2_INPUT/1-riscv-unprivileged.pdf` and `2_INPUT/2-riscv-privileged.pdf` are first converted into a single TXT file.
- The TXT file is then split into multiple smaller TXT files, each representing one subchapter of the specification.

## 4_INSTRUCTION

- The output folder is `4_INSTRUCTION`. The main notebook is `4_INSTRUCTION.ipynb`.
- This stage uses an LLM.
- This stage extracts rules for **RISC-V instructions** using the specification text.
- The system searches the specification chunks for instruction-related information and uses the LLM to extract relevant descriptions.
- These descriptions are then converted into **structured rules** describing the behavior of each instruction.
- This process is similar to the RISC-V register extraction process. For more details, [see below](#5_register).

## 5_REGISTER

- The output folder is `5_REGISTER`. The main notebook is `5_REGISTER.ipynb`.
- This stage uses an LLM.
- For example, suppose we want to analyze the `mseccfg` register:
    1. The system first searches the specification chunks for the keyword **"mseccfg"**.
    2. Each candidate text chunk is then passed to the LLM with the question:  
      *"Does this text explain the `mseccfg` register?"*
    3. If the LLM answers **YES**, the chunk is kept. Otherwise, it is discarded. Essentially, Python is used to locate specification chunks containing the keyword, while the LLM verifies whether the chunk actually describes the register.
    4. For each relevant chunk, the LLM is asked to **extract information about the `mseccfg` register**.
    5. The extracted descriptions are then converted into **structured bullet-point rules**.
    6. Additional metadata such as **extensions** and **fields** may also be incorporated if they are not available from the metadata repositories.
    7. Lastly, generate **summary rules** from the **structured bullet-point rules** that help guide test case generation.

## 6_TEST_CASE

- The output folder is `6_TEST_CASE`. The main notebook is `6_TEST_CASE.ipynb`.
- This stage uses an LLM.
- Test cases are generated automatically based on the extracted rules.
- The system also retrieves metadata when necessary. For example, if a rule about `mseccfg` references `mstatus`, the metadata of `mstatus` will be included as background information.
- Instruction and register summaries related to the rule are also used to assist the LLM in generating meaningful test cases.
- In the final notebook cell, the system automatically copies the generated test cases to:
    - `7_EMULATOR/1_QEMU_XV6/TEXT/1_QEMU_XV6_INPUT.txt`
    - `7_EMULATOR/2_QEMU/TEXT/1_QEMU_INPUT.txt`
    - `7_EMULATOR/3_SPIKE/TEXT/1_SPIKE_INPUT.txt`
    - `7_EMULATOR/4_RVVM/TEXT/1_RVVM_INPUT.txt`
    - `7_EMULATOR/5_RENODE/TEXT/1_RENODE_INPUT.txt`

## 7_EMULATOR

- The output folder is `7_EMULATOR`.
- This stage uses Python scripts without any LLM.
- Currently, we have 5 RISC-V emulators:
    - **QEMU with xv6** - `7_EMULATOR/1_QEMU_XV6`
    - **QEMU without xv6** - `7_EMULATOR/2_QEMU`
    - **Spike without xv6** - `7_EMULATOR/3_SPIKE`
    - **RVVM without xv6** - `7_EMULATOR/4_RVVM`
    - **Renode without xv6** - `7_EMULATOR/5_RENODE`
- Explanation:
    - **QEMU with xv6:** xv6 is an educational operating system developed by the MIT PDOS group that runs on QEMU. It initializes the system state (e.g., registers, privilege modes, and memory) before executing the test.
    - **QEMU (and other emulators) without xv6:** The test runs directly on the emulator without xv6, so we initialize the system state before executing the test.
    - **Spike** is commonly used as a **golden reference** for RISC-V behavior.
- How to enable or disable a RISC-V extension in the emulator:
    - Extensions can be enabled or disabled in the **Makefile** when using **QEMU with xv6**.
    - For **emulators without xv6**, the extension configuration can be modified directly in the notebooks.
- Users can modify the files below to run different test cases:
    - `7_EMULATOR/1_QEMU_XV6/TEXT/1_QEMU_XV6_INPUT.txt`
    - `7_EMULATOR/2_QEMU/TEXT/1_QEMU_INPUT.txt`
    - `7_EMULATOR/3_SPIKE/TEXT/1_SPIKE_INPUT.txt`
    - `7_EMULATOR/4_RVVM/TEXT/1_RVVM_INPUT.txt`
    - `7_EMULATOR/5_RENODE/TEXT/1_RENODE_INPUT.txt`
- Various options are available to display register states and other execution details.

## MISCELLANEOUS

- The framework is designed to be run using **JupyterLab**, and the notebooks are intended to be executed sequentially from the first cell to the last.
- Users who want to inspect the prompts used by the LLM can view them directly in the notebooks.