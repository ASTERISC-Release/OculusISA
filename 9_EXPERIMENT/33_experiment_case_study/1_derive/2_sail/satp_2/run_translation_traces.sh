#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces"
mkdir -p "$OUTDIR"

run_ld() {
  local priv="$1"
  local out="$OUTDIR/translation__${priv}__Bare__ld_x5_0_x6.trace"

  echo "[TRANSLATION] priv=$priv inst=ld x5, 0(x6)"

  if [[ "$priv" == "Machine" ]]; then
    timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
      -i "ld x5, 0(x6)" -s \
      -R satp="#x0000000000000000" \
      -R x6="#x0000000080000000" \
      > "$out" 2>&1 || true
  else
    timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
      -i "ld x5, 0(x6)" -s \
      -R cur_privilege="$priv" \
      -R satp="#x0000000000000000" \
      -R x6="#x0000000080000000" \
      > "$out" 2>&1 || true
  fi
}

run_sd() {
  local priv="$1"
  local out="$OUTDIR/translation__${priv}__Bare__sd_x5_0_x6.trace"

  echo "[TRANSLATION] priv=$priv inst=sd x5, 0(x6)"

  if [[ "$priv" == "Machine" ]]; then
    timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
      -i "sd x5, 0(x6)" -s \
      -R satp="#x0000000000000000" \
      -R x5="#x1122334455667788" \
      -R x6="#x0000000080000000" \
      > "$out" 2>&1 || true
  else
    timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
      -i "sd x5, 0(x6)" -s \
      -R cur_privilege="$priv" \
      -R satp="#x0000000000000000" \
      -R x5="#x1122334455667788" \
      -R x6="#x0000000080000000" \
      > "$out" 2>&1 || true
  fi
}

for priv in Machine Supervisor User; do
  run_ld "$priv"
  run_sd "$priv"
done

echo "translation trace files:"
find "$OUTDIR" -type f -name 'translation__*.trace' | wc -l
