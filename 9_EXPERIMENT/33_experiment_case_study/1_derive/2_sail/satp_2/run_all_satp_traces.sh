#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces"
CSR_INSTRUCTIONS="$WORKDIR/instructions_csr_access.txt"
LEGALIZE_VALUES="$WORKDIR/legalize_values.txt"

mkdir -p "$OUTDIR"

if [[ ! -x "$ISLA" ]]; then
  echo "missing isla-footprint: $ISLA"
  exit 1
fi

if [[ ! -f "$IR" ]]; then
  echo "missing IR file: $IR"
  exit 1
fi

if [[ ! -f "$CONFIG" ]]; then
  echo "missing config file: $CONFIG"
  exit 1
fi

safe_name() {
  echo "$1" | sed 's/[^A-Za-z0-9]/_/g' | sed 's/__*/_/g' | sed 's/^_//' | sed 's/_$//'
}

echo "========== PART 1: CSR access traces =========="

for priv in Machine Supervisor User; do
  while IFS= read -r inst; do
    [[ -z "$inst" ]] && continue

    safe_inst="$(safe_name "$inst")"
    out="$OUTDIR/csr__${priv}__${safe_inst}.trace"

    echo "[CSR] priv=$priv inst=$inst"

    if [[ "$priv" == "Machine" ]]; then
      timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" -i "$inst" -s \
        > "$out" 2>&1 || true
    else
      timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" -i "$inst" -s -R cur_privilege="$priv" \
        > "$out" 2>&1 || true
    fi
  done < "$CSR_INSTRUCTIONS"
done

echo "========== PART 2: legalize/write-readback traces =========="

while IFS= read -r value; do
  [[ -z "$value" ]] && continue

  echo "[LEGALIZE] value=0x$value"

  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
    -i "csrw satp, x10" -s -R x10="#x$value" \
    > "$OUTDIR/legalize__Machine__csrw_satp_x10__x10_${value}.trace" 2>&1 || true

  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
    -i "csrrw x11, satp, x10" -s -R x10="#x$value" \
    > "$OUTDIR/legalize__Machine__csrrw_x11_satp_x10__x10_${value}.trace" 2>&1 || true

done < "$LEGALIZE_VALUES"

echo "========== SUMMARY =========="
echo -n "CSR trace files: "
find "$OUTDIR" -type f -name 'csr__*.trace' | wc -l

echo -n "Legalize trace files: "
find "$OUTDIR" -type f -name 'legalize__*.trace' | wc -l

echo -n "Total trace files: "
find "$OUTDIR" -type f -name '*.trace' | wc -l
