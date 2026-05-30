<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risk FMEA

Status: qualitative L3-candidate FMEA. No numeric RPN, measured frequency,
pressure, force, or dimension values are claimed.

| Subsystem | Failure Mode | Effect | Cause Hypotheses | Detection Method | Mitigation Before Authority | Authority |
| --- | --- | --- | --- | --- | --- | --- |
| Roll transport | Paper wanders across tracker bar | False note or missed note | Edge guidance, tension, skew, or paper damage | Visual tracking log and one-hole signal test | Prove repeatable tracking on test media before full-width layout | pending_measurement |
| Roll transport | Paper snags or tears | Test stops and reference media damaged | Tracker contact, burrs, debris, or tension | Inspection after repeated passes | Improve contact surface and cleaning access before authority | pending_measurement |
| Tracker bar | Closed port leaks | False trigger or weak contrast | Surface leak, debris, poor seal, or port damage | Closed-state leak isolation test | Record cleaning method and retest after service | pending_measurement |
| Tracker bar | Open port signal is weak | Missed trigger | Hole exposure, tube routing, or tracker restriction | One-hole open-state response test | Isolate tracker from pouch/valve before redesign | pending_measurement |
| Pneumatic pouch | Pouch sticks or responds slowly | Late note or missed reset | Material, mounting, humidity, fatigue, or contamination | Repeated bench cycle observation | Select serviceable pouch material and replacement path | pending_measurement |
| Valve | Valve leaks or sticks open | Sustained unwanted actuation | Seat condition, vent path, debris, or return failure | Leak and reset rig test | Add service access and fault isolation before scale-up | pending_measurement |
| Tubing/channel | Signal delay varies by route | Timing smear | Path length, restriction, leakage, or kinks | Compare route behavior on bench rig | Define routing rules only after measured evidence | pending_measurement |
| Actuator | Actuator overdrives action | Possible action damage | Excess travel, stuck valve, or missing stop | Action rig with decoupler and observer hold point | Use safe stops and decoupling before real piano action | pending_measurement |
| Action interface | Lost motion masks response | Weak or inconsistent strike | Interface slack, compliance, or regulation mismatch | Representative action motion log | Measure interface before any fabrication release | pending_measurement |
| Controls | Expression branch hides note-chain fault | Misdiagnosed reliability | Adding complexity too early | Test controls only after basic chain passes | Keep expression branch separate until basic actuation is stable | concept_only |
| Serviceability | Component cannot be cleaned or replaced | Drift or failure after assembly | Hidden tracker, buried pouch, inaccessible valve | Service rehearsal on rig | Add access features before duplicating modules | pending_measurement |
