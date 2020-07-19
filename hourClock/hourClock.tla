---------------------- MODULE hourClock ----------------------
\* Should check `Stuttering Steps`
\* https://lamport.azurewebsites.net/tla/stuttering.html
EXTENDS Naturals, TLC
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt == hr' = IF hr # 12 THEN hr + 1 ELSE 1
\* HCnxt == hr' = hr + 1
HC == HCini /\ [][HCnxt]_hr
--------------------------------------------------------------
THEOREM HC => []HCini
INV1 == hr \in (1 .. 12)
==============================================================