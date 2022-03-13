toptail([_, H | L], R) :- append(R, [_], [H | L]).

%?- toptail([a], T).
%@ false.

%?- toptail([a, b], T).
%@ T = [] ;
%@ false.

%?- toptail([a, b, c], T).
%@ T = [b] ;
%@ false.

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
