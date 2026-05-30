<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Pianola Design Study

## Design Thesis

This concept treats the pianola as a pneumatic control instrument coupled to a
piano action. The core engineering problem is not the piano scale; it is the
chain from perforated roll to tracker-bar sensing, pouch/valve amplification,
action actuation, timing, and repeatable reset.

## Mechanism Overview

A perforated roll passes across a tracker bar. When a hole in the roll exposes
a tracker-bar port, the local pressure state changes. That small signal is
routed to a pouch or valve system, which amplifies the event and admits or
releases vacuum/air to a pneumatic actuator. The actuator then moves part of
the piano action so a hammer can strike a string through the normal action
chain.

The design problem is a timing and leakage problem as much as a force problem.
The tracker bar must sense holes cleanly, the roll must track without tearing
or wandering, pouches must respond quickly without sticking, valves must seal
and vent predictably, and the action must return before the next event.

Expression controls, sustain, reroll, tempo, and dynamic response are left as
named future branches. This L1 packet focuses on a single-note pneumatic chain
and the interfaces needed to scale it later.

## Subsystems

### Roll Transport

- The roll transport must keep paper aligned across the tracker bar.
- Roll drive, rewind, take-up, tension, and edge guidance are all
  `estimate_pending_measurement`.
- No roll scale, hole geometry, tempo range, or spool dimensions are released
  in this L1 packet.

### Tracker Bar

- The tracker bar is the sensing surface.
- Port layout, sealing surface, paper contact, and cleaning access are pending
  measured reference or prototype work.
- First tests should use a small transparent or inspectable tracker-bar section.

### Pneumatic Signal Chain

- Tracker-bar pressure changes should operate a pouch or pilot valve.
- Pouch material, valve seat, venting path, and leakage tolerance require bench
  testing.
- Vacuum level and airflow are not specified at L1.

### Action Actuation

- Pneumatic output must interface with a piano key/action or a representative
  action test rig.
- The actuator should move enough to test timing and repeatability without
  claiming final strike force or tone.
- Lost motion, reset speed, and regulation are first-order risks.

### Expression And Controls

- Sustain, soft/loud response, tempo, reroll, and expression coding are future
  branches.
- The first packet should not mix expressive control claims with the basic
  note-actuation proof.
- Expression claims require measured timing and action response.

## Parametric Intent

Future design work should use named parameters before any fabrication file is
created:

- `estimate_roll_scale_pending_measurement`
- `estimate_tracker_bar_port_layout_pending_measurement`
- `estimate_pouch_area_pending_measurement`
- `estimate_valve_seat_geometry_pending_measurement`
- `estimate_vacuum_level_pending_measurement`
- `estimate_tube_routing_pending_measurement`
- `estimate_action_travel_pending_measurement`
- `estimate_repeat_rate_pending_measurement`
- `estimate_expression_control_path_pending_measurement`

These names are placeholders, not values.

## First Measurement Gates

- Tracker sensing: verify a single roll hole can produce a clean signal without
  paper snagging or false triggering.
- Pouch response: measure whether one pouch/valve pair opens and resets
  repeatably without sticking.
- Leak behavior: record leak paths before scaling to many notes.
- Actuation: drive one action or representative key mechanism and log travel,
  reset, and missed notes.
- Timing: compare roll event timing to action event timing on a small test rig.
- Serviceability: prove tracker-bar cleaning, pouch replacement, and valve
  adjustment can happen without destructive disassembly.

## L1 Boundary

This file is a concept and engineering-risk map. It does not provide CAD,
DXF, tooling instructions, dimensions, roll-hole coordinates, vacuum pressure,
tuning, strike-force values, or a measured acoustic/action model.
