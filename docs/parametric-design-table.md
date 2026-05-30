<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Parametric Design Table

Status: symbolic relationships only. No absolute values are released.

| Symbol | Relationship | Authority | Notes |
| --- | --- | --- | --- |
| `rollAdvancePerEvent` | `rollTransportSpeed * eventTimeWindow` | pending_measurement | Symbolic timing relation; no tempo or speed value is claimed. |
| `trackerPortPitch` | `rollHolePitch + alignmentAllowance` | pending_measurement | Must be measured from a reference roll or test strip before authority. |
| `paperSealCondition` | `paperContactForce / trackerSurfaceArea` | pending_measurement | Expresses dependency only; no force or area value is claimed. |
| `trackerSignalDelay` | `tubePathEffect + pouchResponse + valveResponse` | pending_measurement | Used to plan timing tests, not a measured delay. |
| `leakBudgetTotal` | `trackerLeak + tubeLeak + pouchLeak + valveLeak + actuatorLeak` | pending_measurement | Defines where leak evidence must be isolated. |
| `pouchOutputMargin` | `pouchMotionAvailable - valveMotionRequired` | pending_measurement | Must remain positive after real measurements; no values supplied. |
| `valveResetMargin` | `resetCapability - repeatDemand` | pending_measurement | Symbolic check for repeat behavior only. |
| `actuatorTravelMargin` | `actuatorTravelAvailable - actionTravelRequired` | pending_measurement | Action travel must come from a measured rig. |
| `lostMotionBudget` | `interfaceSlack + compliance + regulationOffset` | pending_measurement | Names sources of uncertainty before assigning tolerances. |
| `serviceAccessEnvelope` | `componentRemovalPath + inspectionClearance` | pending_measurement | Must be reviewed before scale-up. |
| `expressionBranchLoad` | `expressionControlDemand / basicNoteChainCapacity` | pending_measurement | Expression should be added only after the basic chain is measured. |

## Use Rules

- Do not substitute guessed numbers into this table.
- Add measured values only in a future measured design table with source IDs.
- Keep derived CAD or drawings at `pending_measurement` until the source table
  is reviewed.
