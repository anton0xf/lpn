my_append([], L, L).
my_append([X | XS], YS, [X | ZS]) :- my_append(XS, YS, ZS).

%?- my_append([1, 2], [3, 4, 5], R).
%@ R = [1, 2, 3, 4, 5].

%?- my_append(XS, [2], [1, 2]).
%@ XS = [1] ;
%@ false.

%?- my_append([1, 2], YS, [1, 2, 3, 4, 5]).
%@ YS = [3, 4, 5].

%?- length(XS, 3), my_append(XS, YS, [1, 2, 3, 4, 5]).
%@ XS = [1, 2, 3],
%@ YS = [4, 5].

%?- my_append(XS, YS, [1, 2, 3]).
%@ XS = [],
%@ YS = [1, 2, 3] ;
%@ XS = [1],
%@ YS = [2, 3] ;
%@ XS = [1, 2],
%@ YS = [3] ;
%@ XS = [1, 2, 3],
%@ YS = [] ;
%@ false.

:- begin_tests(my_append).
test(empty) :- my_append([], [], []).
test(empty_neg, [fail]) :- my_append([], [], [1]).
test(empty_to) :- my_append([], [1, 2], [1, 2]).
test(one_to) :- my_append([1], [2, 3], [1, 2, 3]).
test(two_to) :- my_append([1, 2], [3, 4, 5], [1, 2, 3, 4, 5]).
test(tree_to) :- my_append([1, 2, 3], [4, 5], [1, 2, 3, 4, 5]).
test(three_to_empty) :- my_append([1, 2, 3], [], [1, 2, 3]).
:- end_tests(my_append).

prefix(P, L) :- my_append(P, _, L).

%?- prefix(P, [1, 2, 3]).
%@ P = [] ;
%@ P = [1] ;
%@ P = [1, 2] ;
%@ P = [1, 2, 3] ;
%@ false.


%% suffix(S, L) :- my_append(_, S, L).

suffix([], _).
suffix([X | XS], L) :- my_append(_, [X | XS], L).

%?- suffix([], [a, b, c]).
%@ true.

%?- suffix([b], [a, b]).
%@ true ;
%@ false.

%?- suffix(S, [a, b, c]).
%@ S = [] ;
%@ S = [a, b, c] ;
%@ S = [b, c] ;
%@ S = [c] ;
%@ false.

sublist(S, L) :- prefix(P, L), suffix(S, P).

%?- sublist(XS, [1, 2, 3]).
%@ XS = [] ;
%@ XS = [] ;
%@ XS = [1] ;
%@ XS = [] ;
%@ XS = [1, 2] ;
%@ XS = [2] ;
%@ XS = [] ;
%@ XS = [1, 2, 3] ;
%@ XS = [2, 3] ;
%@ XS = [3] ;
%@ false.

:- begin_tests(derivatives).
test(prefix_0) :- prefix([], [1, 2, 3]).
test(prefix_00) :- prefix([], []).
test(prefix_1) :- prefix([1], [1, 2, 3]).
test(prefix_2) :- prefix([1, 2], [1, 2, 3]).
test(prefix_3) :- prefix([1, 2, 3], [1, 2, 3]).
test(prefix_not, [fail]) :- prefix([3], [1, 2, 3]).

test(suffix_0) :- suffix([], [1, 2, 3]).
test(suffix_00) :- suffix([], []).
test(suffix_1) :- once(suffix([3], [1, 2, 3])).
test(suffix_2) :- once(suffix([2, 3], [1, 2, 3])).
test(suffix_3) :- once(suffix([1, 2, 3], [1, 2, 3])).
test(suffix_not, [fail]) :- suffix([1], [1, 2, 3]).
:- end_tests(derivatives).

%?- run_tests.
%@ % PL-Unit: my_append ....... done
%@ % PL-Unit: derivatives ............ done
%@ % All 19 tests passed
%@ true.
