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

echo "===== PART 1: scounteren CSR read access ====="
for priv in Machine Supervisor User; do
  run_case "csr_read__${priv}__scounteren" \
    -i "csrr x5, scounteren" -s \
    -R cur_privilege="$priv"
done

echo "===== PART 2: scounteren write/legalize probe ====="
for priv in Machine Supervisor; do
  for val in 0000000000000000 0000000000000001 00000000ffffffff ffffffffffffffff; do
    run_case "write_probe__${priv}__value_${val}__csrw_scounteren_x6" \
      -i "csrw scounteren, x6" -s \
      -R cur_privilege="$priv" \
      -R x6="#x${val}"
  done
done

echo "===== PART 3: counter access effect, symbolic mcounteren/scounteren ====="
for priv in Machine Supervisor User; do
  for counter in cycle time instret hpmcounter3; do
    run_case "counter_access__${priv}__${counter}" \
      -i "csrr x5, ${counter}" -s \
      -R cur_privilege="$priv"
  done
done

echo "===== SUMMARY ====="
echo -n "clean trace files: "
find "$OUTDIR" -type f -name '*.trace' | wc -l

echo "tool errors:"
grep -Rni "panic\|panicked\|dumped core\|timeout\|error:" "$OUTDIR"/*.trace | head -120 || true
