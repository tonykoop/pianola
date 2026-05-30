<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Pianola

Status: L3-candidate V5 packet (deepened: protocols, tolerances, assembly, FMEA)...
for review and prototype planning only, not fabrication-ready.

This repository is a V5 L2 build-packet candidate for a pianola-style player piano.
The design centers on a perforated paper roll, a tracker bar, pneumatic sensing,
pouches and valves, and a pneumatic action that operates a conventional piano
action. The musical goal is not a new tuning system; it is a reliable
roll-reading and note-actuation mechanism that can preserve expressive timing
without claiming fabrication authority.

This packet is intentionally conservative. It does not release tracker-bar hole
spacing, roll scale, vacuum pressure, pouch dimensions, valve geometry, tube
lengths, strike force, action travel, tuning data, CAD, DXF, or toolpaths.
Every physical value remains `estimate_pending_measurement` until a measured
reference, prototype, or reviewed design table exists.

## Packet Map

- `design.md` - mechanism, subsystem interfaces, L2 prototype sequence, and
  measurement gates.
- `bom.csv` - estimated subsystem list with pending measurement authority.
- `cut-list.csv` - placeholder make/buy/cut planning register with no released
  dimensions.
- `decision-record.md` - decisions, assumptions, open questions, and L2 gates.
- `visual-output-register.csv` - V5 authority register for this concept packet.
- `cad/mcp-session-log.md` - QMD and no-MCP provenance log.

## Core Mechanisms

- A perforated roll stores note and control events as holes.
- The tracker bar senses open holes as the roll passes over it.
- Pneumatic pouches and valves amplify small tracker-bar pressure changes.
- Pneumatic motors or action drivers move the piano action.
- The piano action, not the pneumatic system alone, determines final hammer
  behavior and tone.

## L2 Readiness Boundary

L2 means the repo is organized enough for review and prototype planning, but
all build-affecting geometry, roll scale, pressure, force, timing, and action
travel claims remain `pending_measurement`. Promotion to L3 requires validated
geometry and measured setup evidence from a tracker-bar, pouch/valve, and
action-coupling prototype.
