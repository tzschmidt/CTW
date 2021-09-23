% native ASP encoding
jobNum(1..k).

% generation
1{solution(T,J) : jobNum(J)}1 :- jobNum(T).
:- solution(T1,J), solution(T2,J), T1!=T2.

% hard Atomic Precedence Constraint
:- solution(T1,J1), solution(T2,J2), atomiccon(J1,J2), T1>T2.

% Disjunctive Precedence Constraint
1{atomiccon(J1,J2); atomiccon(J1,J3)}2 :- discon(J1,J2,J1,J3).

% Direct Successor Constraint
:- solution(T1,J1), solution(T2,J2), disuccon(J1,J2), T1!=T2-1.

#show solution/2.
