% benchmark R196_k70
% num of cables
#const k=70.
% num of 2-sided cables
#const b=35.

% atomic constraints
atomiccon(1,7).
atomiccon(1,29).
atomiccon(1,30).
atomiccon(1,38).
atomiccon(1,39).
atomiccon(1,44).
atomiccon(1,45).
atomiccon(2,7).
atomiccon(2,8).
atomiccon(2,9).
atomiccon(2,10).
atomiccon(2,29).
atomiccon(2,30).
atomiccon(2,31).
atomiccon(2,32).
atomiccon(2,38).
atomiccon(2,39).
atomiccon(2,40).
atomiccon(2,41).
atomiccon(2,44).
atomiccon(2,45).
atomiccon(3,7).
atomiccon(3,8).
atomiccon(3,9).
atomiccon(3,10).
atomiccon(3,11).
atomiccon(3,29).
atomiccon(3,30).
atomiccon(3,31).
atomiccon(3,32).
atomiccon(3,33).
atomiccon(3,34).
atomiccon(3,38).
atomiccon(3,39).
atomiccon(3,40).
atomiccon(3,41).
atomiccon(3,42).
atomiccon(3,43).
atomiccon(3,44).
atomiccon(3,45).
atomiccon(4,5).
atomiccon(4,6).
atomiccon(4,7).
atomiccon(4,8).
atomiccon(4,9).
atomiccon(4,10).
atomiccon(4,11).
atomiccon(4,29).
atomiccon(4,30).
atomiccon(4,31).
atomiccon(4,32).
atomiccon(4,33).
atomiccon(4,34).
atomiccon(4,35).
atomiccon(4,36).
atomiccon(4,38).
atomiccon(4,39).
atomiccon(4,40).
atomiccon(4,41).
atomiccon(4,42).
atomiccon(4,43).
atomiccon(4,44).
atomiccon(4,45).
atomiccon(5,10).
atomiccon(5,11).
atomiccon(12,23).
atomiccon(13,6).
atomiccon(13,11).
atomiccon(14,5).
atomiccon(14,6).
atomiccon(14,9).
atomiccon(14,10).
atomiccon(14,11).
atomiccon(15,5).
atomiccon(15,6).
atomiccon(15,8).
atomiccon(15,9).
atomiccon(15,10).
atomiccon(15,11).
atomiccon(16,5).
atomiccon(16,6).
atomiccon(16,7).
atomiccon(16,8).
atomiccon(16,9).
atomiccon(16,10).
atomiccon(16,11).
atomiccon(17,5).
atomiccon(17,6).
atomiccon(17,7).
atomiccon(17,8).
atomiccon(17,9).
atomiccon(17,10).
atomiccon(17,11).
atomiccon(18,6).
atomiccon(18,23).
atomiccon(19,6).
atomiccon(19,11).
atomiccon(19,13).
atomiccon(19,23).
atomiccon(20,5).
atomiccon(20,6).
atomiccon(20,10).
atomiccon(20,11).
atomiccon(20,13).
atomiccon(21,5).
atomiccon(21,6).
atomiccon(21,9).
atomiccon(21,10).
atomiccon(21,11).
atomiccon(21,13).
atomiccon(21,14).
atomiccon(22,5).
atomiccon(22,6).
atomiccon(22,8).
atomiccon(22,9).
atomiccon(22,10).
atomiccon(22,11).
atomiccon(22,13).
atomiccon(22,14).
atomiccon(22,15).
atomiccon(59,5).
atomiccon(59,6).
atomiccon(59,7).
atomiccon(59,8).
atomiccon(59,9).
atomiccon(59,10).
atomiccon(59,11).
atomiccon(59,25).
atomiccon(59,26).
atomiccon(59,57).
atomiccon(59,27).
atomiccon(59,58).
atomiccon(59,56).
atomiccon(59,29).
atomiccon(59,30).
atomiccon(59,31).
atomiccon(59,32).
atomiccon(59,33).
atomiccon(59,34).
atomiccon(59,35).
atomiccon(59,36).
atomiccon(59,37).
atomiccon(59,38).
atomiccon(59,39).
atomiccon(59,40).
atomiccon(59,41).
atomiccon(59,42).
atomiccon(59,43).
atomiccon(59,44).
atomiccon(59,45).
atomiccon(25,5).
atomiccon(25,6).
atomiccon(25,7).
atomiccon(25,8).
atomiccon(25,9).
atomiccon(25,10).
atomiccon(25,11).
atomiccon(25,26).
atomiccon(25,57).
atomiccon(25,27).
atomiccon(25,58).
atomiccon(25,56).
atomiccon(25,29).
atomiccon(25,30).
atomiccon(25,31).
atomiccon(25,32).
atomiccon(25,33).
atomiccon(25,34).
atomiccon(25,35).
atomiccon(25,36).
atomiccon(25,37).
atomiccon(25,38).
atomiccon(25,39).
atomiccon(25,40).
atomiccon(25,41).
atomiccon(25,42).
atomiccon(25,43).
atomiccon(25,44).
atomiccon(25,45).
atomiccon(24,5).
atomiccon(24,6).
atomiccon(24,7).
atomiccon(24,8).
atomiccon(24,9).
atomiccon(24,10).
atomiccon(24,11).
atomiccon(24,59).
atomiccon(24,25).
atomiccon(24,26).
atomiccon(24,57).
atomiccon(24,27).
atomiccon(24,28).
atomiccon(24,58).
atomiccon(24,56).
atomiccon(24,29).
atomiccon(24,30).
atomiccon(24,31).
atomiccon(24,32).
atomiccon(24,33).
atomiccon(24,34).
atomiccon(24,35).
atomiccon(24,36).
atomiccon(24,37).
atomiccon(24,38).
atomiccon(24,39).
atomiccon(24,40).
atomiccon(24,41).
atomiccon(24,42).
atomiccon(24,43).
atomiccon(24,44).
atomiccon(24,45).
atomiccon(26,5).
atomiccon(26,6).
atomiccon(26,7).
atomiccon(26,8).
atomiccon(26,9).
atomiccon(26,10).
atomiccon(26,11).
atomiccon(26,57).
atomiccon(26,27).
atomiccon(26,58).
atomiccon(26,56).
atomiccon(26,29).
atomiccon(26,30).
atomiccon(26,31).
atomiccon(26,32).
atomiccon(26,33).
atomiccon(26,34).
atomiccon(26,35).
atomiccon(26,36).
atomiccon(26,37).
atomiccon(26,38).
atomiccon(26,39).
atomiccon(26,40).
atomiccon(26,41).
atomiccon(26,42).
atomiccon(26,43).
atomiccon(26,44).
atomiccon(26,45).
atomiccon(57,5).
atomiccon(57,6).
atomiccon(57,7).
atomiccon(57,8).
atomiccon(57,9).
atomiccon(57,10).
atomiccon(57,11).
atomiccon(57,27).
atomiccon(57,29).
atomiccon(57,30).
atomiccon(57,31).
atomiccon(57,32).
atomiccon(57,33).
atomiccon(57,34).
atomiccon(57,35).
atomiccon(57,36).
atomiccon(57,37).
atomiccon(57,38).
atomiccon(57,39).
atomiccon(57,40).
atomiccon(57,41).
atomiccon(57,42).
atomiccon(57,43).
atomiccon(57,44).
atomiccon(57,45).
atomiccon(27,5).
atomiccon(27,6).
atomiccon(27,7).
atomiccon(27,8).
atomiccon(27,9).
atomiccon(27,10).
atomiccon(27,11).
atomiccon(27,29).
atomiccon(27,30).
atomiccon(27,31).
atomiccon(27,32).
atomiccon(27,33).
atomiccon(27,34).
atomiccon(27,35).
atomiccon(27,36).
atomiccon(27,37).
atomiccon(27,38).
atomiccon(27,39).
atomiccon(27,40).
atomiccon(27,41).
atomiccon(27,42).
atomiccon(27,43).
atomiccon(27,44).
atomiccon(27,45).
atomiccon(28,5).
atomiccon(28,6).
atomiccon(28,7).
atomiccon(28,8).
atomiccon(28,9).
atomiccon(28,10).
atomiccon(28,11).
atomiccon(28,25).
atomiccon(28,26).
atomiccon(28,57).
atomiccon(28,27).
atomiccon(28,58).
atomiccon(28,56).
atomiccon(28,29).
atomiccon(28,30).
atomiccon(28,31).
atomiccon(28,32).
atomiccon(28,33).
atomiccon(28,34).
atomiccon(28,35).
atomiccon(28,36).
atomiccon(28,37).
atomiccon(28,38).
atomiccon(28,39).
atomiccon(28,40).
atomiccon(28,41).
atomiccon(28,42).
atomiccon(28,43).
atomiccon(28,44).
atomiccon(28,45).
atomiccon(58,5).
atomiccon(58,6).
atomiccon(58,7).
atomiccon(58,8).
atomiccon(58,9).
atomiccon(58,10).
atomiccon(58,11).
atomiccon(58,57).
atomiccon(58,27).
atomiccon(58,56).
atomiccon(58,29).
atomiccon(58,30).
atomiccon(58,31).
atomiccon(58,32).
atomiccon(58,33).
atomiccon(58,34).
atomiccon(58,35).
atomiccon(58,36).
atomiccon(58,37).
atomiccon(58,38).
atomiccon(58,39).
atomiccon(58,40).
atomiccon(58,41).
atomiccon(58,42).
atomiccon(58,43).
atomiccon(58,44).
atomiccon(58,45).
atomiccon(56,5).
atomiccon(56,6).
atomiccon(56,7).
atomiccon(56,8).
atomiccon(56,9).
atomiccon(56,10).
atomiccon(56,11).
atomiccon(56,57).
atomiccon(56,27).
atomiccon(56,29).
atomiccon(56,30).
atomiccon(56,31).
atomiccon(56,32).
atomiccon(56,33).
atomiccon(56,34).
atomiccon(56,35).
atomiccon(56,36).
atomiccon(56,37).
atomiccon(56,38).
atomiccon(56,39).
atomiccon(56,40).
atomiccon(56,41).
atomiccon(56,42).
atomiccon(56,43).
atomiccon(56,44).
atomiccon(56,45).
atomiccon(30,7).
atomiccon(30,8).
atomiccon(30,29).
atomiccon(30,38).
atomiccon(30,39).
atomiccon(30,40).
atomiccon(31,7).
atomiccon(31,8).
atomiccon(31,9).
atomiccon(31,38).
atomiccon(31,39).
atomiccon(31,40).
atomiccon(31,41).
atomiccon(32,7).
atomiccon(32,8).
atomiccon(32,9).
atomiccon(32,10).
atomiccon(32,39).
atomiccon(32,40).
atomiccon(32,41).
atomiccon(32,42).
atomiccon(33,7).
atomiccon(33,8).
atomiccon(33,9).
atomiccon(33,10).
atomiccon(33,11).
atomiccon(33,40).
atomiccon(33,41).
atomiccon(33,42).
atomiccon(33,43).
atomiccon(34,5).
atomiccon(34,7).
atomiccon(34,8).
atomiccon(34,9).
atomiccon(34,10).
atomiccon(34,11).
atomiccon(34,41).
atomiccon(34,42).
atomiccon(34,43).
atomiccon(35,5).
atomiccon(35,6).
atomiccon(35,7).
atomiccon(35,8).
atomiccon(35,9).
atomiccon(35,10).
atomiccon(35,11).
atomiccon(35,42).
atomiccon(35,43).
atomiccon(36,5).
atomiccon(36,6).
atomiccon(36,7).
atomiccon(36,8).
atomiccon(36,9).
atomiccon(36,10).
atomiccon(36,11).
atomiccon(36,43).
atomiccon(37,5).
atomiccon(37,6).
atomiccon(37,7).
atomiccon(37,8).
atomiccon(37,9).
atomiccon(37,10).
atomiccon(37,11).
atomiccon(38,7).
atomiccon(39,7).
atomiccon(39,8).
atomiccon(40,7).
atomiccon(40,8).
atomiccon(40,9).
atomiccon(41,7).
atomiccon(41,8).
atomiccon(41,9).
atomiccon(41,10).
atomiccon(42,7).
atomiccon(42,8).
atomiccon(42,9).
atomiccon(42,10).
atomiccon(42,11).
atomiccon(43,5).
atomiccon(43,7).
atomiccon(43,8).
atomiccon(43,9).
atomiccon(43,10).
atomiccon(43,11).
atomiccon(44,29).
atomiccon(44,38).
atomiccon(45,7).
atomiccon(45,29).
atomiccon(45,38).
atomiccon(45,39).
atomiccon(46,5).
atomiccon(46,6).
atomiccon(46,7).
atomiccon(46,8).
atomiccon(46,9).
atomiccon(46,10).
atomiccon(46,11).
atomiccon(46,12).
atomiccon(46,13).
atomiccon(46,14).
atomiccon(46,15).
atomiccon(46,16).
atomiccon(46,17).
atomiccon(46,18).
atomiccon(46,19).
atomiccon(46,20).
atomiccon(46,21).
atomiccon(46,22).
atomiccon(46,23).
atomiccon(46,47).
atomiccon(46,50).
atomiccon(46,66).
atomiccon(46,62).
atomiccon(46,63).
atomiccon(46,67).
atomiccon(46,64).
atomiccon(46,65).
atomiccon(47,5).
atomiccon(47,6).
atomiccon(47,7).
atomiccon(47,8).
atomiccon(47,9).
atomiccon(47,10).
atomiccon(47,11).
atomiccon(47,12).
atomiccon(47,13).
atomiccon(47,14).
atomiccon(47,15).
atomiccon(47,16).
atomiccon(47,17).
atomiccon(47,18).
atomiccon(47,19).
atomiccon(47,20).
atomiccon(47,21).
atomiccon(47,22).
atomiccon(47,23).
atomiccon(47,50).
atomiccon(47,66).
atomiccon(47,62).
atomiccon(47,63).
atomiccon(47,67).
atomiccon(47,64).
atomiccon(47,65).
atomiccon(48,5).
atomiccon(48,6).
atomiccon(48,7).
atomiccon(48,8).
atomiccon(48,9).
atomiccon(48,10).
atomiccon(48,11).
atomiccon(48,12).
atomiccon(48,13).
atomiccon(48,14).
atomiccon(48,15).
atomiccon(48,16).
atomiccon(48,17).
atomiccon(48,18).
atomiccon(48,19).
atomiccon(48,20).
atomiccon(48,21).
atomiccon(48,22).
atomiccon(48,23).
atomiccon(48,46).
atomiccon(48,47).
atomiccon(48,50).
atomiccon(48,54).
atomiccon(48,55).
atomiccon(48,66).
atomiccon(48,62).
atomiccon(48,63).
atomiccon(48,61).
atomiccon(48,67).
atomiccon(48,64).
atomiccon(48,65).
atomiccon(49,5).
atomiccon(49,6).
atomiccon(49,7).
atomiccon(49,8).
atomiccon(49,9).
atomiccon(49,10).
atomiccon(49,11).
atomiccon(49,12).
atomiccon(49,13).
atomiccon(49,14).
atomiccon(49,15).
atomiccon(49,16).
atomiccon(49,17).
atomiccon(49,18).
atomiccon(49,19).
atomiccon(49,20).
atomiccon(49,21).
atomiccon(49,22).
atomiccon(49,23).
atomiccon(49,46).
atomiccon(49,47).
atomiccon(49,48).
atomiccon(49,50).
atomiccon(49,53).
atomiccon(49,54).
atomiccon(49,55).
atomiccon(49,66).
atomiccon(49,62).
atomiccon(49,63).
atomiccon(49,67).
atomiccon(49,64).
atomiccon(49,65).
atomiccon(50,5).
atomiccon(50,6).
atomiccon(50,7).
atomiccon(50,8).
atomiccon(50,9).
atomiccon(50,10).
atomiccon(50,11).
atomiccon(50,12).
atomiccon(50,13).
atomiccon(50,14).
atomiccon(50,15).
atomiccon(50,16).
atomiccon(50,17).
atomiccon(50,18).
atomiccon(50,19).
atomiccon(50,20).
atomiccon(50,21).
atomiccon(50,22).
atomiccon(50,23).
atomiccon(50,66).
atomiccon(50,62).
atomiccon(50,63).
atomiccon(50,61).
atomiccon(50,67).
atomiccon(50,64).
atomiccon(50,65).
atomiccon(51,5).
atomiccon(51,6).
atomiccon(51,7).
atomiccon(51,8).
atomiccon(51,9).
atomiccon(51,10).
atomiccon(51,11).
atomiccon(51,12).
atomiccon(51,13).
atomiccon(51,14).
atomiccon(51,15).
atomiccon(51,16).
atomiccon(51,17).
atomiccon(51,18).
atomiccon(51,19).
atomiccon(51,20).
atomiccon(51,21).
atomiccon(51,22).
atomiccon(51,23).
atomiccon(51,46).
atomiccon(51,47).
atomiccon(51,48).
atomiccon(51,49).
atomiccon(51,50).
atomiccon(51,52).
atomiccon(51,53).
atomiccon(51,54).
atomiccon(51,55).
atomiccon(51,66).
atomiccon(51,62).
atomiccon(51,63).
atomiccon(51,61).
atomiccon(51,60).
atomiccon(51,68).
atomiccon(51,70).
atomiccon(51,67).
atomiccon(51,64).
atomiccon(51,65).
atomiccon(52,5).
atomiccon(52,6).
atomiccon(52,7).
atomiccon(52,8).
atomiccon(52,9).
atomiccon(52,10).
atomiccon(52,11).
atomiccon(52,12).
atomiccon(52,13).
atomiccon(52,14).
atomiccon(52,15).
atomiccon(52,16).
atomiccon(52,17).
atomiccon(52,18).
atomiccon(52,19).
atomiccon(52,20).
atomiccon(52,21).
atomiccon(52,22).
atomiccon(52,23).
atomiccon(52,46).
atomiccon(52,47).
atomiccon(52,48).
atomiccon(52,49).
atomiccon(52,50).
atomiccon(52,53).
atomiccon(52,54).
atomiccon(52,55).
atomiccon(52,66).
atomiccon(52,62).
atomiccon(52,63).
atomiccon(52,61).
atomiccon(52,60).
atomiccon(52,68).
atomiccon(52,70).
atomiccon(52,67).
atomiccon(52,64).
atomiccon(52,65).
atomiccon(53,5).
atomiccon(53,6).
atomiccon(53,7).
atomiccon(53,8).
atomiccon(53,9).
atomiccon(53,10).
atomiccon(53,11).
atomiccon(53,12).
atomiccon(53,13).
atomiccon(53,14).
atomiccon(53,15).
atomiccon(53,16).
atomiccon(53,17).
atomiccon(53,18).
atomiccon(53,19).
atomiccon(53,20).
atomiccon(53,21).
atomiccon(53,22).
atomiccon(53,23).
atomiccon(53,46).
atomiccon(53,47).
atomiccon(53,50).
atomiccon(53,54).
atomiccon(53,55).
atomiccon(53,66).
atomiccon(53,62).
atomiccon(53,63).
atomiccon(53,67).
atomiccon(53,64).
atomiccon(53,65).
atomiccon(54,5).
atomiccon(54,6).
atomiccon(54,7).
atomiccon(54,8).
atomiccon(54,9).
atomiccon(54,10).
atomiccon(54,11).
atomiccon(54,12).
atomiccon(54,13).
atomiccon(54,14).
atomiccon(54,15).
atomiccon(54,16).
atomiccon(54,17).
atomiccon(54,18).
atomiccon(54,19).
atomiccon(54,20).
atomiccon(54,21).
atomiccon(54,22).
atomiccon(54,23).
atomiccon(54,46).
atomiccon(54,47).
atomiccon(54,50).
atomiccon(54,55).
atomiccon(54,66).
atomiccon(54,62).
atomiccon(54,63).
atomiccon(54,67).
atomiccon(54,64).
atomiccon(54,65).
atomiccon(55,5).
atomiccon(55,6).
atomiccon(55,7).
atomiccon(55,8).
atomiccon(55,9).
atomiccon(55,10).
atomiccon(55,11).
atomiccon(55,12).
atomiccon(55,13).
atomiccon(55,14).
atomiccon(55,15).
atomiccon(55,16).
atomiccon(55,17).
atomiccon(55,18).
atomiccon(55,19).
atomiccon(55,20).
atomiccon(55,21).
atomiccon(55,22).
atomiccon(55,23).
atomiccon(55,46).
atomiccon(55,47).
atomiccon(55,50).
atomiccon(55,66).
atomiccon(55,62).
atomiccon(55,63).
atomiccon(55,67).
atomiccon(55,64).
atomiccon(55,65).
atomiccon(66,62).
atomiccon(66,63).
atomiccon(66,65).
atomiccon(68,60).
atomiccon(68,70).
atomiccon(67,66).
atomiccon(67,62).
atomiccon(67,64).
atomiccon(67,65).
atomiccon(64,62).
atomiccon(64,65).

% disjunctive constraints
discon(1,10,65,1).
discon(2,3,2,1).
discon(2,5,60,2).
discon(2,8,2,63).
discon(3,4,3,2).
discon(3,6,61,3).
discon(3,10,3,65).
discon(4,5,4,60).
discon(8,9,8,7).
discon(9,10,9,8).
discon(10,11,10,9).
discon(14,13,14,15).
discon(15,14,15,16).
discon(16,15,16,17).
discon(18,12,18,19).
discon(19,18,19,20).
discon(20,19,20,21).
discon(21,20,21,22).
discon(30,7,30,62).
discon(30,9,64,30).
discon(30,31,30,45).
discon(31,8,31,63).
discon(31,10,65,31).
discon(31,32,31,30).
discon(29,7,62,29).
discon(32,9,32,64).
discon(32,11,66,32).
discon(32,33,32,31).
discon(33,5,60,33).
discon(33,10,33,65).
discon(33,34,33,32).
discon(34,11,34,66).
discon(34,35,34,33).
discon(35,5,35,60).
discon(35,6,61,35).
discon(35,36,35,34).
discon(36,37,36,35).
discon(37,6,37,61).
discon(38,8,63,38).
discon(38,39,38,29).
discon(39,7,39,62).
discon(39,9,64,39).
discon(39,40,39,38).
discon(40,8,40,63).
discon(40,10,65,40).
discon(40,41,40,39).
discon(41,9,41,64).
discon(41,11,66,41).
discon(41,42,41,40).
discon(42,5,60,42).
discon(42,10,42,65).
discon(42,43,42,41).
discon(43,11,43,66).
discon(44,7,62,44).
discon(45,8,63,45).
discon(45,30,45,44).
discon(46,7,46,62).
discon(46,11,46,66).
discon(46,61,6,46).
discon(46,67,46,12).
discon(47,7,47,62).
discon(47,11,47,66).
discon(47,61,6,47).
discon(47,67,47,12).
discon(48,8,48,63).
discon(48,60,5,48).
discon(49,7,49,62).
discon(49,11,49,66).
discon(49,67,49,12).
discon(50,8,50,63).
discon(53,7,53,62).
discon(53,11,53,66).
discon(53,67,53,12).
discon(54,7,54,62).
discon(54,11,54,66).
discon(54,67,54,12).
discon(55,7,55,62).
discon(55,11,55,66).
discon(55,67,55,12).
discon(62,63,62,65).
discon(63,61,63,62).
discon(61,60,61,63).
discon(60,70,60,61).

% soft atomic constraints
softcon(2,1).
softcon(3,2).
softcon(4,3).
softcon(6,5).
softcon(8,7).
softcon(9,8).
softcon(10,9).
softcon(11,10).
softcon(23,13).
softcon(13,14).
softcon(14,15).
softcon(15,16).
softcon(16,17).
softcon(12,18).
softcon(18,19).
softcon(19,20).
softcon(20,21).
softcon(21,22).
softcon(59,28).
softcon(38,29).
softcon(31,30).
softcon(32,31).
softcon(33,32).
softcon(34,33).
softcon(35,34).
softcon(36,35).
softcon(37,36).
softcon(39,38).
softcon(40,39).
softcon(41,40).
softcon(42,41).
softcon(43,42).
softcon(45,44).
softcon(30,45).
softcon(48,53).
softcon(70,60).
softcon(60,61).
softcon(63,62).
softcon(61,63).
softcon(66,64).
softcon(62,65).

% direct successor constraints

