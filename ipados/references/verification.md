# Verification

iPad verification must prove the app is adaptive, not only pretty at one size.

## Matrix

Capture or inspect:

- iPad Pro 13-inch full screen.
- iPad 11-inch or iPad Air size.
- A compact/half-screen layout when possible.
- Portrait and landscape when simulator/device tooling supports it.
- Light and dark mode.
- Large Dynamic Type and one accessibility size.
- Increased contrast.

## Shell Fallback

Discover:

```bash
scripts/discover-ios-project.sh .
```

Build and capture:

```bash
scripts/build-run-ipados-screenshot.sh . <Scheme> <bundle.id>
```

Capture an already installed app:

```bash
scripts/capture-ipados-matrix.sh <bundle.id> /tmp/ipados-design-shots
```

## Critique

Look for:

- Same product identity as iPhone.
- No stretched iPhone layout.
- Primary object remains obvious.
- Sidebar/content/inspector density feels intentional.
- Keyboard/pointer workflows are discoverable.
- Dynamic Type does not break multi-column layout.
- Dark mode works across panels and separators.
- Toolbar/menu commands do not collide with window controls.
