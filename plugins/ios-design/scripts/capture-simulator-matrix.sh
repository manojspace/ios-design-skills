#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: capture-simulator-matrix.sh <bundle-id> <output-dir> [device]" >&2
  exit 2
fi

BUNDLE_ID="$1"
OUTPUT_DIR="$2"
DEVICE="${3:-iPhone 16 Pro}"

mkdir -p "$OUTPUT_DIR"

xcrun simctl boot "$DEVICE" >/dev/null 2>&1 || true
xcrun simctl bootstatus "$DEVICE" -b >/dev/null

capture() {
  local name="$1"
  xcrun simctl launch booted "$BUNDLE_ID" >/dev/null
  sleep 1
  xcrun simctl io booted screenshot "$OUTPUT_DIR/${name}.png" >/dev/null
}

xcrun simctl ui booted appearance light
xcrun simctl ui booted content_size large
xcrun simctl ui booted increase_contrast disabled
capture "light"

xcrun simctl ui booted appearance dark
capture "dark"

xcrun simctl ui booted appearance light
xcrun simctl ui booted content_size extra-extra-extra-large
capture "large-type"

xcrun simctl ui booted content_size accessibility-extra-extra-large
capture "accessibility-type"

xcrun simctl ui booted content_size large
xcrun simctl ui booted increase_contrast enabled
capture "increased-contrast"

xcrun simctl ui booted increase_contrast disabled

printf '%s\n' "$OUTPUT_DIR"
