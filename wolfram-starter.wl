(* Ocarina Helmholtz notebook starter *)

ClearAll["Global`*"];

c = 34300; (* cm/s at about 20 C *)
targetA4 = 440;
volumeCm3 = 130;
wallCm = 0.4;
windowWcm = 0.9;
windowHcm = 0.5;

voicingAreaCm2[w_, h_] := w*h;
endCorrectionCm[area_] := 0.6*Sqrt[area/Pi];
helmholtzHz[area_, volume_, neckLength_] :=
  (c/(2*Pi))*Sqrt[area/(volume*neckLength)];
centsError[measured_, target_] := 1200*Log[2, measured/target];

baseArea = voicingAreaCm2[windowWcm, windowHcm];
baseNeck = wallCm + endCorrectionCm[baseArea];
baseFreq = helmholtzHz[baseArea, volumeCm3, baseNeck];

holeDiameterMmToAreaCm2[d_] := Pi*(d/20)^2;
targetFreq[midi_] := 440*2^((midi - 69)/12);
areaForFrequency[f_, volume_, neckLength_] :=
  volume*neckLength*(2*Pi*f/c)^2;

(* Candidate cumulative area table for A4 to A5. *)
notes = {
  {"A4", 69}, {"Bb4", 70}, {"B4", 71}, {"C5", 72},
  {"C#5", 73}, {"D5", 74}, {"D#5", 75}, {"E5", 76},
  {"F5", 77}, {"F#5", 78}, {"G5", 79}, {"G#5", 80}, {"A5", 81}
};

areaTable = Table[
  With[{freq = targetFreq[midi]},
    {name, freq, areaForFrequency[freq, volumeCm3, baseNeck]}
  ],
  { {name, midi}, notes}
];

areaTable // TableForm

