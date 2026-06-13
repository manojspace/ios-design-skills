# Accessibility And Dynamic Type

Accessibility is part of visual quality. Build it in while shaping the UI.

## Dynamic Type

- Use text styles instead of fixed sizes.
- Test at `.xxxLarge` and one accessibility size.
- Prefer flexible stacks, `ViewThatFits`, line wrapping, and vertical fallbacks.
- Avoid putting long localized text inside fixed-height controls.
- Use monospaced digits for changing numbers.

Simulator fallback:

```bash
xcrun simctl ui booted content_size extra-extra-extra-large
xcrun simctl ui booted content_size accessibility-extra-extra-large
```

## Contrast

- Body text: 4.5:1.
- Large text and meaningful icons: 3:1.
- Disabled state must remain distinguishable without looking active.
- Increased contrast should not break the visual hierarchy.

Simulator fallback:

```bash
xcrun simctl ui booted increase_contrast enabled
```

## VoiceOver And Hit Targets

- Interactive elements need a 44x44pt target.
- Icon-only buttons need labels.
- Decorative imagery should be hidden from accessibility.
- Group related row content when it reads better as one unit.
- Destructive actions require confirmation or undo.

## Motion

Honor `accessibilityReduceMotion`. Use opacity transitions when motion is reduced.
