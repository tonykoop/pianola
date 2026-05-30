<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Subsystem Interface Spec

Status: L3-candidate interface scaffold. All dimensions, pressures, timing
values, and forces are pending measurement.

## Roll Transport -> Tracker Bar

Inputs:

- Roll media position.
- Hole exposure state.
- Paper tension and edge tracking.

Outputs:

- Stable exposure of intended tracker ports.
- No paper damage or snagging.
- Serviceable debris path.

Open interface questions:

- What roll standard or measured test strip controls port placement?
- What paper contact condition seals without drag?
- How is misalignment detected before false triggering?

## Tracker Bar -> Pneumatic Signal Chain

Inputs:

- Open or closed tracker port state.
- Port isolation from neighbors.
- Cleaning condition.

Outputs:

- Pneumatic signal to pouch or pilot valve.
- Leak-isolated channel identity.
- Access for cleaning and test adapters.

Open interface questions:

- What leak test proves the tracker is not the limiting subsystem?
- How is tubing identity preserved during assembly and service?
- What features prevent cross-connection during scale-up?

## Pouch/Valve -> Actuator

Inputs:

- Tracker signal.
- Supply and vent availability.
- Pouch and valve reset state.

Outputs:

- Controlled pneumatic event to actuator.
- Return to ready state.
- Isolatable failure if the valve leaks or sticks.

Open interface questions:

- What response evidence is needed before duplicating a valve module?
- How are stuck-open and stuck-closed failures detected?
- What service path allows pouch replacement without disturbing the tracker?

## Actuator -> Piano Action

Inputs:

- Pneumatic output event.
- Action rest state.
- Safety stop or decoupler state.

Outputs:

- Controlled action movement.
- Reset without damage.
- Observable timing relation between roll event and action event.

Open interface questions:

- Which action point is safe to actuate for the first rig?
- How is lost motion recorded without assigning final values?
- What decoupler prevents damage during pneumatic faults?

## Controls -> Note Chain

Inputs:

- Tempo command.
- Expression or sustain branch state.
- Reroll or stop command.

Outputs:

- No masking of basic note-chain faults.
- Separate evidence for expression behavior.
- Clear boundary between mechanical reliability and musical expression.

Open interface questions:

- When is the note chain stable enough to add controls?
- How are expression failures separated from tracker or valve failures?
