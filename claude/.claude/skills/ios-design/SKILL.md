---
name: ios-design
description: High-polish iOS UI and UX design for SwiftUI or UIKit apps. Use when Claude works on user-visible iOS screens, components, layout, design systems, visual polish, accessibility, Dynamic Type, motion, haptics, simulator screenshots, or screenshot/UI critique. Do not use for pure networking, persistence, build config, CI, App Intents, or business logic unless the task changes user-visible UI behavior.
---

# iOS Design

Use this skill to make iOS app work feel deliberate, native, and product-specific instead of default SwiftUI. The goal is Tripsy/Flighty/Things/Halide-level craft: strong information architecture, glanceable state, fast repeated workflows, designed dark mode, accessible typography, restrained motion, and screenshot-driven iteration.

## Operating Rules

1. Inspect the existing app first: current view structure, navigation, design tokens, assets, deployment target, and available build scheme.
2. Start with product UX before styling. Define the primary job, top repeated actions, screen archetype, navigation model, data states, and offline/error reality.
3. Reuse the app's existing design system before adding a new one. Use templates only when the project lacks suitable tokens or state scaffolds.
4. Treat cards as one layout tool, not the default. Prefer timelines, dense lists, live status panels, maps, calendars, inspectors, edit modes, and bottom action bars when they fit the workflow better.
5. Build layout first, then add one or two state-driven motion/haptic moments. Respect Reduce Motion and avoid haptics on every tap.
6. For visual work in a runnable app, build, launch, capture screenshots, inspect them, fix issues, and repeat once. If the app cannot run locally, state that visual QA is unverified.

## Reference Routing

- Product UX, app flow, navigation, or "make this like Tripsy": read `references/product-ux.md`.
- Choosing which docs to load for a task: read `references/routing.md`.
- Unknown Xcode project shape, schemes, bundle id, or deployment target: read `references/project-discovery.md`.
- New screen, redesign, or missing tokens: read `references/tokens.md`.
- Screen/component layout patterns: read `references/components.md`.
- Animation, haptics, gestures, or transitions: read `references/motion.md`.
- Simulator build, run, screenshots, or failure handling: read `references/verification.md`.
- Dynamic Type, contrast, Reduce Motion, VoiceOver, hit targets: read `references/accessibility-dynamic-type.md`.
- Final UI quality gate: read `references/checklist.md`.

## Bundled Templates

- `templates/DesignSystem.swift`: namespaced starter tokens under `AppDesign`.
- `templates/PreviewMatrix.swift`: preview matrix for light, dark, Dynamic Type, and increased contrast.
- `templates/ScreenStateScaffold.swift`: content/loading/empty/error surface pattern.

Copy templates into the target app only when needed, then rename or adapt symbols to local conventions.

## Scripts

From the skill root:

- `scripts/discover-ios-project.sh <repo>` prints basic JSON for Xcode workspaces/projects and schemes.
- `scripts/build-run-screenshot.sh <repo> <scheme> <bundle-id> [device]` builds, installs, launches, and captures screenshots.
- `scripts/capture-simulator-matrix.sh <bundle-id> <output-dir> [device]` captures light/dark/Dynamic Type/increased-contrast screenshots.
- `scripts/contrast-check.mjs <tokens.json>` checks token contrast pairs.

Use Claude Code's built-in `/run` and `/verify` skills when they can launch the app correctly. Use these bundled scripts as an iOS-specific shell fallback when the project needs explicit Xcode/simulator commands.
