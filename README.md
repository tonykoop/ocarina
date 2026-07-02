# Ocarina — Slip-Cast Ceramic Vessel-Flute Family

> *Engineering documentation for a 3D-printed-master, plaster-mold, cone-6-stoneware slip-cast ocarina family — from Helmholtz physics through the parametric design table to a V5 candidate build packet.*

**Status:** L2 V5 build-packet candidate

Current status: **V5 explorer/build-packet candidate, not build-ready**. The
repo has a parametric design table, OpenSCAD starter, SVG drawing previews, and
concept images, but the build-controlling values for chamber volume, voicing
geometry, clay shrinkage, and tuning still need physical measurement before
they can be treated as validated fabrication authority.

![Hero — AI-generated concept render of a slip-cast Alto C 12-hole ocarina (placeholder until first prototype is photographed)](images/hero-concept.png)
*AI-generated concept render — replace with photo of first OCA-P1 prototype after firing. Manufacturing dimensions come from the parametric design table, not from this image.*

## What this is

Engineering documentation for a small family of slip-cast ceramic ocarinas, built around the Helmholtz vessel-resonator model and a 3D-printed-master / plaster-mold / Cone-6-stoneware production pipeline. The repository combines:

1. **A parametric design table** ([`ocarina-design-table.xlsx`](ocarina-design-table.xlsx)) — chamber volume, voicing-window geometry, wall thickness, shrinkage, and a 12-hole fingering chart with formula-driven hole-area / cumulative-area / frequency columns. Master scale factor `1/(1 - measured_shrinkage)` is parameterized; for a 12% shrinkage assumption, the master scales at ~1.136×.
2. **A full build packet** ([`design.md`](design.md), [`bom.csv`](bom.csv), [`sourcing.csv`](sourcing.csv), [`cut-list.csv`](cut-list.csv), [`validation.csv`](validation.csv), [`assembly-manual.md`](assembly-manual.md), [`supplier-rfq.md`](supplier-rfq.md), [`drawing-brief.md`](drawing-brief.md), [`visual-bom-brief.md`](visual-bom-brief.md), [`wolfram-starter.wl`](wolfram-starter.wl)) — the same scaffold used across the [`tonykoop`](https://github.com/tonykoop) musical-instrument catalogue.
3. **A capstone slide deck and printable shop packet** ([`capstone-deck.pptx`](capstone-deck.pptx), [`print-packet.pdf`](print-packet.pdf)) — recruiter-facing artifacts that show the design record, authority boundaries, and next validation gates.

Sister repos: [`gemshorn`](https://github.com/tonykoop/gemshorn) (where slip-cast horn-flute mold workflow was established and is the closest comparable build packet), [`transverse-flute`](https://github.com/tonykoop/transverse-flute) (slip-cast workflow at larger scale), [`flutes`](https://github.com/tonykoop/flutes) (the NAF / open-pipe family with empirical K2 bore corrections), and [`instrument-maker`](https://github.com/tonykoop/instrument-maker) (the agent skill that generated this packet).

## Background — what makes an ocarina different

The ocarina (Italian *little goose*) is a closed-cavity vessel flute. Unlike a transverse flute or a Native American style flute, **pitch is set by chamber volume and total open-hole area, not by tone-hole position along a bore**. The governing model is the Helmholtz resonator:

```
f = c/(2π) · √( A_open / (V_chamber · L_eff) )
```

where `A_open` is the cumulative open hole area, `V_chamber` is the closed cavity volume, and `L_eff = wall_thickness + 0.6·√(A_open/π)` is the effective neck length with a flanged-port end correction. The full physics treatment is in [`design.md`](design.md) (Governing Model section) and in [`wolfram-starter.wl`](wolfram-starter.wl).

The practical consequence is that ocarina hole positions are an **ergonomic** problem (where the fingers reach), not an acoustic one (where the standing wave wants the holes). This makes the ocarina an unusually clean parametric-design target — change the chamber volume, the whole register transposes; change the cumulative area, the fingering chart re-tunes — but it puts an unusually heavy burden on **fipple/voicing geometry**, which the Helmholtz model says nothing about and which has to be tuned empirically.

## V5 authority map

The current fabrication authority is limited to the design table and OpenSCAD
starter as **candidate geometry**, not validated production geometry:

- `ocarina-design-table.xlsx` carries the inferred workbook values for chamber
  volume, wall thickness, voicing-window size, shrinkage assumption, and hole
  schedule.
- `cad/ocarina_master.scad` is a parametric master-shape starter derived from
  those values. It does not validate the windway, labium, or final fired pitch.
- `family-spec.csv` records the vessel-flute scaling and authority status for
  chamber volume, voicing geometry, shrinkage, and tuning.
- `visual-output-register.csv` marks the CAD/design table as candidate
  fabrication authority and labels SVG/image outputs as previews or concepts.
- `cad/mcp-session-log.md` records that no MCP-generated V5 artifacts were
  created in this lane; future OpenSCAD/Blender/Illustrator/Photoshop sessions
  should append there.

## Family targets

The first prototype is the magazine-standard **Alto C 12-hole** (target low note A4 = 440 Hz, target high note F6 ≈ 1397 Hz, chamber volume 130 cm³ per the design table). The same parametric model can drive a Soprano C / Bass C extension once the Alto C voicing geometry is stable — see the prototype ladder in [`design.md`](design.md).

| Prototype | Goal | Success criteria |
|---|---|---|
| **OCA-P0** voicing tile | Fipple-only practice cavity | Clear tone on a disposable test cavity |
| **OCA-P1** closed vessel | Verify chamber volume + fipple | Stable A4-ish all-closed tone before holes |
| **OCA-P2** 4-hole | Prove tuning workflow | Four tuned notes within ±25 ¢ post-bisque |
| **OCA-P3** 12-hole | Full range | Chromatic A4–A5 playable, no blocked grip |
| **OCA-P4** matched set | Soprano / Alto / Bass C | Shared mold logic, shared glaze family |

## Hardware alignment — Bambu printer + ceramic kiln

This repo is one of the **slip-casting targets** for the in-flight Bambu printer + kiln pipeline. The build chain is:

1. Parametric design table sets fired-body dimensions.
2. Master scale factor `1/(1 - measured_shrinkage)` scales the master STL.
3. Bambu print masters in PLA (or sealable resin); sand layer lines and seal.
4. Two-piece plaster mother mold around the sealed master.
5. Slip-cast Cone 6 stoneware → demold leather-hard → cut voicing window and finger holes undersized → bisque → tune → glaze → final fire.
6. Validate against [`validation.csv`](validation.csv); fold corrections back into the design table.

The same pipeline serves the [`udu`](https://github.com/tonykoop/udu), [`gemshorn`](https://github.com/tonykoop/gemshorn), and [`transverse-flute`](https://github.com/tonykoop/transverse-flute) repos.

## Repository structure

```
ocarina/
├── README.md                       ← you are here
├── LICENSE                         ← CC-BY 4.0
│
├── design.md                       ← Helmholtz model, design intent, prototype ladder
├── ocarina-design-table.xlsx       ← parametric spreadsheet (formulas, blue inputs)
│
├── bom.csv                         ← bill of materials
├── sourcing.csv                    ← supplier/search tracker
├── cut-list.csv                    ← rough/finished dimensions, tolerances
├── validation.csv                  ← target/measured tuning + cents-error log
├── supplier-rfq.md                 ← RFQ template for slip / plaster / consumables
│
├── assembly-manual.md              ← shop-floor build sequence
├── drawing-brief.md                ← required views + critical dimensions for CAD
├── visual-bom-brief.md             ← visual-BOM art-direction brief
├── wolfram-starter.wl              ← Helmholtz physics starter notebook
│
├── capstone-deck.{md,pptx}         ← capstone slide deck (12 slides)
├── print-packet.{md,html,pdf}      ← combined print-ready shop packet (18 pp)
├── capstone-manifest.json          ← orientation manifest
│
├── cad/                            ← parametric body OpenSCAD starter
├── cnc/                            ← (deferred — slip-cast does not need CNC unless turning a wooden master)
├── drawings/                       ← SVG drawings: section, fipple detail, hole layout
├── images/                         ← AI-generated concept renders (placeholders)
└── evolution/                      ← Stage 0 evolution-pipeline intake (manifest, design-intent, revisions)
```

## Status

| Section | Status |
|---|---|
| Parametric design table + Helmholtz model | ✓ done |
| Build packet (BOM / sourcing / cut-list / validation / RFQ) | ✓ done |
| Assembly manual + drawing brief | ✓ done |
| Wolfram physics starter | ✓ done |
| Capstone deck + print packet | ✓ done (auto-generated, recruiter-facing) |
| Concept renders (AI-generated, captioned) | ✓ done (placeholders) |
| Parametric CAD (OpenSCAD starter) | candidate only (master-shape; voicing detail by hand) |
| Dimensioned drawings (SVG) | derived preview only until reviewed against CAD/design-table authority |
| V5 authority/register files | added: `family-spec.csv`, `visual-output-register.csv`, `validation-loop.csv`, `cad/mcp-session-log.md` |
| Production-ready CAD (.step / .stl) | **deferred** — generated after empirical voicing validation in build queue |
| Mold turning / CNC toolpaths | **deferred** — slip-cast workflow uses 3D-printed master, not turned wooden master |
| First OCA-P1 prototype build | forthcoming (Bambu + kiln pipeline) |

Tier 3 production files (.step, validated .stl, .dxf for laser, .gcode for CNC) are **out of scope until the first OCA-P1 prototype validates voicing geometry**. See the README's status table and [`design.md`](design.md) "Open Assumptions" for the deferral reasoning.

## License

Released under [CC-BY 4.0](LICENSE) — original written content, design files, photographs, and physics work in this repository are mine, free to reuse and adapt with credit.
