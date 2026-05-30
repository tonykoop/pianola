<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Measurement And Validation Protocol

Status: L3-candidate protocol. No measured values are recorded here.

This document defines what evidence is required before any pianola dimension,
pressure setting, timing value, or interface geometry can move from
`estimate_pending_measurement` to fabrication authority.

## Promotion Rule

An estimate may become fabrication authority only after all of these are true:

- The measured feature has a stable ID in the design table.
- The measuring tool or rig is named.
- The measurement condition is recorded.
- The result is checked against the downstream subsystem it drives.
- The failure mode for a bad value has been tested or explicitly accepted.
- The authority row in `visual-output-register.csv` is updated with the evidence
  path.

## Roll Transport

Measure or test before authority:

- Roll media width, edge condition, stiffness, and hole readability.
- Spool alignment, take-up behavior, paper tension, and rewind behavior.
- Paper tracking over the tracker bar without tearing, wrinkling, or wandering.
- Tempo stability under hand, motor, or test-drive conditions.
- Service steps for roll loading, removal, and paper clearing.

Promotion evidence:

- Reference roll or test strip ID.
- Alignment and tracking observations.
- Wear or snag notes after repeated passes.
- Decision on whether the roll media is safe to use as a design reference.

## Tracker Bar

Measure or test before authority:

- Port spacing, port shape, sealing surface behavior, and port isolation.
- Paper contact pressure and whether the paper can move without snagging.
- Leak behavior with no hole open.
- Signal behavior with one intended hole open.
- Cleaning access and debris tolerance.

Promotion evidence:

- Measured tracker-bar reference or prototype drawing.
- Leak-test record for closed and open states.
- Serviceability notes for cleaning and inspection.
- Explicit statement of which dimensions remain pending.

## Pneumatic Signal Chain

Measure or test before authority:

- Pouch response, reset, sticking, and material aging.
- Valve seating, venting, leak paths, and reset behavior.
- Tubing or channel routing effects on delay and leakage.
- Vacuum or pressure source behavior under repeated events.
- Reservoir behavior when one note fires repeatedly.

Promotion evidence:

- One-pouch/one-valve rig log.
- Leak isolation notes.
- Repeatability observations.
- Failure notes for slow response, missed triggers, and stuck-open states.

## Action Interface

Measure or test before authority:

- Actuator-to-action handoff motion.
- Lost motion and reset behavior.
- Safe decoupling if a pneumatic component sticks.
- Whether a representative action responds without damage.
- Service access for adjustment and removal.

Promotion evidence:

- Representative action or action-rig ID.
- Actuation and reset log.
- Damage-prevention hold points.
- Decision on whether the interface is ready for scaled testing.

## Controls And Expression

Measure or test before authority:

- Tempo variation after the basic note chain is stable.
- Sustain or expression branch behavior without hiding note-chain faults.
- Reroll and cutoff behavior.
- How expression controls change timing, reset, and leak behavior.

Promotion evidence:

- Basic note-chain pass record.
- Separate expression-control test log.
- Explicit separation between note actuation and musical expression claims.
