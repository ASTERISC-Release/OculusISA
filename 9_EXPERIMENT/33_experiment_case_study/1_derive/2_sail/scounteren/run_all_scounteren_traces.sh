#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces"
mkdir -p "$OUTDIR"

sanitize() {
  echo "$1" | tr ' ,()' '____' | tr -cd 'A-Za-z0-9_'
}

run_isla() {
  local out="$1"
  shift
  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" "$@" > "$out" 2>&1 || true
}

cat > instructions_csr_access.txt <<'EOT'
csrr x5, scounteren
csrw scounteren, x6
csrrw x5, scounteren, x6
csrrs x5, scounteren, x6
csrrc x5, scounteren, x6
csrrwi x5, scounteren, 0
csrrwi x5, scounteren, 1
csrrsi x5, scounteren, 1
csrrci x5, scounteren, 1
EOT

cat > legalize_values.txt <<'EOT'
0000000000000000
0000000000000001
0000000000000002
0000000000000004
0000000000000007
0000000000000008
0000000080000000
00000000ffffffff
0000000100000000
ffffffffffffffff
EOT

echo "===== PART 1: CSR access ====="
for priv in Machine Supervisor User; do
  while IFS= read -r inst; do
    [[ -z "$inst" ]] && continue
    safe="$(sanitize "$inst")"
    out="$OUTDIR/csr__${priv}__${safe}.trace"

    echo "[CSR] priv=$priv inst=$inst"

    run_isla "$out" \
      -i "$inst" -s \
      -R cur_privilege="$priv" \
      -R x6="#x00000000ffffffff"
  done < instructions_csr_access.txt
done

echo "===== PART 2: legalize write/readback ====="
while IFS= read -r val; do
  [[ -z "$val" ]] && continue

  for priv in Machine Supervisor; do
    for inst in "csrw scounteren, x6" "csrrw x5, scounteren, x6"; do
      safe="$(sanitize "$inst")"
      out="$OUTDIR/legalize__${priv}__value_${val}__${safe}.trace"

      echo "[LEGALIZE] priv=$priv value=0x$val inst=$inst"

      run_isla "$out" \
        -i "$inst" -s \
        -R cur_privilege="$priv" \
        -R x6="#x$val"
    done
  done
done < legalize_values.txt

echo "===== SUMMARY ====="
echo -n "CSR trace files: "
find "$OUTDIR" -type f -name 'csr__*.trace' | wc -l

echo -n "Legalize trace files: "
find "$OUTDIR" -type f -name 'legalize__*.trace' | wc -l

echo -n "Total trace files: "
find "$OUTDIR" -type f -name '*.trace' | wc -l

echo "Tool errors:"
grep -Rni "panic\|panicked\|dumped core\|timeout\|error:" "$OUTDIR"/*.trace | head -80 || true
