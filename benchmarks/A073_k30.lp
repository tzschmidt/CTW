% benchmark A073_k30
% num of cables
#const k=30.
% num of 2-sided cables
#const b=15.

% atomic constraints
atomiccon(14,1).
atomiccon(14,12).
atomiccon(14,16).
atomiccon(15,1).
atomiccon(15,12).
atomiccon(15,16).
atomiccon(15,27).
atomiccon(17,12).
atomiccon(17,16).
atomiccon(17,27).
atomiccon(18,16).
atomiccon(18,27).
atomiccon(19,27).
atomiccon(22,2).
atomiccon(23,2).
atomiccon(23,3).
atomiccon(24,2).
atomiccon(24,3).
atomiccon(24,4).
atomiccon(25,2).
atomiccon(25,3).
atomiccon(25,4).
atomiccon(25,5).
atomiccon(26,3).
atomiccon(26,4).
atomiccon(26,5).
atomiccon(26,6).
atomiccon(28,4).
atomiccon(28,5).
atomiccon(28,6).
atomiccon(28,7).
atomiccon(29,5).
atomiccon(29,6).
atomiccon(29,7).
atomiccon(29,8).
atomiccon(30,6).
atomiccon(30,7).
atomiccon(30,8).
atomiccon(30,9).

% disjunctive constraints
discon(3,2,3,4).
discon(4,3,4,5).
discon(5,4,5,6).
discon(6,5,6,7).
discon(7,6,7,8).
discon(8,7,8,9).
discon(9,8,9,10).
discon(10,9,10,11).
discon(11,10,11,13).
discon(15,14,15,17).
discon(12,1,12,16).
discon(17,15,17,18).
discon(18,17,18,19).
discon(19,18,19,20).
discon(20,19,20,21).
discon(21,20,21,22).
discon(22,21,22,23).
discon(23,22,23,24).
discon(24,23,24,25).
discon(25,24,25,26).
discon(26,25,26,28).
discon(16,12,16,27).
discon(28,26,28,29).
discon(29,28,29,30).

% soft atomic constraints
softcon(2,3).
softcon(3,4).
softcon(4,5).
softcon(5,6).
softcon(6,7).
softcon(7,8).
softcon(8,9).
softcon(9,10).
softcon(10,11).
softcon(1,12).
softcon(11,13).
softcon(14,15).
softcon(12,16).
softcon(15,17).
softcon(17,18).
softcon(18,19).
softcon(19,20).
softcon(20,21).
softcon(21,22).
softcon(22,23).
softcon(23,24).
softcon(24,25).
softcon(25,26).
softcon(16,27).
softcon(26,28).
softcon(28,29).
softcon(29,30).

% direct successor constraints

