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
s(J) :- jobNum(J), J<=b, solution(T1,J), solution(T2,J+b), |T1-T2| > 1.

%-------------------
m(0) :- b=0.
mcheck(T,J) :- jobNum(J), jobNum(T), J<=b, solution(T1,J), solution(T2,J+b), T1<T, T<T2.
mcheck(T,J) :- jobNum(J), jobNum(T), J<=b, solution(T1,J), solution(T2,J+b), T2<T, T<T1.

maux(T,1,0) :- not mcheck(T,1), jobNum(T).
maux(T,1,1) :- mcheck(T,1), jobNum(T).
maux(T,J,N) :- not mcheck(T,J),  maux(T,J-1,N), J=2..b.
maux(T,J,N+1) :- mcheck(T,J),  maux(T,J-1,N), J=2..b.
ms(T,X) :- maux(T,b,X).

mchain(X) :- ms(T,X).
mchain(X-1) :- mchain(X), X > 0.
m(X) :- mchain(X), not mchain(X+1).

%-------------------
l(0) :- b=0.
ls(J,X) :- b!=0, solution(T1,J), solution(T2,J+b), X=|T1-T2|-1, J<=b.

lchain(X) :- ls(J,X).
lchain(X-1) :- lchain(X), X > 0.
l(X) :- lchain(X), not lchain(X+1).

%-------------------
n(J1,J2) :- solution(T1,J1), solution(T2,J2), softcon(J1,J2), T1>T2.

%-------------------
#minimize{kkk@4,J: s(J)}.
#minimize{kk*X@3: m(X)}.
#minimize{k*X@2: l(X)}.
#minimize{1@1,J1,J2: n(J1,J2)}.

#show solution/2.
#show s/1.
#show m/1.
#show l/1.
#show n/2.