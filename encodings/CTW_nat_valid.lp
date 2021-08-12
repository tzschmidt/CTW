% native ASP encoding
jobNum(1..2*b+n).

% to improve
1{solution(T,J) : jobNum(J)}1 :- jobNum(T).
:- solution(T1,J), solution(T2,J), T1!=T2.

% hard Atomic Precedence Constraint
:- solution(T1,J1), solution(T2,J2), atomiccon(J1,J2), T1>T2.

% Disjunctive Precedence Constraint
:- solution(T1,J1), solution(T2,J2), solution(T3,J3), discon(J1,J2,J1,J3), T1>T2, T1>T3.

% Direct Successor Consraint
:- solution(T1,J1), solution(T2,J2), disuccon(J1,J2), T1!=T2-1.

#show solution/2.
