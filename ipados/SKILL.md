---
name: ipados-design
description: High-polish iPadOS UI and UX design for SwiftUI or UIKit apps. Use when an AI coding agent works on iPad-specific or universal app screens, adaptive layouts, NavigationSplitView, sidebars, inspectors, resizable windows, Stage Manager, multitasking, pointer/trackpad, hardware keyboard shortcuts, Apple Pencil, drag and drop, menu bars, simulator screenshots, or adapting iPhone UI to iPad without losing product identity. Do not use for pure networking, persistence, CI, build config, or business logic unless user-visible iPad UI behavior changes.
---

# iPadOS Design

Use this skill to make iPad apps feel like first-class iPadOS products, not stretched iPhone screens. The goal is exact product parity with the iPhone app in identity, polish, data states, and motion quality, while using iPad-specific layout and input systems where they make workflows faster.

## Operating Rules

1. Inspect the existing iPhone/iOS design first: tokens, typography, components, navigation, states, and signature product moments.
2. Preserve product identity across iPhone and iPad: same brand language, content hierarchy, state design, and interaction intent.
3. Adapt layout to iPad instead of scaling iPhone UI. Prefer multi-column navigation, sidebars, inspectors, grids, panels, and spatial grouping when they improve task flow.
4. Design for resizable windows and multitasking: compact, regular, half-screen, Stage Manager, external keyboard/trackpad, and portrait/landscape.
5. Treat touch, pointer, keyboard, Apple Pencil, and drag and drop as peers. Do not ship iPad UI that only works well with touch.
6. Build layout first, then add purposeful motion/haptics. Keep continuity with the iPhone app while respecting iPad's calmer, larger-canvas feel.
7. For runnable apps, capture iPad screenshots across device sizes, window/layout classes, light/dark, Dynamic Type, and increased contrast. If visual QA cannot run, state the gap.

## Reference Routing

- "Make the iPad app match the iPhone app": read `references/product-parity.md`.
- Choosing which docs to load: read `references/routing.md`.
- Adaptive layout, split views, sidebars, inspectors, grids, and resizable windows: read `references/adaptive-layout.md`.
- Multitasking, Stage Manager, windows, menu bars, and toolbar behavior: read `references/navigation-multitasking.md`.
- Pointer, keyboard, Apple Pencil, drag/drop, and context menus: read `references/input-systems.md`.
- New design tokens or iPhone-to-iPad token adaptation: read `references/tokens.md`.
- iPad screen/component patterns: read `references/components.md`.
- Simulator build, run, screenshots, and matrix testing: read `references/verification.md`.
- Dynamic Type, accessibility, contrast, focus, and hit targets: read `references/accessibility.md`.
- Final quality gate: read `references/checklist.md`.

## Bundled Templates

- `templates/IPadAdaptiveScaffold.swift`: adaptive sidebar/content/inspector scaffold.
- `templates/IPadPreviewMatrix.swift`: iPad previews for size classes, orientation assumptions, Dynamic Type, and contrast.
- `templates/IPadScreenStateScaffold.swift`: iPad-first content/loading/empty/error surface.

Use templates only when the target app lacks equivalent patterns. Rename symbols to match local conventions.

## Scripts

From this skill folder:

- `scripts/discover-ios-project.sh <repo>` prints JSON for Xcode workspaces/projects and schemes.
- `scripts/build-run-ipados-screenshot.sh <repo> <scheme> <bundle-id> [device]` builds, installs, launches, and captures an iPad screenshot matrix.
- `scripts/capture-ipados-matrix.sh <bundle-id> <output-dir> [device]` captures light/dark/Dynamic Type/increased-contrast iPad screenshots.
- `scripts/contrast-check.mjs <tokens.json>` checks token contrast pairs.

Prefer XcodeBuildMCP or native simulator tools when available. Use bundled scripts as shell fallback.
