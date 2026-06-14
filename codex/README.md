# Codex Design Plugins

Codex marketplace root for `ios-design` and `ipados-design`.

## Install From Git

```bash
codex plugin marketplace add manojspace/ios-design-skills --ref main
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

The Git marketplace manifest lives at the repository root and points at `codex/plugins/*`.

## Install From A Local Clone

```bash
codex plugin marketplace add /path/to/ios-design-skills
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

## Update

```bash
codex plugin marketplace upgrade
codex plugin add ios-design@ios-design-skills
codex plugin add ipados-design@ios-design-skills
```

Start a new Codex thread after installing or updating so Codex picks up the skills.
