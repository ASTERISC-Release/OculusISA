#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"

ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

INSTRUCTIONS="$WORKDIR/instructions.txt"
OUTDIR="$WORKDIR/traces"

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

for priv in Machine Supervisor User; do
  while IFS= read -r inst; do
    [[ -z "$inst" ]] && continue

    safe_inst="$(echo "$inst" | tr ' ,./' '_____')"
    out="$OUTDIR/${priv}_${safe_inst}.trace"

    echo "[RUN] priv=$priv inst=$inst"

    if [[ "$priv" == "Machine" ]]; then
      timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" -i "$inst" -s \
        > "$out" 2>&1 || true
    else
      timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" -i "$inst" -s -R cur_privilege="$priv" \
        > "$out" 2>&1 || true
    fi
  done < "$INSTRUCTIONS"
done

echo "trace files:"
find "$OUTDIR" -type f | wc -l
