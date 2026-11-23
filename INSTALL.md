# Installation Guide

Below is the installation guide for OculusISA.

## Table of Contents

- [QEMU, Spike, RVVM, Renode, and RISC-V Toolchain Setup](#qemu-spike-rvvm-renode-and-risc-v-toolchain-setup)
- [Python Setup](#python-setup)

## QEMU, Spike, RVVM, Renode, and RISC-V Toolchain Setup

1. Make these scripts executable in the following directories:

```bash
chmod +x 1_INSTALL/1_INSTALL_RISCV_GNU_TOOLCHAIN.sh 1_INSTALL/2_INSTALL_QEMU.sh 1_INSTALL/3_INSTALL_SPIKE.sh 1_INSTALL/4_INSTALL_RVVM.sh 1_INSTALL/5_INSTALL_RENODE.sh 7_EMULATOR/1_QEMU_XV6/run
```

2. To install RISC-V Toolchain, run `1_INSTALL/1_INSTALL_RISCV_GNU_TOOLCHAIN.sh`.
3. To install QEMU, run `1_INSTALL/2_INSTALL_QEMU.sh`.
4. To install Spike, run `1_INSTALL/3_INSTALL_SPIKE.sh`.
5. To install RVVM, run `1_INSTALL/4_INSTALL_RVVM.sh`.
6. To install Renode, run `1_INSTALL/5_INSTALL_RENODE.sh`.

## Python Setup

1. Install Python virtual environment support:

```bash
sudo apt install -y python3 python3-venv python3-pip
```

2. Create a Python virtual environment:

```bash
python3 -m venv ~/oculus_isa_venv
```

3. Activate the virtual environment:

```bash
source ~/oculus_isa_venv/bin/activate
```

4. Upgrade pip:

```bash
pip install --upgrade pip
```

5. Install required Python dependencies:

```bash
pip install -U pwntools jupyterlab docling ollama
```

6. Run **JupyterLab**:

```bash
jupyter lab
```