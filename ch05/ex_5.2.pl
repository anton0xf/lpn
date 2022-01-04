increment(N, M) :- N + 1 =:= M.

:- begin_tests(increment).
test(increment) :- increment(4, 5).
test(increment_no, [fail]) :- increment(4, 6).
:- end_tests(increment).

sum(N, M, S) :- N + M =:= S.

:-begin_tests(sum).
test(sum) :- sum(4, 5, 9).
test(sum_no, [fail]) :- sum(4, 6, 12).
:- end_tests(sum).

%?- run_tests.
%@ % PL-Unit: increment .. done
%@ % PL-Unit: sum .. done
%@ % All 4 tests passed
%@ true.
