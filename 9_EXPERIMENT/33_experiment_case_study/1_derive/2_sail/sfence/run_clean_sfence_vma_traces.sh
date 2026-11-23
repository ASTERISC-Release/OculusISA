#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces_clean"
mkdir -p "$OUTDIR"

run_case() {
  local name="$1"
  shift
  local out="$OUTDIR/${name}.trace"

  echo "===== $name ====="
  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" "$@" > "$out" 2>&1 || true
}

echo "===== PART 1+2: SFENCE.VMA privilege + operand filters ====="

for priv in Machine Supervisor User; do
  run_case "sfence__${priv}__rs1_x0__rs2_x0" \
    -i "sfence.vma x0, x0" -s \
    -R cur_privilege="$priv"

  run_case "sfence__${priv}__rs1_x5__rs2_x0" \
    -i "sfence.vma x5, x0" -s \
    -R cur_privilege="$priv" \
    -R x5="#x0000000080001000"

  run_case "sfence__${priv}__rs1_x0__rs2_x6" \
    -i "sfence.vma x0, x6" -s \
    -R cur_privilege="$priv" \
    -R x6="#x000000000000002a"

  run_case "sfence__${priv}__rs1_x5__rs2_x6" \
    -i "sfence.vma x5, x6" -s \
    -R cur_privilege="$priv" \
    -R x5="#x0000000080001000" \
    -R x6="#x000000000000002a"
done

echo "===== PART 4: SINVAL.VMA sharing SFENCE.VMA behavior ====="

for priv in Machine Supervisor User; do
  run_case "sinval__${priv}__rs1_x0__rs2_x0" \
    -i "sinval.vma x0, x0" -s \
    -R cur_privilege="$priv"

  run_case "sinval__${priv}__rs1_x5__rs2_x6" \
    -i "sinval.vma x5, x6" -s \
    -R cur_privilege="$priv" \
    -R x5="#x0000000080001000" \
    -R x6="#x000000000000002a"
done

echo "===== PART 5: virtual privilege probe ====="

for priv in VirtualUser VirtualSupervisor; do
  run_case "virtual_probe__${priv}__sfence_rs1_x0__rs2_x0" \
    -i "sfence.vma x0, x0" -s \
    -R cur_privilege="$priv"
done

echo "===== SUMMARY ====="
echo -n "clean trace files: "
find "$OUTDIR" -type f -name '*.trace' | wc -l

echo "tool errors:"
grep -Rni "panic\|panicked\|dumped core\|timeout\|error:" "$OUTDIR"/*.trace | head -160 || true
