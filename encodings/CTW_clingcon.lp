% clingcon encoding
#const kkk=k**3.
#const kk=k**2.
jobNum(1..k).

% generation
&dom { 1..k } = time(J) :- jobNum(J).
&distinct { time(J) : jobNum(J) }.

% hard Atomic Precedence Constraint
&sum { time(J1); -1*time(J2) } < 0 :- atomiccon(J1,J2).

% Disjunctive Precedence Constraint
%&sum { 1 : time(J1)<time(J2); 1 : time(J1)<time(J3) } >= 1 :- discon(J1,J2,J1,J3).
1{atomiccon(J1,J2); atomiccon(J1,J3)}2 :- discon(J1,J2,J1,J3).

% Direct Successor Consraint
&sum { time(J1); -1*time(J2) } = -1 :- dirsuccon(J1,J2).

% Optimiztimeion
% S
&sum { s(J) } = 1 :- jobNum(J), J<=b, &sum { time(J); -1*time(J+b) } > 1.
&sum { s(J) } = 1 :- jobNum(J), J<=b, &sum { time(J); -1*time(J+b) } < -1.
&sum { s(J) } >= 0 :- jobNum(J).
&sum { s(J) : jobNum(J)} <= s.

% M
% to improve?
&sum { m(J1,J2) } = 1 :- jobNum(J1), jobNum(J2), J2<=b, &sum { time(J1); -1*time(J2) } > 0, &sum { time(J1); -1*time(J2+b) } < 0. 
&sum { m(J1,J2) } = 1 :- jobNum(J1), jobNum(J2), J2<=b, &sum { time(J1); -1*time(J2) } < 0, &sum { time(J1); -1*time(J2+b) } > 0.
&sum { m(J1,J2) } >= 0 :- jobNum(J1), jobNum(J2), J2<=b.
&sum { m(J1,J2) : jobNum(J2), J2<=b } <= m(J1) :- jobNum(J1).
&sum { m(J) } >= 0 :- jobNum(J).
&sum { m(J) } <= m :- jobNum(J).

% L
&sum { l(J) } = time(J)-time(J+b)-1 :- jobNum(J), J<=b, &sum { time(J); -1*time(J+b) } > 0.
&sum { l(J) } = time(J+b)-time(J)-1 :- jobNum(J), J<=b, &sum { time(J); -1*time(J+b) } < 0.
&sum { l(J) } >= 0 :- jobNum(J).
&sum { l(J) } <= l :- jobNum(J).

% N
&sum { n(J1,J2) } = 1 :- &sum { time(J1); -1*time(J2) } > 0, softcon(J1,J2).
&sum { n(J1,J2) } >= 0 :- softcon(J1,J2).
&sum { n(J1,J2) : softcon(J1,J2)} <= n.


&sum { kkk*s ; kk*m ; k*l ; n } <= bound.
&minimize { bound }.

%&show {time(X):jobNum(X)}.
