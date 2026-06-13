# Final UI Checklist

Run this before declaring visual iOS work done.

## Visual

- Light and dark screenshots inspected.
- No raw blue/gray/hex values in views unless matching an existing app pattern.
- Spacing follows a visible scale.
- Corners are continuous where custom shapes are used.
- One primary element is obvious per screen.
- Cards are used only where grouping/elevation earns them.

## Product UX

- The screen answers what changed, what needs attention, and what the user can do next.
- Primary repeated actions are fast.
- Empty, loading, error, stale/offline, and partial states are handled when data-driven.
- Search/filter/edit/reorder exists when the data volume or workflow needs it.

## Accessibility

- Dynamic Type tested at large and accessibility sizes for non-trivial layouts.
- Body contrast is at least 4.5:1 and meaningful large text/icons are at least 3:1.
- Hit targets are at least 44x44pt.
- Icon-only controls have labels.
- Reduce Motion is respected.

## Verification

- Build/simulator screenshot matrix was run when local app execution was available.
- Screenshot critique led to at least one fix pass for substantial visual work.
- Any unverified visual QA is stated clearly.
