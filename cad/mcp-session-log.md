<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# MCP Session Log

No MCP, CAD, rendering, image-generation, creative-tool, SolidWorks, DXF, or
acoustic/action-computation session was run for this L1 packet. No geometry was
generated. No dimensions, tuning numbers, vacuum pressure values, roll-hole
coordinates, DXF coordinates, G-code, or fabrication outputs are claimed.

## QMD Step 0

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-qmd-query | qmd CLI | `qmd query "pianola player piano pneumatic perforated roll tracker bar pouches valves striking a piano action"` | none | context_retrieval | concept_only | attempted | Query entered the local qmd/Bun stack and crashed with a Bun segmentation fault before returning usable context. |
| 2026-05-30-local-authoring | Codex local edit | Real pianola/player-piano mechanism knowledge plus failed QMD Step 0 | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_authoring | concept_only | self_checked | Authored an L1 concept packet only. All fabrication-relevant claims remain pending measurement. |
| 2026-05-30-wolfram-source | Codex local edit | `design.md`; Round 8 Wolfram author contract | `pianola-starter.wl`; `wolfram/pianola-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_source_authoring | reference_only | self_checked | Source authored by hand. No Wolfram Desktop, Wolfram Cloud, MCP, CAD, rendering, or acoustic/action-computation session was run; all numeric inputs are estimate placeholders pending measurement, not fabrication authority. |
