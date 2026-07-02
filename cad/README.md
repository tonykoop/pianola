<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# CAD Notes

`pianola.scad` is a parametric **structural-envelope scaffold** — authority
`pending_measurement`, **not** fabrication authority. See
`../visual-output-register.csv` (PL-CAD-001) and `mcp-session-log.md`.

This packet is deliberately non-dimensional: every leaf number in the `.scad`
is a render-only placeholder (tagged `// PLACEHOLDER`), chosen only so the
piano case / soundboard+string band / keyboard-action / pneumatic-stack
envelope draws. The honest, source-traceable content is the set of **symbolic
margins** from `../docs/parametric-design-table.md` (`pouchOutputMargin`,
`actuatorTravelMargin`, leak budget) encoded as formulas.

Full mechanism (roll drive, pouch/valve internals, action linkage) is
intentionally **out of scope** — see `../design.md`.

Render check: `openscad -o /tmp/pianola-check.stl pianola.scad`
exits 0 (manifold solid, "Simple: yes"). Promote a placeholder to a real value
only via a measured/reviewed authority-register row.
