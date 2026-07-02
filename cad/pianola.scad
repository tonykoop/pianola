// Pianola (player piano) — parametric STRUCTURAL-ENVELOPE scaffold (concept-only).
//
// Authority: pending_measurement. NOT fabrication authority.
// ---------------------------------------------------------------------------
// HONESTY BOUNDARY (read before using any value here):
//   This packet is deliberately NON-DIMENSIONAL. README.md, design.md,
//   bom.csv, cut-list.csv, and docs/parametric-design-table.md release NO
//   absolute dimensions — every symbol (trackerPortPitch, pouchOutputMargin,
//   actuatorTravelMargin, ...) is `pending_measurement`. Therefore EVERY
//   numeric leaf value below is a RENDER-ONLY PLACEHOLDER chosen only so the
//   envelope draws; NONE is a design, timing, pressure, or fabrication
//   authority. Placeholders are tagged `// PLACEHOLDER`.
//   The DOCUMENTED content this file honestly encodes is the set of SYMBOLIC
//   RELATIONSHIPS from docs/parametric-design-table.md (leak budget, pouch/
//   valve/actuator margins) — expressed as formulas, not baked values.
//   This models the ACOUSTIC/STRUCTURAL ENVELOPE (piano case, string band,
//   keyboard, pneumatic-stack reserved volumes). Full mechanism (roll drive,
//   pouch/valve internals, action linkage) is intentionally OUT OF SCOPE —
//   see design.md.
// ---------------------------------------------------------------------------
// Units: millimeters.

/* [Piano case envelope — upright player piano, PLACEHOLDER extents] */
case_width_mm      = 1450;  // PLACEHOLDER keyboard-span width
case_height_mm     = 1300;  // PLACEHOLDER upright case height
case_depth_mm      = 650;   // PLACEHOLDER case depth
wall_thk_mm        = 18;    // PLACEHOLDER case wall thickness
soundboard_thk_mm  = 8;     // PLACEHOLDER soundboard thickness

/* [Keyboard / action envelope — PLACEHOLDER] */
key_count          = 88;    // PLACEHOLDER compass (no scale authority)
key_span_mm        = 1220;  // PLACEHOLDER 88-key span envelope
keyboard_depth_mm  = 350;   // PLACEHOLDER keyboard well depth
action_height_mm   = 300;   // PLACEHOLDER action envelope height

/* [String band envelope — PLACEHOLDER] */
string_band_frac   = 0.9;   // PLACEHOLDER string band as fraction of width
string_band_ht_mm  = 900;   // PLACEHOLDER vertical string-band height (upright)

/* [Pneumatic stack envelope — docs/parametric-design-table.md; PLACEHOLDER] */
tracker_bar_len_mm = 300;   // PLACEHOLDER tracker-bar length
roll_span_mm       = 340;   // PLACEHOLDER roll transport span
valve_chest_ht_mm  = 220;   // PLACEHOLDER pouch/valve chest height
pouch_motion_mm    = 6;     // PLACEHOLDER pouchMotionAvailable
valve_motion_mm    = 4;     // PLACEHOLDER valveMotionRequired
actuator_travel_mm = 12;    // PLACEHOLDER actuatorTravelAvailable
action_travel_mm   = 10;    // PLACEHOLDER actionTravelRequired

// ---------------------------------------------------------------------------
// Derived geometry — DOCUMENTED symbolic margins as formulas
// (docs/parametric-design-table.md). Honest, source-traceable part of model.
// ---------------------------------------------------------------------------

// pouchOutputMargin = pouchMotionAvailable - valveMotionRequired (must be > 0).
function pouch_output_margin(pouch, valve) = pouch - valve;
pouch_margin_mm = pouch_output_margin(pouch_motion_mm, valve_motion_mm);

// actuatorTravelMargin = actuatorTravelAvailable - actionTravelRequired (> 0).
function actuator_travel_margin(act, action) = act - action;
actuator_margin_mm = actuator_travel_margin(actuator_travel_mm, action_travel_mm);

margins_ok = (pouch_margin_mm > 0) && (actuator_margin_mm > 0);
string_band_len_mm = case_width_mm * string_band_frac;

module case_shell() {
  difference() {
    cube([case_width_mm, case_depth_mm, case_height_mm]);
    translate([wall_thk_mm, wall_thk_mm, wall_thk_mm])
      cube([case_width_mm - 2*wall_thk_mm, case_depth_mm - 2*wall_thk_mm,
            case_height_mm - 2*wall_thk_mm]);
  }
}

eps = 3;  // interpenetration so interior features form a clean 2-manifold union

module soundboard_and_strings() {
  // Vertical soundboard + string band at the back of the upright case.
  // Embed into the back wall (eps overlap) to avoid coincident faces.
  translate([wall_thk_mm, case_depth_mm - wall_thk_mm - soundboard_thk_mm, case_height_mm - string_band_ht_mm - wall_thk_mm])
    cube([string_band_len_mm, soundboard_thk_mm + wall_thk_mm/2, string_band_ht_mm]);
}

module keyboard_and_action() {
  // Keyboard well + action envelope at the front, mid-height (crosses front wall).
  translate([(case_width_mm - key_span_mm)/2, -eps, case_height_mm*0.42])
    cube([key_span_mm, keyboard_depth_mm + eps, action_height_mm]);
}

module pneumatic_stack() {
  // Tracker bar + roll transport (top) and valve chest (below action) as
  // reserved envelope volumes only; embedded with eps overlaps.
  translate([(case_width_mm - roll_span_mm)/2, case_depth_mm*0.3, case_height_mm - wall_thk_mm - 120])
    cube([roll_span_mm, 120, 120 + wall_thk_mm/2]);              // roll + tracker bar (into top wall)
  translate([(case_width_mm - key_span_mm)/2, keyboard_depth_mm - eps, case_height_mm*0.42 - valve_chest_ht_mm])
    cube([key_span_mm, 180, valve_chest_ht_mm + eps]);           // pouch/valve chest (overlaps keyboard)
}

module pianola_assembly() {
  case_shell();
  soundboard_and_strings();
  keyboard_and_action();
  pneumatic_stack();
}

pianola_assembly();

echo(str("pouch_output_margin_mm=", pouch_margin_mm));
echo(str("actuator_travel_margin_mm=", actuator_margin_mm));
echo(str("string_band_len_mm=", string_band_len_mm));
echo(str("margins_ok(placeholder)=", margins_ok));
echo("AUTHORITY=pending_measurement; all leaf values are render-only placeholders.");
