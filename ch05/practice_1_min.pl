acc_min([], A, A).
acc_min([H | T], A, Min) :- H < A -> acc_min(T, H, Min); acc_min(T, A, Min).

:- begin_tests(acc_min).
test(acc_min0) :- acc_min([1, 0, 5, 4], 0, 0). 
test(acc_min1) :- acc_min([0, 5, 4], 1, 0).
test(acc_min2) :- acc_min([0, 5, 4], -1, -1).
test(acc_min_minus) :- acc_min([-11, -2, -7, -4, -12], -100, -100). 
test(acc_min_minus2) :- acc_min([-11, -2, -7, -4, -12], -11, -12). 
:- end_tests(acc_min).

min(L, Min) :- L = [H | _], acc_min(L, H, Min).

%?- min([1], X).
%@ X = 1.

:- begin_tests(min).
test(min_empty, [fail]) :- min([], _).
test(min_one) :- min([1], 1).
test(min_one_neg, [fail]) :- min([1], 0).
test(min_two) :- min([1, 2], 1).
test(min_two_rev) :- min([2, 1], 1).
test(min_two_neg, [fail]) :- min([1, 2], 2).
test(min_three1) :- min([1, 2, 3], 1).
test(min_three2) :- min([1, 3, 2], 1).
test(min_three3) :- min([3, 1, 2], 1).
test(min_three_neg, [fail]) :- min([1, 2, 3], 2).
test(min_minus) :- min([-11, -2, -7, -4, -12], -12).
:- end_tests(min).

%?- run_tests.
%@ % PL-Unit: acc_min ..... done
%@ % PL-Unit: min ........... done
%@ % All 16 tests passed
%@ true.
