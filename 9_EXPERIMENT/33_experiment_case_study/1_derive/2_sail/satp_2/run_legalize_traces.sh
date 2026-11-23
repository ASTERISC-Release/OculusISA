#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces"
VALUES="$WORKDIR/legalize_values.txt"

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

while IFS= read -r value; do
  [[ -z "$value" ]] && continue

  echo "[RUN] value=0x$value"

  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
    -i "csrw satp, x10" -s -R x10="#x$value" \
    > "$OUTDIR/legalize__Machine__csrw_satp_x10__x10_${value}.trace" 2>&1 || true

  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
    -i "csrrw x11, satp, x10" -s -R x10="#x$value" \
    > "$OUTDIR/legalize__Machine__csrrw_x11_satp_x10__x10_${value}.trace" 2>&1 || true

done < "$VALUES"

echo "legalize trace files:"
find "$OUTDIR" -type f -name 'legalize__*.trace' | wc -l
