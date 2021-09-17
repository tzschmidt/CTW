% native ASP encoding
#const kkk=k**3.
#const kk=k**2.
jobNum(1..k).

% generation
1{solution(T,J) : jobNum(J)}1 :- jobNum(T).
:- solution(T1,J), solution(T2,J), T1!=T2.

% hard Atomic Precedence Constraint
:- solution(T1,J1), solution(T2,J2), atomiccon(J1,J2), T1>T2.

% Disjunctive Precedence Constraint
1{atomiccon(J1,J2); atomiccon(J1,J3)}2 :- discon(J1,J2,J1,J3).

% Direct Successor Constraint
:- solution(T1,J1), solution(T2,J2), dirsuccon(J1,J2), T1!=T2-1.

% Optimization
s(0) :- b=0.
s(X) :- b!=0, X = #count{J:solution(T1,J), solution(T2,J+b), |T1-T2|>1, J<=b}.

m(0) :- b=0.
ms(T,S1+S2) :- b!=0, jobNum(T),
S1 = #count{J1:J1<=b, solution(T1,J1), solution(T,J), solution(T2,J1+b), T1<T, T<T2},
S2 = #count{J1:J1>b, J1<=2*b, solution(T1,J1), solution(T,J), solution(T2,J1-b), T1<T, T<T2}.
%m(X) :- X = #max{Y,T:ms(T,Y)}.

mchain(X) :- ms(T,X).
mchain(X-1) :- mchain(X), X > 0.
m(X) :- mchain(X), not mchain(X+1).

l(0) :- b=0.
ls(J,X) :- b!=0, solution(T1,J), solution(T2,J+b), X=|T1-T2|-1, J<=b.
%l(X) :- X = #max{Y,J:ls(J,Y)}.

lchain(X) :- ls(J,X).
lchain(X-1) :- lchain(X), X > 0.
l(X) :- lchain(X), not lchain(X+1).

sov(J1,J2) :- solution(T1,J1), solution(T2,J2), softcon(J1,J2), T1>T2.
n(X) :- X = #count{J1,J2:sov(J1,J2)}.

#minimize{kkk*S+kk*M+k*L+N: s(S), m(M), l(L), n(N)}.
%#minimize{kkk*X@4: s(X)}.
%#minimize{kk*X@3: m(X)}.
%#minimize{k*X@2: l(X)}.
%#minimize{X@1: n(X)}.

#show solution/2.
#show s/1.
#show m/1.
#show l/1.
#show n/1.
#show cost/1.