# Motion And Haptics

Motion is a dedicated pass after layout works. Use a few orchestrated moments, not scattered animation.

## Animation

Prefer state-driven SwiftUI animation:

- `.snappy` for selection, toggles, and small layout changes.
- `.smooth` for larger surfaces.
- `.bouncy` only for playful confirmation moments.

Avoid blanket implicit animation on entire screens. Drive animation from specific values.

## Transitions

Good defaults:

- Cards/sheets appearing: opacity plus slight scale.
- Banners: move from relevant edge.
- Numbers: `.contentTransition(.numericText())`.
- Icons: symbol replace or bounce effects tied to state.
- Navigation hero: use platform zoom/matched transitions when available and appropriate.

Respect `accessibilityReduceMotion`: replace movement-heavy transitions with opacity changes.

## Haptics

Use `.sensoryFeedback` on meaningful state changes:

- Selection changes: `.selection`.
- Completion: `.success`.
- Destructive confirmation: `.warning`.
- Physical snap/expand: light impact.

Do not attach haptics to every tap.

## Gesture Quality

Gestures need clear affordance and recovery. Add drag/reorder, swipe, long-press, or direct manipulation only when it makes the repeated workflow faster.
