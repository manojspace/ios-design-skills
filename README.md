# iOS Design Skills

Reusable high-polish iOS UI/UX skills for Codex and Claude.

This repository packages one design-engineering workflow in two tool-native formats:

- `codex/`: a Codex Git marketplace containing the `ios-design` plugin.
- `claude/`: a Claude Code skill plus paste-ready Claude customizer instructions.

The goal is to make AI-generated iOS work feel native, deliberate, and product-specific instead of like default SwiftUI.

## What This Is

`ios-design` is a reusable skill for SwiftUI/UIKit UI work. It guides the agent to:

- Start with product UX before styling.
- Reuse the existing app design system before adding new tokens.
- Avoid default SwiftUI tells like generic lists, raw system blue, flat white/gray surfaces, and magic padding.
- Prefer workflow-specific surfaces such as timelines, dense lists, live status panels, maps, calendars, inspectors, edit modes, and bottom action bars when they fit better than cards.
- Build designed light/dark palettes, Dynamic Type, accessible contrast, meaningful hit targets, and Reduce Motion support.
- Add restrained motion and haptics only where they clarify state.
- Verify visual work with simulator screenshots when the app can run locally.

The reference point is the product craft of apps like Tripsy, Flighty, Things, and Halide. This is not a visual clone of those apps; it is a quality bar for information architecture, native interaction, glanceability, and polish.

## Why This Exists

AI agents often produce iOS screens that compile but look generic:

- Overuse of `List`, `Form`, and card stacks.
- No product-specific information architecture.
- Weak empty/loading/error states.
- Inconsistent spacing and typography.
- Poor dark mode and contrast.
- No screenshot review loop.

This repo makes those expectations reusable across machines and tools. The GitHub repo is the durable source of truth, so reinstalling Codex, moving to a new Mac, or setting up Claude does not lose the skill.

## Repository Layout

```text
ios-design-skills/
  README.md
  codex/
    README.md
    .agents/plugins/marketplace.json
    plugins/ios-design/
      .codex-plugin/plugin.json
      skills/ios-design/
        SKILL.md
        references/
        templates/
      scripts/
  claude/
    README.md
    CLAUDE.md
    customizer-prompt.md
    .claude/skills/ios-design/
      SKILL.md
      references/
      templates/
      scripts/
```

## Codex Installation

Install directly from the GitHub marketplace:

```bash
codex plugin marketplace add manojspace/ios-design-skills --ref main --sparse codex
codex plugin add ios-design@ios-design-skills
```

If your Codex version does not support sparse Git marketplace roots, use a local clone:

```bash
git clone https://github.com/manojspace/ios-design-skills.git
codex plugin marketplace add ./ios-design-skills/codex
codex plugin add ios-design@ios-design-skills
```

After install, start a new Codex thread so the skill is picked up.

### Codex Update

```bash
codex plugin marketplace upgrade
codex plugin add ios-design@ios-design-skills
```

Start a new Codex thread after updating.

### Codex Usage

Ask Codex for iOS UI work normally. The plugin should trigger for prompts like:

- "Polish this SwiftUI screen."
- "Make this trip planner UI feel like a premium iOS app."
- "Review this iOS screenshot and fix the visual issues."
- "Create a SwiftUI itinerary timeline with loading, empty, and error states."

The plugin should not trigger for pure networking, persistence, CI, build config, App Intents, or business logic unless the task changes user-visible UI behavior.

## Claude Installation

Claude Code skills are folders with `SKILL.md`. This repo includes a Claude-native copy at:

```text
claude/.claude/skills/ios-design/
```

Claude Code can use it as either a project skill or a personal skill.

### Claude Code Project Skill

Copy the skill into a project:

```bash
mkdir -p .claude/skills
cp -R /path/to/ios-design-skills/claude/.claude/skills/ios-design .claude/skills/
```

Then invoke it directly:

```text
/ios-design
```

Claude may also load it automatically when the request matches the skill description.

### Claude Code Personal Skill

Copy it to your personal skills folder:

```bash
mkdir -p ~/.claude/skills
cp -R /path/to/ios-design-skills/claude/.claude/skills/ios-design ~/.claude/skills/
```

That makes `/ios-design` available across Claude Code projects.

### Claude Customizer / Custom Instructions

For Claude surfaces that do not load Claude Code skills directly, use:

```text
claude/customizer-prompt.md
```

Paste that file into Claude's custom instructions/customizer area. It is a compact version of the same workflow without bundled scripts/templates.

## How The Skill Works

The skill uses progressive disclosure:

1. `SKILL.md` stays short and tells the agent when to use the skill.
2. `references/` contains deeper guidance loaded only when needed.
3. `templates/` contains reusable Swift starter files.
4. `scripts/` contains shell fallback helpers for project discovery, simulator screenshots, and contrast checks.

The core workflow is:

1. Inspect the existing app.
2. Define the product UX before styling.
3. Choose the right screen archetype.
4. Reuse or adapt design tokens.
5. Build states: content, loading, empty, error, stale/offline where relevant.
6. Add restrained motion and haptics.
7. Verify with screenshots when the app can run.
8. State clearly when visual QA could not be verified.

## References Included

- `product-ux.md`: app flow, Tripsy-like quality bar, screen archetypes, anti-card rule.
- `project-discovery.md`: finding Xcode workspaces, schemes, bundle IDs, and build targets.
- `tokens.md`: color, typography, spacing, shape, and contrast rules.
- `components.md`: dashboards, timelines, dense lists, status headers, sheets, state surfaces.
- `motion.md`: state-driven animation, haptics, transitions, gestures, Reduce Motion.
- `verification.md`: simulator screenshot matrix and critique loop.
- `accessibility-dynamic-type.md`: Dynamic Type, contrast, VoiceOver, hit targets.
- `checklist.md`: final UI quality gate.

## Templates Included

- `DesignSystem.swift`: namespaced starter tokens under `AppDesign`.
- `PreviewMatrix.swift`: light/dark/Dynamic Type/increased-contrast preview matrix.
- `ScreenStateScaffold.swift`: content/loading/empty/error scaffold.

These are starter templates, not mandatory architecture. Agents should adapt them to the app's existing style.

## Scripts Included

- `discover-ios-project.sh`: prints basic JSON for workspaces/projects and schemes.
- `build-run-screenshot.sh`: builds, installs, launches, and captures screenshots.
- `capture-simulator-matrix.sh`: captures light, dark, Dynamic Type, accessibility type, and increased contrast screenshots.
- `contrast-check.mjs`: checks color contrast pairs from JSON.

## Development

Edit the repo source, then validate the Codex plugin:

```bash
/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py \
  codex/plugins/ios-design
```

Validate the skill frontmatter:

```bash
/tmp/codex-plugin-validate/bin/python \
  /Users/manoj/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  codex/plugins/ios-design/skills/ios-design
```

If the temporary validator environment does not exist:

```bash
python3 -m venv /tmp/codex-plugin-validate
/tmp/codex-plugin-validate/bin/pip install PyYAML
```

## Publishing

Commit and push changes:

```bash
git add -A
git commit -m "Update iOS design skills"
git push
```

Then refresh installed marketplaces:

```bash
codex plugin marketplace upgrade
codex plugin add ios-design@ios-design-skills
```

For Claude Code, copy the updated `claude/.claude/skills/ios-design` folder into the project or personal skills directory.

## Troubleshooting

If Codex does not show the plugin:

```bash
codex plugin marketplace list
codex plugin list
```

If a Git sparse marketplace install fails, use the local clone install path shown above.

If Claude Code does not show `/ios-design`, confirm the file exists at:

```text
.claude/skills/ios-design/SKILL.md
```

or:

```text
~/.claude/skills/ios-design/SKILL.md
```

Restart Claude Code if the `.claude/skills` directory was created after the session started.

## License

No license has been added yet. Add one before expecting public reuse beyond personal installation.
