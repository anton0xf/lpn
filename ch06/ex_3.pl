%% toptail([_, H | L], R) :- append(R, [_], [H | L]).

toptail([_, H | L], R) :- reverse([H | L], [_ | R]).

%?- toptail([a], T).
%@ false.

%?- toptail([a, b], T).
%@ T = [].

%?- toptail([a, b, c], T).
%@ T = [b].

:- begin_tests(toptail).
test(empty, [fail]) :- toptail([], _).
test(one, [fail]) :- toptail([a], _).
test(two) :- toptail([a, b], []).
test(three) :- toptail([a, b, c], [b]).
:- end_tests(toptail).

%?- run_tests.
%@ % PL-Unit: toptail .... done
%@ % All 4 tests passed
%@ true.
