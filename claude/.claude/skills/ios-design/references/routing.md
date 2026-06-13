# Routing

Load the smallest useful reference set for the task.

## Common Paths

- Small visual fix in an existing screen: inspect the view and design system, then read `checklist.md` only if final QA is needed.
- New screen or redesign: read `product-ux.md`, `tokens.md`, and the relevant sections of `components.md`.
- Travel, itinerary, flight, booking, expense, document, or collaboration UI: read `product-ux.md` first.
- Motion-only request: read `motion.md` and inspect the affected state.
- Accessibility or Dynamic Type issue: read `accessibility-dynamic-type.md`.
- Screenshot critique or final polish: read `verification.md` and `checklist.md`.
- Project cannot be built or scheme is unknown: read `project-discovery.md`.

## Defaults

- Reuse local components and tokens unless they are absent or clearly inadequate.
- Keep changes scoped to the requested UI path.
- Do not add a global design system for a one-line UI bug.
- Do not run broad builds or tests unless the UI change touches shared app architecture.
- Verify iOS 26+ Liquid Glass APIs against Apple documentation before using them.
