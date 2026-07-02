<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Risks

Top-level risk summary for the pianola L2 build-packet candidate. The full
qualitative analysis lives in `docs/risk-FMEA.md`; this file is the baseline
packet summary. No numeric risk scores are assigned.

## Roll / sensing

- **Tracker ports misaligned to roll** — missed/false notes. Control: measure
  `trackerPortPitch` from a reference roll (validation.csv VAL-002).
- **Poor paper seal** — leaks or paper drag. Control: seal-condition test
  (VAL-003).
- **Unstable roll transport** — timing drift. Control: roll-advance transport
  test (VAL-001).

## Pneumatic chain

- **Leak budget not isolated** — whole chain fails intermittently. Control:
  per-source leak isolation (VAL-004).
- **Insufficient pouch/valve margin** — weak or missed actuation. Control:
  `pouchOutputMargin > 0`, `valveResetMargin > 0` on a chest coupon
  (VAL-005/006).
- **Actuator travel short of action travel** — hammer never strikes. Control:
  `actuatorTravelMargin > 0` measured rig (VAL-007).

## Action / service / process

- **Lost motion in action coupling** — sluggish/uneven notes. Control:
  `lostMotionBudget` accounted before tolerancing (VAL-008).
- **No service access** — cannot regulate the stack. Control: service-access
  envelope review (VAL-009).
- **CAD appears authoritative too early** — the parametric OpenSCAD envelope
  (`cad/pianola.scad`) carries `pending_measurement` authority and render-only
  placeholder values; it is **not** fabrication authority. Update the authority
  register before any DXF/SVG or measured geometry is accepted.

## Must-not (carried into evolution/design-intent.md)

- Do not substitute guessed numbers for any symbol (trackerPortPitch,
  pouchOutputMargin, …) or promote a `// PLACEHOLDER` without a
  measured/reviewed authority-register row (parametric-design-table.md Use Rules).
- Do not release roll scale, pressure, force, timing, or action travel from
  reference examples, images, or prose (design.md).
- Add expression control only after the basic note chain is measured
  (`expressionBranchLoad`).
