----------------- MODULE euclid ----------------
EXTENDS Naturals, TLC
CONSTANTS N

(*--algorithm EuclidAlg
variables u = 24 ; v \in 1..N ;
begin
print <<u, v>> ;
while u # 0 do
    if u < v then
        u := v || v := u ; \* swap u and v.
    end if ;
    u := u - v;
end while ;
print <<"have gcd", v>> ;
end algorithm
*)
\* BEGIN TRANSLATION - the hash of the PCal code: PCal-0548d5eb5e18dabb06e4f97e1e36d1e4
VARIABLES u, v, pc

vars == << u, v, pc >>

Init == (* Global variables *)
        /\ u = 24
        /\ v \in 1..N
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ PrintT(<<u, v>>)
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << u, v >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF u # 0
               THEN /\ IF u < v
                          THEN /\ /\ u' = v
                                  /\ v' = u
                          ELSE /\ TRUE
                               /\ UNCHANGED << u, v >>
                    /\ pc' = "Lbl_3"
               ELSE /\ PrintT(<<"have gcd", v>>)
                    /\ pc' = "Done"
                    /\ UNCHANGED << u, v >>

Lbl_3 == /\ pc = "Lbl_3"
         /\ u' = u - v
         /\ pc' = "Lbl_2"
         /\ v' = v

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2 \/ Lbl_3 \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION - the hash of the generated TLA code (remove to silence divergence warnings): TLA-7825cdcb03a244622849715ba4df1730
====
