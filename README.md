<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Pianola

Status: L1 V5 concept packet; pneumatic player-piano mechanism study only, not
fabrication-ready.

This repository is a V5 L1 build-packet seed for a pianola-style player piano.
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

- `design.md` - mechanism, parametric intent, and measurement gates.
- `bom.csv` - estimated subsystem list with pending measurement authority.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register for this concept packet.
- `cad/mcp-session-log.md` - QMD and no-MCP provenance log.

## Core Mechanisms

- A perforated roll stores note and control events as holes.
- The tracker bar senses open holes as the roll passes over it.
- Pneumatic pouches and valves amplify small tracker-bar pressure changes.
- Pneumatic motors or action drivers move the piano action.
- The piano action, not the pneumatic system alone, determines final hammer
  behavior and tone.

## Readiness Boundary

L1 means intent, risks, and subsystem interfaces are documented. Promotion to
L2 requires reviewed parameters, measured or sourced reference constraints, and
prototype test plans. L3 or stronger requires validated geometry and measured
setup evidence.
