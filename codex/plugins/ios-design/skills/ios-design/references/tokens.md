# Design Tokens

Use tokens as the single source of truth for color, type, spacing, shape, and depth. If a view contains raw hex values, raw `Color.blue`, generic gray, or scattered padding numbers, treat it as a design-system bug unless the local app already has an equivalent token pattern.

## Colors

Define light and dark variants intentionally. Dark mode is designed, not inverted.

Required roles:

- `brand`: identity color, used sparingly.
- `accent`: interactive color; may equal brand.
- `bgBase`: screen background, not pure white or pure black.
- `bgElevated`: cards, panels, and sheets.
- `bgInset`: recessed areas, fields, chips.
- `textPrimary`, `textSecondary`, `textTertiary`.
- `positive`, `warning`, `negative`.

Rules:

- Elevated dark surfaces should usually be lighter than the base.
- Tinted neutrals beat system-default gray fields.
- Body text needs 4.5:1 contrast; large text and icons need 3:1.
- Avoid one-note palettes dominated by a single hue.

## Typography

Define roles, not one-off sizes:

- Display: only for true hero/status moments.
- Title: section and screen hierarchy.
- Headline: rows, cards, buttons.
- Body: readable content.
- Caption: metadata and secondary labels.
- Numeric: monospaced digits for counts, times, prices, gates, durations.

Use text styles so Dynamic Type works. Prefer `.custom(_:size:relativeTo:)` for custom fonts; avoid fixed sizes.

## Spacing, Shape, Depth

Use a 4pt scale: `4, 8, 12, 16, 24, 32`. Use continuous corners. Inner radii should be concentric with outer radii.

Use depth sparingly:

- Light mode: low-opacity ambient shadow or subtle stroke.
- Dark mode: elevation through surface lightness more than shadow.
- Avoid decorative blur/orb backgrounds.

## Template

Use `templates/DesignSystem.swift` only when the app lacks suitable tokens. Adapt names and values to the app's existing conventions.
