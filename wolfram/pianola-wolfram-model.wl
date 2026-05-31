(* Pianola parametric/symbolic pneumatic action model.
   Source-only planning model. All defaults are estimates pending measurement,
   not fabrication authority. *)

ClearAll["Global`*"];

modelMetadata = <|
  "instrument" -> "pianola",
  "packet" -> "Round 8 Wolfram build-packet model",
  "modelName" -> "tracker-port, pouch-valve, actuator, and action timing proxy",
  "authority" -> "reference_only source; not measured; not fabrication authority"
|>;

rollEventDuration[rollHoleLength_, paperSpeed_] :=
  rollHoleLength/paperSpeed;

pneumaticTimeConstant[flowResistance_, pneumaticCompliance_] :=
  flowResistance pneumaticCompliance;

actuatorForce[pressureDrop_, actuatorArea_] :=
  pressureDrop actuatorArea;

staticActionTravel[force_, actionSpringRate_] :=
  force/actionSpringRate;

responseFraction[eventDuration_, timeConstant_] :=
  1 - Exp[-eventDuration/timeConstant];

pianolaModel[rollHoleLengthEstimate_, paperSpeedEstimate_,
   pressureDropEstimate_, actuatorAreaEstimate_,
   actionSpringRateEstimate_, flowResistanceEstimate_,
   pneumaticComplianceEstimate_, requiredTravelEstimate_,
   resetTravelEstimate_, resetTimeEstimate_] :=
  Module[
    {eventDuration, timeConstant, force, travel, deliveredTravel,
     strikeMargin, resetSpeed},
    eventDuration =
      rollEventDuration[rollHoleLengthEstimate, paperSpeedEstimate];
    timeConstant =
      pneumaticTimeConstant[flowResistanceEstimate,
        pneumaticComplianceEstimate];
    force = actuatorForce[pressureDropEstimate, actuatorAreaEstimate];
    travel = staticActionTravel[force, actionSpringRateEstimate];
    deliveredTravel = travel responseFraction[eventDuration, timeConstant];
    strikeMargin = deliveredTravel - requiredTravelEstimate;
    resetSpeed = resetTravelEstimate/resetTimeEstimate;
    <|
      "eventDurationEstimate" -> eventDuration,
      "pneumaticTimeConstantEstimate" -> timeConstant,
      "actuatorForceEstimate" -> force,
      "staticActionTravelEstimate" -> travel,
      "deliveredActionTravelEstimate" -> deliveredTravel,
      "strikeMarginEstimate" -> strikeMargin,
      "resetSpeedEstimate" -> resetSpeed,
      "authority" ->
        "computed from estimate placeholders; pending measurement, not fabrication authority"
    |>
  ];

defaultInputs = <|
  "rollHoleLengthEstimate" -> 0.004, (* estimate -- pending measurement, not fabrication authority *)
  "rollHoleLengthMinimumEstimate" -> 0.0005, (* estimate -- pending measurement, not fabrication authority *)
  "rollHoleLengthMaximumEstimate" -> 0.02, (* estimate -- pending measurement, not fabrication authority *)
  "paperSpeedEstimate" -> 0.05, (* estimate -- pending measurement, not fabrication authority *)
  "paperSpeedMinimumEstimate" -> 0.005, (* estimate -- pending measurement, not fabrication authority *)
  "paperSpeedMaximumEstimate" -> 0.2, (* estimate -- pending measurement, not fabrication authority *)
  "pressureDropEstimate" -> 2500.0, (* estimate -- pending measurement, not fabrication authority *)
  "pressureDropMinimumEstimate" -> 100.0, (* estimate -- pending measurement, not fabrication authority *)
  "pressureDropMaximumEstimate" -> 8000.0, (* estimate -- pending measurement, not fabrication authority *)
  "actuatorAreaEstimate" -> 0.0004, (* estimate -- pending measurement, not fabrication authority *)
  "actuatorAreaMinimumEstimate" -> 0.00005, (* estimate -- pending measurement, not fabrication authority *)
  "actuatorAreaMaximumEstimate" -> 0.002, (* estimate -- pending measurement, not fabrication authority *)
  "actionSpringRateEstimate" -> 100.0, (* estimate -- pending measurement, not fabrication authority *)
  "actionSpringRateMinimumEstimate" -> 10.0, (* estimate -- pending measurement, not fabrication authority *)
  "actionSpringRateMaximumEstimate" -> 1000.0, (* estimate -- pending measurement, not fabrication authority *)
  "flowResistanceEstimate" -> 800.0, (* estimate -- pending measurement, not fabrication authority *)
  "flowResistanceMinimumEstimate" -> 10.0, (* estimate -- pending measurement, not fabrication authority *)
  "flowResistanceMaximumEstimate" -> 5000.0, (* estimate -- pending measurement, not fabrication authority *)
  "pneumaticComplianceEstimate" -> 0.00005, (* estimate -- pending measurement, not fabrication authority *)
  "pneumaticComplianceMinimumEstimate" -> 0.000005, (* estimate -- pending measurement, not fabrication authority *)
  "pneumaticComplianceMaximumEstimate" -> 0.0005, (* estimate -- pending measurement, not fabrication authority *)
  "requiredTravelEstimate" -> 0.006, (* estimate -- pending measurement, not fabrication authority *)
  "requiredTravelMinimumEstimate" -> 0.001, (* estimate -- pending measurement, not fabrication authority *)
  "requiredTravelMaximumEstimate" -> 0.02, (* estimate -- pending measurement, not fabrication authority *)
  "resetTravelEstimate" -> 0.006, (* estimate -- pending measurement, not fabrication authority *)
  "resetTravelMinimumEstimate" -> 0.001, (* estimate -- pending measurement, not fabrication authority *)
  "resetTravelMaximumEstimate" -> 0.02, (* estimate -- pending measurement, not fabrication authority *)
  "resetTimeEstimate" -> 0.08, (* estimate -- pending measurement, not fabrication authority *)
  "resetTimeMinimumEstimate" -> 0.01, (* estimate -- pending measurement, not fabrication authority *)
  "resetTimeMaximumEstimate" -> 0.5 (* estimate -- pending measurement, not fabrication authority *)
|>;

symbolicModel =
  pianolaModel[rollHoleLengthEstimate, paperSpeedEstimate,
    pressureDropEstimate, actuatorAreaEstimate, actionSpringRateEstimate,
    flowResistanceEstimate, pneumaticComplianceEstimate,
    requiredTravelEstimate, resetTravelEstimate, resetTimeEstimate];

pianolaExplorer =
  Manipulate[
    Dataset[
      pianolaModel[rollHoleLengthEstimate, paperSpeedEstimate,
        pressureDropEstimate, actuatorAreaEstimate,
        actionSpringRateEstimate, flowResistanceEstimate,
        pneumaticComplianceEstimate, requiredTravelEstimate,
        resetTravelEstimate, resetTimeEstimate]
    ],
    {{rollHoleLengthEstimate, defaultInputs["rollHoleLengthEstimate"],
      "roll hole length estimate"},
      defaultInputs["rollHoleLengthMinimumEstimate"],
      defaultInputs["rollHoleLengthMaximumEstimate"],
      Appearance -> "Labeled"},
    {{paperSpeedEstimate, defaultInputs["paperSpeedEstimate"],
      "paper speed estimate"},
      defaultInputs["paperSpeedMinimumEstimate"],
      defaultInputs["paperSpeedMaximumEstimate"],
      Appearance -> "Labeled"},
    {{pressureDropEstimate, defaultInputs["pressureDropEstimate"],
      "pressure drop estimate"},
      defaultInputs["pressureDropMinimumEstimate"],
      defaultInputs["pressureDropMaximumEstimate"],
      Appearance -> "Labeled"},
    {{actuatorAreaEstimate, defaultInputs["actuatorAreaEstimate"],
      "actuator area estimate"},
      defaultInputs["actuatorAreaMinimumEstimate"],
      defaultInputs["actuatorAreaMaximumEstimate"],
      Appearance -> "Labeled"},
    {{actionSpringRateEstimate,
      defaultInputs["actionSpringRateEstimate"],
      "action spring rate estimate"},
      defaultInputs["actionSpringRateMinimumEstimate"],
      defaultInputs["actionSpringRateMaximumEstimate"],
      Appearance -> "Labeled"},
    {{flowResistanceEstimate, defaultInputs["flowResistanceEstimate"],
      "flow resistance estimate"},
      defaultInputs["flowResistanceMinimumEstimate"],
      defaultInputs["flowResistanceMaximumEstimate"],
      Appearance -> "Labeled"},
    {{pneumaticComplianceEstimate,
      defaultInputs["pneumaticComplianceEstimate"],
      "pneumatic compliance estimate"},
      defaultInputs["pneumaticComplianceMinimumEstimate"],
      defaultInputs["pneumaticComplianceMaximumEstimate"],
      Appearance -> "Labeled"},
    {{requiredTravelEstimate, defaultInputs["requiredTravelEstimate"],
      "required travel estimate"},
      defaultInputs["requiredTravelMinimumEstimate"],
      defaultInputs["requiredTravelMaximumEstimate"],
      Appearance -> "Labeled"},
    {{resetTravelEstimate, defaultInputs["resetTravelEstimate"],
      "reset travel estimate"},
      defaultInputs["resetTravelMinimumEstimate"],
      defaultInputs["resetTravelMaximumEstimate"],
      Appearance -> "Labeled"},
    {{resetTimeEstimate, defaultInputs["resetTimeEstimate"],
      "reset time estimate"},
      defaultInputs["resetTimeMinimumEstimate"],
      defaultInputs["resetTimeMaximumEstimate"],
      Appearance -> "Labeled"},
    SaveDefinitions -> True
  ];

<|
  "metadata" -> modelMetadata,
  "defaults" -> defaultInputs,
  "symbolicModel" -> symbolicModel,
  "explorer" -> pianolaExplorer
|>
