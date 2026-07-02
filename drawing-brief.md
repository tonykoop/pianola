<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Drawing Brief

Scope for any future dimensioned drawing of the pianola. This packet is
deliberately non-dimensional (concept-only / `pending_measurement`), so **no
dimensioned DXF/SVG exists yet** and none may be produced until the measurement
gates in `validation.csv` and the authority register are satisfied.

## What a future drawing set must show (once measured)

- **Roll transport** — supply/take-up spool layout, drive/rewind, paper path,
  roll-advance-per-event relation.
- **Tracker bar** — port pitch `trackerPortPitch`, sealing face, tube routing.
- **Pneumatic chest** — pouch/valve layout with output/reset margins and the
  leak budget map.
- **Actuator → action coupling** — actuator travel vs required action travel,
  lost-motion budget.
- **Piano case envelope** — case, soundboard, plate/frame, string band, and
  keyboard/action footprint carrying the pneumatic stack.

## Current CAD artifact

`cad/pianola.scad` is a **parametric structural-envelope scaffold**: it models
the piano case + string band + keyboard + pneumatic-stack envelope and encodes
the documented symbolic margins as formulas, with render-only placeholder leaf
values (clearly flagged, not authority).

## Drawing rules

- Every dimension on any released drawing must trace to a measured or reviewed
  authority-register row.
- Keep the pneumatic-chain margins (`pouchOutputMargin`, `actuatorTravelMargin`,
  `leakBudgetTotal`) formula-driven; never hand-place from a lossy export.
- Treat historical pianolas/player pianos, photos, and diagrams as
  reference-only.
