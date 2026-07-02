# Design Intent — pianola rev A

- Master CAD: `cad/pianola.scad` (sha256: 3ef976bfd16f17196e892f7c0c4fb20fdb8cc821c92819c9792ef13cefb7efe2), a parametric structural-envelope scaffold driven by the symbolic table `docs/parametric-design-table.md` (sha256: 0f5794220d0d52142541336c54f2071aa54d410f805d0e43fa61594e90d0bd37).
- Function: A pianola-style player piano. A perforated roll passes over a tracker bar; pneumatic pouches and valves amplify small pressure changes and drive pneumatic actuators that operate a conventional piano action to strike strings. The case, soundboard, plate/frame, and string band form the acoustic/structural body; the pneumatic stack is carried inside the case.
- Environment: indoor instrument; solid-wood plates + soundboard move with humidity; string tension is a large sustained structural load on plate/frame; the pneumatic chain depends on airtight seals and repeatable timing.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

Packet is deliberately non-dimensional — every critical value is
`pending_measurement`; the table records the governing symbolic relationship
and its measurement gate, not a released number.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Tracker port pitch | TBD (rollHolePitch + alignmentAllowance) | measured from reference roll | correct note reading | docs/parametric-design-table.md (pending_measurement) |
| Roll advance per event | TBD (rollTransportSpeed × eventTimeWindow) | transport test | expressive timing | parametric-design-table.md (pending_measurement) |
| Leak budget | TBD (tracker+tube+pouch+valve+actuator) | per-source isolation | reliable actuation | parametric-design-table.md (pending_measurement) |
| Pouch output margin | TBD (>0) | chest coupon | valve actually moves | parametric-design-table.md (pending_measurement) |
| Valve reset margin | TBD (>0) | repeat-note test | repeat notes work | parametric-design-table.md (pending_measurement) |
| Actuator travel margin | TBD (>0) | measured rig | hammer strikes | parametric-design-table.md (pending_measurement) |
| Lost-motion budget | TBD (slack + compliance + regulation) | before tolerancing | responsive action | parametric-design-table.md (pending_measurement) |

## Incidental (free for DFM)

- Case cabinetry styling, fallboard/lid shape, decorative panels, non-mating surface finish, roll-window cosmetics.

## Must-nots (DFM may never violate)

- Do not substitute guessed numbers for any symbol or promote a `// PLACEHOLDER` in `cad/pianola.scad` without a measured/reviewed authority-register row (parametric-design-table.md Use Rules).
- Do not release roll scale, vacuum pressure, force, timing, or action travel from historical examples, images, or prose (design.md).
- String tension is a large structural load path: no plate/frame/soundboard sizing until structural review.
- Add expression control only after the basic note chain is measured (`expressionBranchLoad`).
- Preserve service access to roll transport, tracker bar, pouch/valve chest, and action.

## Material intent

- Preferred: piano case/soundboard tonewood, plate/frame, piano wire + action parts, pneumatic pouch/valve materials — all per bom.csv, all class-only / `pending_measurement`.
- Acceptable subs: per sourcing.csv (spec-first; specs pending).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable or dimensioned.
