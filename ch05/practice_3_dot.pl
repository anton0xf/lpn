dot([], [], 0).
dot([X | XS], [Y | YS], Z) :- dot(XS, YS, R), Z is X * Y + R.

%?- dot([2, 5, 6], [3, 4, 1], R).
%@ R = 32.

dot_acc([], [], A, A).
dot_acc([X | XS], [Y | YS], A, R) :- Anew is A + X * Y, dot_acc(XS, YS, Anew, R).
dot2(XS, YS, R) :- dot_acc(XS, YS, 0, R).

%?- dot2([2, 5, 6], [3, 4, 1], R).
%@ R = 32.

:- begin_tests(dot).
test(dot) :- dot([2, 5, 6], [3, 4, 1], 32).
test(dot2) :- dot2([2, 5, 6], [3, 4, 1], 32).
:- end_tests(dot).

%?- run_tests.
%@ % PL-Unit: dot .. done
%@ % All 2 tests passed
%@ true.
