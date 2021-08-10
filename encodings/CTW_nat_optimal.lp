% test instance
% num of cables
#const k=7.
% num of 2-sided cables
#const b=2.
% num of 1-sided cables
#const n=k-2*b.

atomiccon(3,2).
atomiccon(5,6).
atomiccon(7,5).
% (c_l,c_i,c_l,c_j) -> (c_l < c_i) v (c_l < c_j)
discon(6,1,6,2).
disuccon(1,4).

% native ASP encoding
jobNum(1..2*b+n).

% atm not needed
job(X,X+b) :- jobNum(X), X<=b.
job(X,X):- jobNum(X), 2*b<X.

% to improve
1{solution(T,J) : jobNum(J)}1 :- jobNum(T).
:- solution(T1,J), solution(T2,J), T1!=T2.

% hard Atomic Precedence Constraint
:- solution(T1,J1), solution(T2,J2), atomiccon(J1,J2), T1>T2.

% Disjunctive Precedence Constraint
:- solution(T1,J1), solution(T2,J2), solution(T3,J3), discon(J1,J2,J1,J3), T1>T2, T1>T3.

% Direct Successor Consraint
:- solution(T1,J1), solution(T2,J2), disuccon(J1,J2), T1!=T2-1.

% Optimal Solution
s(0) :- b=0.
s(X) :- b!=0, X == #count{J:solution(T1,J), solution(T2,J+b), |T1-T2|>1, J<=b}.

m(0) :- b=0.
ms(T,S1+S2) :- b!=0, jobNum(T),
S1 == #count{J1:J1<=b, solution(T1,J1), solution(T,J), solution(T2,J1+b), T1<T, T<T2},
S2 == #count{J1:J1>b, J1<=2*b, solution(T1,J1), solution(T,J), solution(T2,J1-b), T1<T, T<T2}.
m(X) :- X == #max{Y,T:ms(T,Y)}.

#show solution/2.
#show s/1.
#show m/1.