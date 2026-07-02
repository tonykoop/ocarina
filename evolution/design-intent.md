# Design Intent — ocarina rev A

- Master CAD: `cad/ocarina_master.scad` (sha256: dbe5ac36bc03ff687ec57d1da0b3d720a6569ada6bf7fe08b9159e2718f1e306), driven by `ocarina-design-table.xlsx` (sha256: 442e99759ec02864dfd48abc05ec13afdeaa3071adc5c351f21350051b5849fa)
- Function: Closed-cavity ceramic vessel flute (Helmholtz resonator). Pitch is set by chamber volume and total open-hole area — NOT by tone-hole position along a bore. Hole positions are ergonomic, not acoustic. First target: magazine-standard Alto C 12-hole. f = c/(2π)·√(A_open/(V_chamber·L_eff)), L_eff = wall + 0.6·√(A_open/π).
- Environment: slip-cast Cone-6 stoneware via 3D-printed master + plaster mold; clay shrinkage (~12% assumed) scales the master at ~1.136×. Fipple/voicing geometry is empirical and outside the Helmholtz model.
- Target qty: 1 (prototype — OCA-P1 closed vessel first). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Chamber volume (Alto C / OCA-P1) | 130 cm³ | water-fill check at greenware/bisque/glaze | governs fundamental (A4 = 440 Hz) | family-spec.csv OCA-P1 (inferred_from_workbook) |
| Voicing window (OCA-P1) | 0.9 × 0.5 cm | empirical; do not finalize from table | tone speaking / voicing | family-spec.csv OCA-P1 (inferred_from_workbook) |
| Wall thickness (OCA-P1) | 0.4 cm | drying/leak/crack gate | shell strength + sealing | family-spec.csv OCA-P1 (inferred) |
| Master scale factor | 1/(1 − shrinkage) ≈ 1.136× @ 12% | recompute from measured clay test | fired size vs master | design table / family-spec (assumption_until_clay_test) |
| Target low note | A4 = 440 Hz | ±cents logged in validation.csv | tuning correctness | family-spec.csv OCA-P1 |
| Cumulative open-hole area (12-hole) | per design-table formula chart | tune undersized holes post-bisque | sets chromatic scale A4–F6 | ocarina-design-table.xlsx / family-spec OCA-P3 |

## Incidental (free for DFM)

- Vessel outer body styling, mouthpiece/duct exterior contour, glaze color/family, non-mating surface finish, sling/grip cosmetics.

## Must-nots (DFM may never violate)

- Windway/labium/fipple voicing geometry is tuning-sensitive: never freeze it from the table or a lossy mesh export — tune empirically and log (README / design.md; Helmholtz model says nothing about voicing).
- Do not expand to full 12-hole layout before OCA-P1 (chamber+fipple) and OCA-P2 (4-hole tuning) checks pass (family-spec next_measurement).
- Cut voicing window + finger holes undersized before bisque; tune up (README build chain).
- Do not treat production .step/.stl as authority until first prototype validates voicing geometry (README status).

## Material intent

- Preferred: Cone-6 stoneware slip; PLA (or sealable resin) 3D-printed master; two-piece plaster mother mold (per bom.csv / README build chain).
- Acceptable subs: per sourcing.csv / supplier-rfq.md (spec-first; live prices unverified; mouth-safe glazes only).
- Forbidden: non-mouth-safe interior finishes on played bodies.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. Fabrication authority remains measurement-gated (V5 candidate, not build-ready).
