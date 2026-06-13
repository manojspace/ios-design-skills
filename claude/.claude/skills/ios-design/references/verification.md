# Verification

For visual work in a runnable app, verify by looking at screenshots. Builds are useful, screenshots are decisive.

## Preferred Order

1. Use Claude Code's `/run` and `/verify` skills when they can launch the app correctly.
2. Use the bundled shell scripts as fallback.
3. If the app cannot run locally, state exactly what was not visually verified.

## Shell Fallback

Discover:

```bash
scripts/discover-ios-project.sh .
```

Build, install, launch, capture:

```bash
scripts/build-run-screenshot.sh . <Scheme> <bundle.id>
```

Capture another matrix for an already installed app:

```bash
scripts/capture-simulator-matrix.sh <bundle.id> /tmp/ios-design-shots
```

## Screenshot Matrix

Capture at least:

- Light mode.
- Dark mode.
- Large Dynamic Type.
- Accessibility Dynamic Type.
- Increased contrast.

For risky layout work, also inspect a small iPhone and a large iPhone. Include populated, empty, loading, and error states when practical.

## Critique Pass

Look for:

- One clear primary element.
- No clipped or overlapping text.
- Designed dark mode.
- 44pt hit targets.
- Safe-area correctness.
- Text hierarchy when squinting.
- No generic SwiftUI tell unless intentionally inherited from the app.

Fix the highest-impact visual issues and repeat once.
