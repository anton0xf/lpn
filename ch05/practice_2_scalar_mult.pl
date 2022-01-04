%% scalar_mult(_, [], []).
%% scalar_mult(K, [X | XS], [Y | YS]) :- Y is K * X, scalar_mult(K, XS, YS).

% ^Fails with "Test succeeded with choicepoint".
% Can be "fixed" by adding once/1 to test

iter([], _, []).
iter([X | XS], K, [Y | YS]) :- Y is K * X, iter(XS, K, YS).
scalar_mult(K, XS, YS) :- iter(XS, K, YS).

%?- scalar_mult(3, [2, 7, 4], R).
%@ R = [6, 21, 12].

:- begin_tests(scalar_mult).
test(scalar_mult3) :- scalar_mult(3, [2, 7, 4], [6,21,12]).
:- end_tests(scalar_mult).

%?- run_tests.
%@ % PL-Unit: scalar_mult . done
%@ % test passed
%@ true.
