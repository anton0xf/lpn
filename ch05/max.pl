%% max([], 0).
%% max([X | T], X) :- max(T, M), X >= M.
%% max([X | T], M) :- max(T, M), X < M.

max([], 0).
max([X | T], Y) :- max(T, M), (X >= M -> Y = X ; Y = M).

%?- max([1], X).
%@ X = 1.

%?- max([1, 2, 3, 1], X).
%@ X = 3.

%?- max([5, 1, 0, 1], X).
%@ X = 5.

:- begin_tests(max).
test(max_empty) :- max([], 0).
test(max_one) :- max([1], 1).
test(max_one_neg, [fail]) :- max([1], 0).
test(max_two) :- max([1, 2], 2).
test(max_two_rev) :- max([2, 1], 2).
test(max_two_neg, [fail]) :- max([1, 2], 1).
test(max_three1) :- max([1, 2, 3], 3).
test(max_three2) :- max([1, 3, 2], 3).
test(max_three3) :- max([3, 1, 2], 3).
test(max_three_neg, [fail]) :- max([1, 2, 3], 2).
:- end_tests(max).

acc_max([], A, A).
%% acc_max([H | T], A, Max) :- H > A, acc_max(T, H, Max).
%% acc_max([H | T], A, Max) :- H =< A, acc_max(T, A, Max).
acc_max([H | T], A, Max) :- H > A -> acc_max(T, H, Max); acc_max(T, A, Max).

:- begin_tests(acc_max).
test(acc_max0) :- acc_max([1, 0, 5, 4], 0, 5). 
test(acc_max1) :- acc_max([0, 5, 4], 1, 5).
test(acc_max_minus) :- acc_max([-11, -2, -7, -4, -12], 0, 0). 
test(acc_max_minus2) :- acc_max([-11, -2, -7, -4, -12], -11, -2). 
:- end_tests(acc_max).

max2(L, Max) :- acc_max(L, 0, Max).

:- begin_tests(max2).
test(max2_empty) :- max2([], 0).
test(max2_one) :- max2([1], 1).
test(max2_one_neg, [fail]) :- max2([1], 0).
test(max2_two) :- max2([1, 2], 2).
test(max2_two_rev) :- max2([2, 1], 2).
test(max2_two_neg, [fail]) :- max2([1, 2], 1).
test(max2_three1) :- max2([1, 2, 3], 3).
test(max2_three2) :- max2([1, 3, 2], 3).
test(max2_three3) :- max2([3, 1, 2], 3).
test(max2_three_neg, [fail]) :- max2([1, 2, 3], 2).
test(max2_minus) :- max2([-11, -2, -7, -4, -12], 0). % bad result
:- end_tests(max2).

max3([], 0).
max3([H | T], Max) :- acc_max([H | T], H, Max).

:- begin_tests(max3).
test(max3_empty) :- max3([], 0).
test(max3_one) :- max3([1], 1).
test(max3_one_neg, [fail]) :- max3([1], 0).
test(max3_two) :- max3([1, 2], 2).
test(max3_two_rev) :- max3([2, 1], 2).
test(max3_two_neg, [fail]) :- max3([1, 2], 1).
test(max3_three1) :- max3([1, 2, 3], 3).
test(max3_three2) :- max3([1, 3, 2], 3).
test(max3_three3) :- max3([3, 1, 2], 3).
test(max3_three_neg, [fail]) :- max3([1, 2, 3], 2).
test(max3_minus) :- max3([-11, -2, -7, -4, -12], -2).
:- end_tests(max3).

%?- run_tests.
%@ % PL-Unit: max .......... done
%@ % PL-Unit: max2 ........... done
%@ % PL-Unit: acc_max .... done
%@ % PL-Unit: max3 ........... done
%@ % All 36 tests passed
%@ true.
