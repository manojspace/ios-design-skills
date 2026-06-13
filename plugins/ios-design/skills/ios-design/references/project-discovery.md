# Project Discovery

Before editing or running an iOS app, identify the project shape and the narrowest runnable target.

## Inspect

Use targeted commands:

```bash
find . -maxdepth 3 \( -name '*.xcworkspace' -o -name '*.xcodeproj' -o -name Package.swift \) -print
xcodebuild -list -json -workspace App.xcworkspace
xcodebuild -list -json -project App.xcodeproj
```

Prefer a workspace over a project when both exist. Prefer an app scheme over test, package, extension, or watch schemes.

## Determine

- Workspace/project path.
- App scheme.
- Bundle identifier.
- Deployment target.
- Simulator device.
- Existing design system and asset catalogs.
- Whether SwiftUI previews, XcodeBuildMCP, or shell fallback is available.

## Bundle Identifier

If the bundle id is not obvious from build settings, use:

```bash
xcodebuild -showBuildSettings -scheme <Scheme> -destination 'generic/platform=iOS Simulator' | rg 'PRODUCT_BUNDLE_IDENTIFIER|INFOPLIST_FILE'
```

If multiple app targets are plausible, inspect the app entry point and scheme names before building.

## Derived Data

Keep generated build output outside the repo or in an ignored disposable path:

```bash
DERIVED_DATA="${TMPDIR:-/tmp}/ios-design-derived-data"
```
