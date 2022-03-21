%% swapfl([X | XS], [Y | YS]) :- append(Mid, [Y], XS),
%%                               append(Mid, [X], YS).

swapfl([X | XS], [Y | YS]) :- swapfl(X, Y, XS, YS).
swapfl(X, Y, [Y], [X]) :- !. % <- cut
swapfl(X, Y, [H | XS], [H | YS]) :- swapfl(X, Y, XS, YS).

% (unsuccessful) attempt to remove choicepoint
%% swapfl([X | XS], [Y | YS]) :- swapfl(XS, YS, X, Y).
%% swapfl([Y], [X], X, Y).
%% swapfl([H, X2 | XS], [H, Y2 | YS], X, Y) :- swapfl([X2 | XS], [Y2 | YS], X, Y).

%?- trace.
%@ true.

%?- swapfl([a, b], [b, a]).
%@ true.

:- begin_tests(swapfl).
test(empty_l, [fail]) :- swapfl([], _).
test(empty_r, [fail]) :- swapfl(_, []).
test(one_l, [fail]) :- swapfl([a], _).
test(one_r, [fail]) :- swapfl(_, [a]).
test(two_neg, [fail]) :- swapfl([a, b], [a, b]).
test(two) :- swapfl([a, b], [b, a]).
test(three_neg, [fail]) :- swapfl([a, b, c], [a, b, a]).
test(three) :- swapfl([a, b, c], [c, b, a]).
test(four) :- swapfl([a, b, c, d], [d, b, c, a]).
:- end_tests(swapfl).

%?- run_tests.
%@ % PL-Unit: swapfl ......... done
%@ % All 9 tests passed
%@ true.
