// =============================================================
// Slip-Cast Ceramic Ocarina — OpenSCAD Master-Shape Starter
// =============================================================
// Generated 2026-05-02 from the OCA-001 parametric design table.
// Units: inches.  Outputs the FIRED body envelope; multiply by
// master_scale_factor to get the printed master geometry.
//
// This is a master-shape STARTER — it captures the chamber volume
// and primary outer profile, NOT the fipple/voicing geometry.
// Voicing window, windway, and labium must be refined by hand or
// in detailed CAD because they are sensitive to manufacturing
// process and have to be tuned empirically per-prototype.
//
// References:
//   - design.md "Governing Model" section (Helmholtz vessel)
//   - ocarina-design-table.xlsx (chamber volume, hole schedule)
//   - drawings/ocarina-body-section.svg (target section view)
// =============================================================

$fn = 96;

// ---------------- INPUT PARAMETERS (edit these) ---------------

// From design.md "Current Workbook Inputs":
chamber_volume_cm3   = 130;     // Helmholtz V_chamber (Alto C target)
wall_thickness_cm    = 0.4;     // average fired wall thickness
voicing_window_w_cm  = 0.9;     // labium width  (W in design table)
voicing_window_h_cm  = 0.5;     // window height (H in design table)
shrinkage            = 0.12;    // measured clay shrinkage; replace with per-batch value

// Body-shape character (free design parameters — affect ergonomics, not pitch):
body_aspect          = 1.30;    // wide/long ratio of the lentil shape
body_taper           = 0.55;    // tip pinch ratio at mouthpiece end
mouthpiece_len_cm    = 1.40;    // length of pinched neck before windway

// Conversion to inches (Tony's shop standard):
function cm_to_in(x) = x / 2.54;

// Derived volume → equivalent ellipsoid axes (rough match):
// Volume of ellipsoid = (4/3)*pi*a*b*c.  Pin c = a/body_aspect.
function ellipsoid_a_cm(V, aspect) = pow(V * (3/(4*PI)) * aspect, 1/3);

a_cm = ellipsoid_a_cm(chamber_volume_cm3, body_aspect);   // long semi-axis
b_cm = a_cm / body_aspect;                                // wide semi-axis
c_cm = b_cm * 0.7;                                        // depth (flatter lentil)

// Add wall thickness to get OUTER fired dimensions:
A_cm = a_cm + wall_thickness_cm;
B_cm = b_cm + wall_thickness_cm;
C_cm = c_cm + wall_thickness_cm;

// Inches:
A_in = cm_to_in(A_cm);
B_in = cm_to_in(B_cm);
C_in = cm_to_in(C_cm);

// Master scale factor to compensate for shrinkage:
master_scale_factor = 1 / (1 - shrinkage);   // ~1.136 at 12% shrinkage

// ----------------------- GEOMETRY -----------------------------

module fired_outer_envelope() {
    // Lentil body — flattened ellipsoid, mouthpiece pinched on +X end.
    hull() {
        scale([A_in, B_in, C_in]) sphere(r=1);
        translate([A_in*0.92, 0, 0])
            scale([A_in*0.20, B_in*body_taper, C_in*body_taper])
                sphere(r=1);
    }
}

module fired_inner_chamber() {
    // Inner cavity = outer minus wall (uniform offset by wall_thickness).
    wall_in = cm_to_in(wall_thickness_cm);
    hull() {
        scale([A_in - wall_in, B_in - wall_in, C_in - wall_in]) sphere(r=1);
        translate([A_in*0.92, 0, 0])
            scale([(A_in - wall_in)*0.20, (B_in - wall_in)*body_taper, (C_in - wall_in)*body_taper])
                sphere(r=1);
    }
}

module voicing_window_cut() {
    // Rectangular labium window on the top surface, near the mouthpiece pinch.
    w_in = cm_to_in(voicing_window_w_cm);
    h_in = cm_to_in(voicing_window_h_cm);
    translate([A_in*0.55, 0, C_in*0.85])
        rotate([0, 0, 0])
            cube([w_in, w_in*0.6, h_in*3], center=true);
}

module fired_body() {
    difference() {
        fired_outer_envelope();
        fired_inner_chamber();
        voicing_window_cut();
        // 12 finger holes — start undersized.  Diameters sweep 0.16-0.31 in.
        for (i = [0 : 11]) {
            dia = 0.16 + (i % 4) * 0.04;
            theta = 90 + (i - 5.5) * 18;
            translate([A_in*0.30 + (i % 4) * (A_in*0.10),
                       B_in*0.55 * cos(theta),
                       C_in*0.55 * sin(theta)])
                rotate([0, 90, 0])
                    cylinder(h=C_in*2, d=dia, center=true);
        }
    }
}

module printed_master() {
    // Master = fired-body solid (no chamber cut) scaled up by shrinkage factor.
    scale([master_scale_factor, master_scale_factor, master_scale_factor])
        fired_outer_envelope();
}

// ---------------------- DEFAULT PREVIEW -----------------------

// Show the fired body (with chamber + holes + voicing) on the left
// and the solid master (scaled up) on the right.
fired_body();
translate([A_in * 3, 0, 0]) printed_master();

// Echo derived dimensions to the OpenSCAD console:
echo(str("Fired outer envelope (in): ", 2*A_in, " x ", 2*B_in, " x ", 2*C_in));
echo(str("Master scale factor: ", master_scale_factor));
echo(str("Master envelope (in): ", 2*A_in*master_scale_factor, " x ",
                                    2*B_in*master_scale_factor, " x ",
                                    2*C_in*master_scale_factor));
