# Ocarina Drawing Brief

## Required Views

- Top view with body outline, hole layout, hand assignment, and centerline.
- Side view with mouthpiece axis, windway height, labium angle, body thickness, and split line.
- Section through fipple showing windway, labium, window, and chamber connection.
- Section through body showing chamber volume reference, target wall thickness, and mold split.
- Detail view for hole diameters and post-fire tuning allowance.
- Mold view showing plaster parting line, registration keys, pour/drain plan, and cottle clearance.

## Critical Dimensions

| Dimension | Source | Tolerance intent |
| --- | --- | --- |
| Chamber volume | Workbook input and water-fill measurement | Tuning critical |
| Voicing window width/height | Workbook input | Playability critical |
| Windway gap | CAD/test-piece measurement | Playability critical |
| Labium angle and edge thickness | CAD/test-piece measurement | Playability critical |
| Wall thickness | Workbook input and cast measurement | Tone/drying critical |
| Hole diameters | Workbook chart and tuning log | Tuning critical |
| Master scale factor | Measured clay shrinkage | Process critical |

## Notes For CAD

- Store chamber volume as a named parameter.
- Store shrinkage factor as a named parameter.
- Separate final fired dimensions from master dimensions.
- Mark fipple geometry as prototype-sensitive; do not freeze it until test pieces speak reliably.
- Include a versioned body ID so castings can be tied back to the CAD master.

