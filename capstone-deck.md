# Slip-Cast Ceramic Ocarina (OCA-001) — v3.1 smoke test
- Musical instrument documentation capstone
- Build packet: ocarina
- Generated: 2026-05-02

---

# Project Intent
- Build a slip-cast ceramic Alto C 12-hole ocarina using a 3D-printed master and plaster mold workflow. The current table is focused on the standard "sweet potato" vessel-flute form, but the same model can be used as the baseline for sculptural vessel flutes.

_Speaker notes:_ Read design.md before committing to dimensions or sourcing decisions.

---

# Physics Model
- Ocarinas behave primarily as Helmholtz resonators:

```
f = c/(2*pi) * sqrt(A_open/(V_chamber * L_eff))
```

_Speaker notes:_ Governing equations extracted verbatim from design.md. Apply empirical corrections (NAF K2, scale offsets) only where the model permits — see references/acoustic-models.md.

---

# How To Use This Packet
- Start with design.md for intent and assumptions.
- Use bom.csv, sourcing.csv, and cut-list.csv before buying or cutting.
- Use drawing-brief.md and CAD/CNC folders before machining.
- Print the packet for shopping, shop work, and validation.

---

# File Map
- design.md: Project intent, catalog metadata, assumptions, and validation plan.
- bom.csv: Starter bill of materials with part categories, quantities, drawing refs, and notes.
- sourcing.csv: Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks.
- cut-list.csv: Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts.
- drawing-brief.md: Manufacturing drawing and technical product sketch brief.
- assembly-manual.md: Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes.
- validation.csv: Target/measured values, tolerance, environment, result, and tuning/build action log.
- supplier-rfq.md: Supplier email/request-for-quote starter.

---

# Build Workflow
- Design and assumptions
- Source materials and hardware
- Prepare stock, fixtures, and CNC/laser/lathe setup
- Assemble, tune, finish, and validate

---

# Sourcing And BOM
- BOM gives part categories and drawing references.
- Sourcing tracks search terms, supplier candidates, price/date, lead time, substitutions.
- Visual BOM brief turns the parts list into a presentation-ready image board.

---

# Shop Packet
- Cut list for lumber/sheet/blank planning.
- Assembly manual for away-from-keyboard work.
- Validation sheet for measured dimensions, tuning, pass/fail checks.

---

# Drawings, CAD, CNC
- drawing-brief.md defines required views, dimensions, datums, sketch intent.
- cad/ holds models and design tables.
- cnc/ holds CAM, toolpaths, setup sheets, dry-run notes.
- drawings/ holds PDFs, SVGs, DXFs, drawing exports.

![drawing](drawings\ocarina-body-section.svg)
![drawing](drawings\ocarina-hole-layout.svg)
![drawing](drawings\ocarina-mold-schematic.svg)

---

# Images And Screenshots
- images\exploded-view-concept.png
- images\exploded-view-concept.svg
- images\hero-concept.png
- images\hero-concept.svg
- images\mold-cross-section-concept.png
- images\mold-cross-section-concept.svg

![image](images\exploded-view-concept.png)
![image](images\exploded-view-concept.svg)
![image](images\hero-concept.png)
![image](images\hero-concept.svg)
![image](images\mold-cross-section-concept.png)
![image](images\mold-cross-section-concept.svg)

---

# Validation Plan
- A4 = 440 Hz reference check.
- Tuning targets logged in validation.csv.
- Critical dimensions verified against design sheet and CAD.
- Photos and revision notes after each major step.

---

# Open Risks / Decisions
- TBDs in design sheet and BOM.
- Supplier price/availability not yet verified.
- Generated images marked as concept placeholders.
- Empirical corrections await measured prototype data.

---

# Next Actions
- Replace TBDs with measured/source-backed values.
- Verify live supplier price and availability before buying.
- Export final drawings and visual BOM images.
- Regenerate this deck and print packet after final edits.

---
