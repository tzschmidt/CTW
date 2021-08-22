% clingo-dl encoding
#const kkk=k**3.
#const kk=k**2.
jobNum(1..k).

% generation
time(1..k).
&diff { 0-time(J) } <= -1 :- jobNum(J).
&diff { time(J)-0 } <= k :- jobNum(J).
&diff { time(J1)-time(J2) } != 0 :- jobNum(J1), jobNum(J2), J1!=J2.

% hard Atomic Precedence Constraint
&diff { time(J1)-time(J2) } <= -1 :- atomiccon(J1,J2).

% Disjunctive Precedence Constraint
1{atomiccon(J1,J2); atomiccon(J1,J3)}2 :- discon(J1,J2,J1,J3).

% Direct Successor Constraint
&diff { time(J1)-time(J2) } = -1 :- dirsuccon(J1,J2).
%&diff { time(J1)-time(J2) } <= -1 :- dirsuccon(J1,J2).
%&diff { time(J2)-time(J1) } <= 1 :- dirsuccon(J1,J2).

% Optimization
% S
s(J) :- jobNum(J), J<=b, &diff { time(J+b)-time(J) } <= -2.
s(J) :- jobNum(J), J<=b, &diff { time(J)-time(J+b) } <= -2.

% M
m(J1,J2) :- jobNum(J1), jobNum(J2), J2<=b, &diff { time(J2)-time(J1) } <= -1, &diff { time(J1)-time(J2+b) } <= -1. 
m(J1,J2) :- jobNum(J1), jobNum(J2), J2<=b, &diff { time(J1)-time(J2) } <= -1, &diff { time(J2+b)-time(J1) } <= -1.
mc(J,X) :- X == #count { J2 : m(J,J2) }, jobNum(J), X>0.
m(X) :- X == #max { Y,J : mc(J,Y) }.

% L
1{between(J,J+b,N-1) : jobNum(N), N<k}1 :- jobNum(J), J<=b.
&diff { time(J)-time(J+b) } = -N-1 :- &diff { time(J)-time(J+b) } <= -1, jobNum(J), J<=b, between(J,J+b,N).
&diff { time(J)-time(J+b) } = N+1 :- &diff { time(J+b)-time(J) } <= -1, jobNum(J), J<=b, between(J,J+b,N).
l(X) :- X == #max { Y,J : between(J,J+b,Y) }.

% N
n(J1,J2) :- &diff { time(J2)-time(J1) } <= -1, softcon(J1,J2).

#minimize { kkk@4,J : s(J) }.
#minimize { kk*X@3 : m(X) }.
#minimize { k*X@2 : l(X) }.
#minimize { 1@1,J1,J2 : n(J1,J2) }.
