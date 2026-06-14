# Adaptive Layout

iPad layouts must respond to canvas size, orientation, and window size. Design for a range, not one iPad screenshot.

## Layout Ladder

Use a ladder from compact to expansive:

- Compact/half-screen: preserve iPhone-like stack navigation and avoid hidden sidebars.
- Regular portrait: show sidebar or grouped navigation when it helps.
- Regular landscape: use multi-column content and detail.
- Large/Stage Manager: add inspector, secondary panels, or comparison surfaces.
- External display: preserve focus and avoid relying on device-only gestures.

## SwiftUI Patterns

- Prefer `NavigationSplitView` for sidebar/content/detail apps.
- Use `Grid`, `LazyVGrid`, and adaptive columns for browsable objects.
- Use inspectors for properties, filters, metadata, and related actions.
- Use popovers for contextual controls; avoid full-screen sheets for small decisions.
- Use `ViewThatFits` and size-class branching sparingly but deliberately.

## Information Density

- Increase useful context, not decoration.
- Keep line lengths readable.
- Use section grouping and panels instead of huge stretched cards.
- Keep primary actions reachable in toolbar, bottom bar, inspector, or menu bar.
- Avoid empty gutters unless they create focus.

## Window Resizing

At every major breakpoint, check:

- Does navigation still make sense?
- Is the primary object still obvious?
- Are actions still reachable?
- Did text wrap without overlap?
- Did panels become too narrow or too sparse?
