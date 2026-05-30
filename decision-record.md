<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Decision Record

## Decisions

- Treat the pianola as a pneumatic player-piano mechanism coupled to an
  existing or representative piano action.
- Keep all dimensions, roll scales, tracker-bar coordinates, vacuum pressure,
  action travel, tuning data, CAD, and DXF work out of the L1 packet.
- Make the first physical work a single-note pneumatic chain before any full
  tracker bar or keyboard-width assembly.
- Keep expression, sustain, and tempo-control branches separate from the first
  note-actuation proof.

## Assumptions

- A perforated roll passes over a tracker bar.
- Tracker-bar pressure changes operate pouches and valves.
- Pneumatic output actuates a piano action rather than directly sounding a
  separate instrument.
- Timing, leakage, reset, and serviceability are the main early risks.

## Open Questions

- Which measured roll/tracker-bar standard or historical player-piano family
  should govern the first L2 parameter set?
- Should the first rig use suction, pressure, or a hybrid representation of the
  pneumatic chain?
- What pouch and valve materials can be tested without overclaiming durability?
- How should expression and sustain coding be introduced after single-note
  response is measured?
- What representative piano action is safe to use for actuation tests?

## Next Work

- Select a measured reference frame.
- Build a one-hole tracker-bar and one-pouch valve test rig.
- Log leakage, response time, reset behavior, missed triggers, and paper
  handling.
- Couple one pneumatic actuator to a representative piano action.
- Record serviceability observations before readiness is upgraded.
