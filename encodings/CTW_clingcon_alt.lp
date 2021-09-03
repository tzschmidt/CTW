% alternative clingcon encoding for testing
#const kkk=k**3.
#const kk=k**2.
jobNum(1..k).

% generation
&dom { 1..k } = at(T) :- jobNum(T).
&distinct { at(T) : jobNum(T) }.

% hard Atomic Precedence Constraint
:- T1>T2, &sum { at(T1) } = J1, &sum { at(T2) } = J2, atomiccon(J1,J2), jobNum(T1), jobNum(T2).

% Disjunctive Precedence Constraint
1{atomiccon(J1,J2); atomiccon(J1,J3)}2 :- discon(J1,J2,J1,J3).

% Direct Successor Constraint
:- T1!=T2-1, &sum { at(T1) } = J1, &sum { at(T2) } = J2, dirsuccon(J1,J2), jobNum(T1), jobNum(T2).

% Optimization
% S
&sum { s(J) } = 1 :- |T1-T2|>1, &sum { at(T1) } = J, &sum { at(T2) } = J+b, jobNum(J), J<=b, jobNum(T1), jobNum(T2).
&sum { s(J) } >= 0 :- jobNum(J), J<=b.
&sum { s(J) : jobNum(J), J<=b} <= s.

% shaky
% M
&sum { m(T,J) } = 1 :- &sum { at(T1) } = J, &sum { at(T2) } = J+b, T1<T, T<T2, jobNum(J), J<=b, jobNum(T), jobNum(T1), jobNum(T2).
&sum { m(T,J) } = 1 :- &sum { at(T1) } = J, &sum { at(T2) } = J+b, T2<T, T<T1, jobNum(J), J<=b, jobNum(T), jobNum(T1), jobNum(T2).
&sum { m(T,J) } >= 0 :- jobNum(T), jobNum(J), J<=b.
&sum { m(T,J) : jobNum(J), J<=b } <= m(T) :- jobNum(T).
&sum { m(T) } >= 0 :- jobNum(T).
&sum { m(T) } <= m :- jobNum(T).

% L
&sum { l(J) } = X :- X=|T1-T2|-1, &sum { at(T1) } = J, &sum { at(T2) } = J+b, jobNum(J), J<=b, jobNum(T1), jobNum(T2).
&sum { l(J) } >= 0 :- jobNum(J), J<=b.
&sum { l(J) } <= l :- jobNum(J), J<=b.

% N
&sum { n(J1,J2) } = 1 :- T1>T2, &sum { at(T1) } = J1, &sum { at(T2) } = J2, softcon(J1,J2), jobNum(T1), jobNum(T2).
&sum { n(J1,J2) } >= 0 :- softcon(J1,J2).
&sum { n(J1,J2) : softcon(J1,J2)} <= n.

&sum { kkk*s ; kk*m ; k*l ; n } <= bound.
&minimize { bound }.

&show {at(X):jobNum(X)}.