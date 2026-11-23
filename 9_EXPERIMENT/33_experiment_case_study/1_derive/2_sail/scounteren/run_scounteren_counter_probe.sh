#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SAILOR="$HOME/tools/sailor_artifact"
ISLA="$SAILOR/isla/target/release/isla-footprint"
IR="$SAILOR/configs/riscv64-9454e6e8-IR-updated-init.ir"
CONFIG="$SAILOR/isla/configs/riscv64.toml"

OUTDIR="$WORKDIR/traces"
mkdir -p "$OUTDIR"

run_probe() {
  local priv="$1"
  local counter="$2"
  local mval="$3"
  local sval="$4"

  local out="$OUTDIR/counter_probe__${priv}__${counter}__m_${mval}__s_${sval}.trace"

  echo "[COUNTER PROBE] priv=$priv counter=$counter mcounteren=0x$mval scounteren=0x$sval"

  timeout 180s "$ISLA" -A "$IR" -C "$CONFIG" \
    -i "csrr x5, $counter" -s \
    -R cur_privilege="$priv" \
    -R mcounteren="(_ struct (|bits| #x${mval}))" \
    -R scounteren="(_ struct (|bits| #x${sval}))" \
    > "$out" 2>&1 || true

  echo "===== $out ====="
  grep -nEi "error|panic|panicked|unknown|unsupported|Privilege|cur_privilege|mcounteren|scounteren|cycle|time|instret|counter|illegal|exception|mcause|write-reg |x5|Retired" "$out" | head -120 || true
}

run_probe User cycle 00000001 00000001
run_probe User cycle 00000001 00000000
run_probe User cycle 00000000 00000001
run_probe Supervisor cycle 00000001 00000000
run_probe Supervisor cycle 00000000 00000000
run_probe Machine cycle 00000000 00000000
