# Components And Screens

Choose the screen structure from the user's workflow. Do not start with cards.

## Dashboard

Use one primary status region, one next action, and compact secondary surfaces. Good for travel overview, finance summaries, health status, and project dashboards.

Checklist:

- Primary answer visible in the first viewport.
- Secondary widgets are compact and comparable.
- Stale/offline/live status is visible when data is time-sensitive.
- The next action is obvious without marketing copy.

## Timeline

Use for trips, schedules, flights, tasks by day, logs, and history.

Pattern:

- Sticky or clear date grouping.
- Local time and time-zone clarity.
- Compact icon/category marker.
- Related metadata on one scan line.
- Tap target at least 44pt.
- Jump-to-now/today when the timeline is long.

## Dense List

Use for repeated objects where scan speed matters. Cards are usually too heavy here.

Pattern:

- Section headers, sorting, search, and filters.
- Leading icon or status marker only when it improves recognition.
- Two-line row maximum by default.
- Swipe/context actions for repeated operations.
- Edit mode for reorder, batch selection, or deletion.

## Live Status Header

Use for flights, deliveries, reservations, sync, imports, timers, or anything that changes.

Include:

- Current state.
- Freshness timestamp or source.
- Next event.
- Degraded/offline state.
- One relevant action.

## Bottom Action Bar

Use when the next action must remain reachable while scrolling. Keep it native, safe-area aware, and limited to one primary action plus optional secondary controls.

## Sheets And Inspectors

Use sheets for focused detail, editing, filters, and lightweight inspectors. Use detents, drag indicators, and a clear dismissal model. Avoid burying primary workflows in nested sheets.

## Empty, Loading, Error

Every data-driven screen needs content, loading, empty, and error states.

- Loading: skeleton/redacted content when the wait may be visible.
- Empty: explain the first useful action.
- Error: explain what happened and offer retry or recovery.
- Partial: show usable data and mark missing/stale sections.

Use `templates/ScreenStateScaffold.swift` as a starting point when the app lacks a state pattern.
