addone([], []).
addone([X | XS], [Y | YS]) :- Y is X + 1, addone(XS, YS).

%?- addone([1, 2, 7, 2], X).
%@ X = [2, 3, 8, 3].

:- begin_tests(addone).
test(addone) :- addone([1, 2, 7, 2], [2, 3, 8, 3]).
:- end_tests(addone).

%?- run_tests.
%@ % PL-Unit: addone . done
%@ % test passed
%@ true.
