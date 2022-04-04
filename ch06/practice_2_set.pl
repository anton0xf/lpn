remove_all(_, [], []).
remove_all(X, [X | XS], YS) :- remove_all(X, XS, YS), !.
remove_all(X, [Y | XS], [Y | YS]) :- remove_all(X, XS, YS). % (X \= Y) can be removed here

%?- remove_all(1, [1, 2], YS).
%@ YS = [2].

:- begin_tests(remove_all).
test(from_empty) :- remove_all(_, [], []).
test(from_one) :- remove_all(1, [1], []).
test(none_of_two) :- remove_all(0, [1, 2], [1, 2]).
test(fist_of_two) :- remove_all(1, [1, 2], [2]).
test(second_of_two) :- remove_all(1, [2, 1], [2]).
test(all_of_two) :- remove_all(1, [1, 1], []).
test(none_of_three) :- remove_all(0, [1, 2, 3], [1, 2, 3]).
test(fist_of_three) :- remove_all(1, [1, 2, 3], [2, 3]).
test(second_of_three) :- remove_all(2, [1, 2, 3], [1, 3]).
test(third_of_three) :- remove_all(3, [1, 2, 3], [1, 2]).
test(two_of_three_1) :- remove_all(2, [1, 2, 2], [1]).
test(two_of_three_2) :- remove_all(1, [1, 2, 1], [2]).
test(two_of_three_3) :- remove_all(1, [1, 1, 3], [3]).
test(all_of_three) :- remove_all(1, [1, 1, 1], []).
:- end_tests(remove_all).

set([], []).
set([X | XS], [X | YS]) :- remove_all(X, XS, ZS), set(ZS, YS).

%?- set([2, 2, foo, 1, foo, [], []], X).
%@ X = [2, foo, 1, []].

:- begin_tests(set).
test(empty) :- set([], []).
test(one) :- set([X], [X]).
test(two_equal) :- set([X, X], [X]).
test(two_different) :- set([1, 2], [1, 2]).
test(three1) :- set([1, 1, 1], [1]).
test(three2_1) :- set([1, 2, 2], [1, 2]).
test(three2_2) :- set([1, 2, 1], [1, 2]).
test(three2_3) :- set([1, 1, 3], [1, 3]).
test(three3) :- set([1, 2, 3], [1, 2, 3]).
:- end_tests(set).

%?- run_tests.
%@ % PL-Unit: remove_all .............. done
%@ % PL-Unit: set ......... done
%@ % All 23 tests passed
%@ true.
