# MCP Session Log

This log tracks V5 visual/CAD provenance for `tonykoop/ocarina`.

| artifact | tool | timestamp_utc | session_id | parent_artifact | authority | notes |
| --- | --- | --- | --- | --- | --- | --- |
| family-spec.csv | Codex local edit | 2026-05-18 | round30-v5-explorer-1 | design.md; validation.csv; ocarina-design-table.xlsx | planning ledger | Records vessel-flute authority status without claiming measured Helmholtz validation. |
| visual-output-register.csv | Codex local edit | 2026-05-18 | round30-v5-explorer-1 | cad/ocarina_master.scad; ocarina-design-table.xlsx; drawings/*.svg; images/*.png | authority register | Marks design table and OpenSCAD as candidate fabrication authority; marks SVG/images as preview/concept only. |
| validation-loop.csv | Codex local edit | 2026-05-18 | round30-v5-explorer-1 | validation.csv; drawing-brief.md; cut-list.csv | measurement plan | Adds empirical close-the-loop checks for chamber volume, shrinkage, voicing, and visual authority. |

No OpenSCAD MCP, Blender MCP, Illustrator MCP, Photoshop MCP, or image-generation
session was run in this lane. Future generated V5 artifacts should append one
row per tool session and should name their parent artifact before any output is
treated as fabrication or presentation authority.
