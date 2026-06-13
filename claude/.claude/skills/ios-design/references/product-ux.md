# Product UX

Award-level iOS apps are not just prettier screens. They make the user's repeated job obvious, fast, recoverable, and native.

## Product Pass Before Styling

Answer these before writing UI code:

- Primary job: what is the user trying to get done?
- Repeated actions: what will they do every day or every trip?
- Screen archetype: dashboard, timeline, inbox/list, editor, capture tool, map, calendar, inspector, live-status surface, or settings.
- Navigation model: tab, stack, split view, sheet, sidebar, search, filters, edit mode, or command menu.
- Data reality: loading, empty, stale, offline, permission denied, partial sync, conflict, and error.
- Next action: every primary screen should answer what changed, what needs attention, and what the user can do next.

## Tripsy-Like Quality Without Copying Tripsy

For travel and itinerary products, prefer:

- Itinerary timelines grouped by day, local time, and travel context.
- Live status strips for flights, gates, delays, check-in, weather, or time-zone changes.
- Import and parsing states that explain confidence and let the user correct details.
- Collaboration states: who changed what, shared trip access, pending invites, conflict recovery.
- Documents and reservations as first-class offline objects, not hidden attachments.
- Expense and stats surfaces that use monospaced digits and scan-friendly totals.
- Calendar, maps, ride-share, and navigation affordances close to the relevant event.

Use this as a product bar, not a visual style guide.

## Screen Archetypes

- Dashboard: one primary status, next action, and compact secondary widgets.
- Timeline: chronological spine, grouped dates, local times, location transitions, and jump-to-today.
- Dense list: fast scan, section headers, swipe/context actions, search, filters, and edit mode.
- Live status: timestamp freshness, source, degraded/offline state, and action affordance.
- Map/calendar: preserve system gestures, add focused controls, keep chrome minimal.
- Inspector/detail: progressive disclosure, related documents/actions, and clear edit/recovery paths.
- Capture/import: fast input, permission handling, parsing progress, and manual correction.

## Anti-Card Rule

Cards are useful when they group a real object or elevate a primary status. They are not a default layout. If every row is a card, scan speed drops and the app starts looking generated.

Prefer fewer containers, stronger typographic hierarchy, section grouping, separators, timelines, and pinned actions when the user needs to compare or act quickly.

## Interaction Depth

Add interaction patterns that fit the workflow:

- Undo for destructive or bulk actions.
- Edit mode for reorder, multi-select, and batch operations.
- Swipe/context menus for power actions on repeated list items.
- Stale-data indicators for live data.
- Optimistic UI only when recovery is clear.
- Search and filters when lists exceed one screen or have multiple mental models.
