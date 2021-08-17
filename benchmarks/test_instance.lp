% test instance
% num of cables
#const k=7.
% num of 2-sided cables
#const b=2.
% num of 1-sided cables
%#const n=k-2*b.

atomiccon(3,2).
atomiccon(5,6).
atomiccon(7,5).
% (c_l,c_i,c_l,c_j) -> (c_l < c_i) v (c_l < c_j)
discon(6,1,6,2).
dirsuccon(1,4).

softcon(5,1).
softcon(3,7).