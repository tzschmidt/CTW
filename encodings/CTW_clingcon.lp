% native ASP encoding
jobNum(1..k).

% to improve
1{solution(T,J) : jobNum(J)}1 :- jobNum(T).
:- solution(T1,J), solution(T2,J), T1!=T2.

% hard Atomic Precedence Constraint
:- solution(T1,J1), solution(T2,J2), atomiccon(J1,J2), T1>T2.

% Disjunctive Precedence Constraint
:- solution(T1,J1), solution(T2,J2), solution(T3,J3), discon(J1,J2,J1,J3), T1>T2, T1>T3.

% Direct Successor Consraint
:- solution(T1,J1), solution(T2,J2), dirsuccon(J1,J2), T1!=T2-1.

% Optimal Solution
s(0) :- b=0.
s(X) :- b!=0, X == #count{J:solution(T1,J), solution(T2,J+b), |T1-T2|>1, J<=b}.

m(0) :- b=0.
ms(T,S1+S2) :- b!=0, jobNum(T),
S1 == #count{J1:J1<=b, solution(T1,J1), solution(T,J), solution(T2,J1+b), T1<T, T<T2},
S2 == #count{J1:J1>b, J1<=2*b, solution(T1,J1), solution(T,J), solution(T2,J1-b), T1<T, T<T2}.
m(X) :- X == #max{Y,T:ms(T,Y)}.

l(0) :- b=0.
ls(J1,X) :- b!=0, solution(T1,J1), solution(T2,J1+b), X=|T1-T2|-1.
l(X) :- X == #max{Y,J:ls(J,Y)}.

sov(J1) :- solution(T1,J1), solution(T2,J2), softcon(J1,J2), T1>T2.
n(X) :- X == #count{J:sov(J)}.

cost(X) :- X=k**3*S+k**2*M+k*L+N, s(S), m(M), l(L), n(N).
%#minimize{X: X=k**3*S+k**2*M+k*L+N, s(S), m(M), l(L), n(N)}.
#minimize{X@4: s(X)}.
#minimize{X@3: m(X)}.
#minimize{X@2: l(X)}.
#minimize{X@1: n(X)}.

#show solution/2.
#show s/1.
#show m/1.
#show l/1.
#show n/1.
#show cost/1.