# iOS Design Skills

Reusable high-polish iOS and iPadOS UI/UX skills for Codex and Claude.

This repository packages the same design-engineering standards in tool-native formats:

- `codex/`: Codex Git marketplace containing `ios-design` and `ipados-design`.
- `claude/`: Claude Code skills plus paste-ready Claude customizer instructions.
- `ipados/`: raw source copy of the iPadOS skill.

The goal is to make AI-generated iPhone and iPad work feel native, deliberate, and product-specific instead of like default SwiftUI.

## What This Is

`ios-design` is for high-polish iPhone/iOS SwiftUI and UIKit UI work.

`ipados-design` extends the same product quality bar to iPadOS and universal apps. It is not a request to stretch iPhone UI. It preserves the same product identity, polish, states, and interaction intent, then adapts layout and input for iPad.

Together, the skills guide agents to:

- Start with product UX before styling.
- Reuse the existing app design system before adding tokens.
- Avoid default SwiftUI tells like generic lists, raw system blue, flat white/gray surfaces, and magic padding.
- Prefer workflow-specific surfaces such as timelines, dense lists, live status panels, maps, calendars, sidebars, inspectors, edit modes, and bottom action bars when they fit better than cards.
- Build designed light/dark palettes, Dynamic Type, accessible contrast, meaningful hit targets, and Reduce Motion support.
- Add restrained motion and haptics only where they clarify state.
- Verify visual work with simulator screenshots when the app can run locally.
- For iPadOS, account for adaptive layout, resizable windows, Stage Manager, pointer/trackpad, hardware keyboard, Apple Pencil, drag and drop, and menu bars.

## Why This Exists

AI agents often produce iOS screens that compile but look generic:

- Overuse of `List`, `Form`, and card stacks.
- No product-specific information architecture.
- Weak empty/loading/error states.
- Inconsistent spacing and typography.
- Poor dark mode and contrast.
- No screenshot review loop.

iPad apps add another failure mode: stretched iPhone UI. The iPadOS skill exists to make universal apps feel like the same product on a larger canvas, while using iPad-native structure and input systems.

## Repository Layout

```text
ios-design-skills/
  README.md
  .agents/plugins/marketplace.json
  codex/
    README.md
    .agents/plugins/marketplace.json
    plugins/
      ios-design/
      ipados-design/
  claude/
    README.md
    CLAUDE.md
    customizer-prompt.md
    .claude/skills/
      ios-design/
      ipados-design/
  ipados/
    README.md
    SKILL.md
    references/
    templates/
    scripts/
```

The root marketplace manifest is intentionally tiny. It points Codex at the plugin implementations under `codex/plugins/`.

## Codex Installation

Install directly from the public GitHub marketplace:

```bash
codex plugin marketplace add manojspace/ios-design-skills --ref main
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

If you prefer a local clone:

```bash
git clone https://github.com/manojspace/ios-design-skills.git
codex plugin marketplace add ./ios-design-skills
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

Start a new Codex thread after installing or updating.

### Codex Update

```bash
codex plugin marketplace upgrade
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

### Codex Usage

Good prompts:

- "Polish this SwiftUI screen."
- "Make this trip planner UI feel like a premium iOS app."
- "Create a SwiftUI itinerary timeline with loading, empty, and error states."
- "Adapt this iPhone screen into a first-class iPad layout."
- "Review this iPad screenshot for stretched iPhone UI."
- "Add sidebar, inspector, pointer, and keyboard support to this iPad app."

Do not use these skills for pure networking, persistence, CI, build config, App Intents, or business logic unless the task changes user-visible UI behavior.

## Claude Installation

Claude Code skills are folders with `SKILL.md`. This repo includes:

```text
claude/.claude/skills/ios-design/
claude/.claude/skills/ipados-design/
```

### Claude Code Project Skills

Copy the skills into a project:

```bash
mkdir -p .claude/skills
cp -R /path/to/ios-design-skills/claude/.claude/skills/ios-design .claude/skills/
cp -R /path/to/ios-design-skills/claude/.claude/skills/ipados-design .claude/skills/
```

Invoke directly:

```text
/ios-design
/ipados-design
```

### Claude Code Personal Skills

Copy the skills to your personal skills folder:

```bash
mkdir -p ~/.claude/skills
cp -R /path/to/ios-design-skills/claude/.claude/skills/ios-design ~/.claude/skills/
cp -R /path/to/ios-design-skills/claude/.claude/skills/ipados-design ~/.claude/skills/
```

### Claude Customizer / Custom Instructions

For Claude surfaces that do not load Claude Code skills directly, paste:

```text
claude/customizer-prompt.md
```

## How The Skills Work

The skills use progressive disclosure:

1. `SKILL.md` stays short and tells the agent when to use the skill.
2. `references/` contains deeper guidance loaded only when needed.
3. `templates/` contains reusable Swift starter files.
4. `scripts/` contains shell fallback helpers for project discovery, simulator screenshots, and contrast checks.

The core workflow:

1. Inspect the existing app.
2. Preserve the product identity and design system.
3. Define the product UX before styling.
4. Choose the right screen archetype for the platform.
5. Build content, loading, empty, error, and stale/offline states where relevant.
6. Add restrained motion, haptics, and platform input affordances.
7. Verify with screenshots when the app can run.
8. State clearly when visual QA could not be verified.

## iPadOS Coverage

`ipados-design` considers:

- iPhone-to-iPad product parity.
- Adaptive layout ladders from compact to expansive windows.
- `NavigationSplitView`, sidebars, inspectors, panels, grids, and popovers.
- Resizable windows, multitasking, Stage Manager, multiple scenes, and menu bars.
- Pointer/trackpad, hardware keyboard, shortcuts, focus, Apple Pencil, drag and drop.
- Compact/regular size classes, portrait/landscape, light/dark, Dynamic Type, increased contrast.
- Large-canvas density without decoration or stretched cards.

The iPadOS guidance is grounded in Apple's current Human Interface Guidelines for iPadOS, plus Apple's iPadOS design material on responsive windows, navigation, pointer behavior, and menu bars.

## Development And Validation

Create the validator environment if needed:

```bash
python3 -m venv /tmp/codex-plugin-validate
/tmp/codex-plugin-validate/bin/pip install PyYAML
```

Validate plugins:

```bash
/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py \
  codex/plugins/ios-design

/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py \
  codex/plugins/ipados-design
```

Validate skills:

```bash
/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  codex/plugins/ios-design/skills/ios-design

/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  codex/plugins/ipados-design/skills/ipados-design

/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  claude/.claude/skills/ios-design

/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  claude/.claude/skills/ipados-design
```

## Publishing

Commit and push changes:

```bash
git add -A
git commit -m "Update design skills"
git push
```

Refresh Codex:

```bash
codex plugin marketplace upgrade
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

For Claude Code, copy updated folders under `claude/.claude/skills/` into the target project or personal skills directory.

## Troubleshooting

If Codex does not show a plugin:

```bash
codex plugin marketplace list
codex plugin list
```

If Claude Code does not show a skill, confirm:

```text
.claude/skills/ios-design/SKILL.md
.claude/skills/ipados-design/SKILL.md
```

or:

```text
~/.claude/skills/ios-design/SKILL.md
~/.claude/skills/ipados-design/SKILL.md
```

Restart Claude Code if the skills directory was created after the session started.

## License

No license has been added yet. Add one before expecting public reuse beyond personal installation.
