#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

workspace="$(find . -maxdepth 3 -name '*.xcworkspace' -type d | sort | head -n 1)"
project="$(find . -maxdepth 3 -name '*.xcodeproj' -type d | sort | head -n 1)"
package="false"
if [[ -f Package.swift ]]; then
  package="true"
fi

list_json=""
if [[ -n "$workspace" ]]; then
  list_json="$(xcodebuild -list -json -workspace "$workspace" 2>/dev/null || true)"
elif [[ -n "$project" ]]; then
  list_json="$(xcodebuild -list -json -project "$project" 2>/dev/null || true)"
fi

schemes_json="[]"
if [[ -n "$list_json" ]]; then
  schemes_json="$(python3 - "$list_json" <<'PY'
import json
import sys

try:
    payload = json.loads(sys.argv[1])
except Exception:
    print("[]")
    raise SystemExit

project = payload.get("project") or payload.get("workspace") or {}
schemes = project.get("schemes") or []
print(json.dumps(schemes))
PY
)"
fi

python3 - "$workspace" "$project" "$package" "$schemes_json" <<'PY'
import json
import sys

workspace, project, package, schemes = sys.argv[1:5]
try:
    parsed_schemes = json.loads(schemes)
except Exception:
    parsed_schemes = []

print(json.dumps({
    "workspace": workspace or None,
    "project": project or None,
    "hasPackageSwift": package == "true",
    "schemes": parsed_schemes,
}, indent=2))
PY
