#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: build-run-screenshot.sh <repo> <scheme> <bundle-id> [device]" >&2
  exit 2
fi

ROOT="$1"
SCHEME="$2"
BUNDLE_ID="$3"
DEVICE="${4:-iPhone 16 Pro}"
DERIVED_DATA="${TMPDIR:-/tmp}/ios-design-derived-data/${SCHEME}"
OUTPUT_DIR="${TMPDIR:-/tmp}/ios-design-screenshots/${SCHEME}"

cd "$ROOT"

workspace="$(find . -maxdepth 3 -name '*.xcworkspace' -type d | sort | head -n 1)"
project="$(find . -maxdepth 3 -name '*.xcodeproj' -type d | sort | head -n 1)"

if [[ -n "$workspace" ]]; then
  container_args=(-workspace "$workspace")
elif [[ -n "$project" ]]; then
  container_args=(-project "$project")
else
  echo "No .xcworkspace or .xcodeproj found under $ROOT" >&2
  exit 1
fi

xcrun simctl boot "$DEVICE" >/dev/null 2>&1 || true
xcrun simctl bootstatus "$DEVICE" -b >/dev/null

xcodebuild \
  "${container_args[@]}" \
  -scheme "$SCHEME" \
  -destination "platform=iOS Simulator,name=$DEVICE" \
  -derivedDataPath "$DERIVED_DATA" \
  build

app_path="$(find "$DERIVED_DATA/Build/Products" -path '*-iphonesimulator/*.app' -type d | sort | head -n 1)"
if [[ -z "$app_path" ]]; then
  echo "Build succeeded but no simulator .app was found in $DERIVED_DATA" >&2
  exit 1
fi

xcrun simctl install booted "$app_path"
xcrun simctl launch booted "$BUNDLE_ID"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/capture-simulator-matrix.sh" "$BUNDLE_ID" "$OUTPUT_DIR" "$DEVICE"
