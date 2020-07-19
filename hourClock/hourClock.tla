---------------------- MODULE hourClock ----------------------
EXTENDS Naturals, TLC
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt ==
    /\ PrintT(hr)
    /\ hr' = IF hr /= 12 THEN hr + 1 ELSE 1
HC == HCini /\ [][HCnxt]_hr
--------------------------------------------------------------TH == [](hr \in (2 .. 13))
THEOREM HC => []HCini
==============================================================