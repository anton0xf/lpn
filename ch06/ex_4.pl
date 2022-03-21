% 1. Define last/2 using the predicate rev/2 discussed in the text.
%% last(L, X) :- reverse(L, [X | _]).
    
% 2. Define last/2 using recursion.
last([X], X) :- !.
last([_, H | L], X) :- last([H | L], X).

%?- last([], _).
%@ false.

%?- last([a], _).
%@ true.

:- begin_tests(last).
test(empty, [fail]) :- last([], _).
test(one) :- last([a], a).
test(two) :- last([a, b], b).
test(three) :- last([a, b, c], c).
:- end_tests(last).

%?- run_tests.
%@ % PL-Unit: last .... done
%@ % All 4 tests passed
%@ true.
