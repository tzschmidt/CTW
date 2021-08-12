% benchmark A031
% num of cables
#const k=18.
% num of 2-sided cables
#const b=9.

% atomic constraints
atomiccon(4,8).
atomiccon(5,8).
atomiccon(5,9).
atomiccon(6,1).
atomiccon(6,9).
atomiccon(7,1).
atomiccon(7,2).
atomiccon(10,15).
atomiccon(10,16).
atomiccon(11,15).
atomiccon(11,16).
atomiccon(17,10).
atomiccon(17,11).
atomiccon(17,15).
atomiccon(17,16).
atomiccon(17,13).
atomiccon(17,14).
atomiccon(18,11).
atomiccon(18,16).
atomiccon(18,13).
atomiccon(18,14).
atomiccon(12,14).
atomiccon(13,10).
atomiccon(13,11).
atomiccon(13,15).
atomiccon(13,16).
atomiccon(14,11).
atomiccon(14,16).

% disjunctive constraints
discon(4,3,4,5).
discon(17,2,17,11).
discon(17,7,17,16).
discon(18,17,18,12).
discon(13,2,13,11).
discon(13,7,13,16).

% soft atomic constraints
softcon(9,1).
softcon(1,2).
softcon(3,4).
softcon(4,5).
softcon(5,6).
softcon(6,7).
softcon(8,9).
softcon(10,11).
softcon(18,12).
softcon(13,14).
softcon(15,16).
softcon(17,18).

% direct successor constraints
% /