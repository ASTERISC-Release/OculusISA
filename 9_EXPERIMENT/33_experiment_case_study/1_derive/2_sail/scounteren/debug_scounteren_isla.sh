#!/usr/bin/env bash
set -euo pipefail

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

mkdir -p traces_debug

run_case() {
  local name="$1"
  shift
  local out="traces_debug/${name}.trace"

  echo "===== $name ====="
  timeout 60s "$ISLA" -A "$IR" -C "$CONFIG" "$@" > "$out" 2>&1 || true

  grep -nEi \
    "error|panic|panicked|parse|Type error|Privilege|cur_privilege|mcounteren|scounteren|cycle|counter|illegal|exception|mcause|read-reg|write-reg|Retired" \
    "$out" | head -160 || true
}

echo "===== READ-ONLY scounteren sanity ====="
run_case read_machine_scounteren \
  -i "csrr x5, scounteren" -s \
  -R cur_privilege="Machine"

run_case read_supervisor_scounteren \
  -i "csrr x5, scounteren" -s \
  -R cur_privilege="Supervisor"

run_case read_user_scounteren \
  -i "csrr x5, scounteren" -s \
  -R cur_privilege="User"

echo "===== WRITE scounteren minimal ====="
run_case write_supervisor_scounteren_x6_1 \
  -i "csrw scounteren, x6" -s \
  -R cur_privilege="Supervisor" \
  -R x6="#x0000000000000001"

echo "===== COUNTER ASSIGNMENT FORMAT PROBES ====="
run_case counter_user_no_assignment \
  -i "csrr x5, cycle" -s \
  -R cur_privilege="User"

run_case counter_user_raw32_enabled \
  -i "csrr x5, cycle" -s \
  -R cur_privilege="User" \
  -R mcounteren="#x00000001" \
  -R scounteren="#x00000001"

run_case counter_user_raw64_enabled \
  -i "csrr x5, cycle" -s \
  -R cur_privilege="User" \
  -R mcounteren="#x0000000000000001" \
  -R scounteren="#x0000000000000001"

run_case counter_supervisor_raw32_m_enabled \
  -i "csrr x5, cycle" -s \
  -R cur_privilege="Supervisor" \
  -R mcounteren="#x00000001" \
  -R scounteren="#x00000000"

run_case counter_supervisor_raw64_m_enabled \
  -i "csrr x5, cycle" -s \
  -R cur_privilege="Supervisor" \
  -R mcounteren="#x0000000000000001" \
  -R scounteren="#x0000000000000000"
