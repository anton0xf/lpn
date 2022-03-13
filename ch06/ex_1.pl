doubled([]).
doubled(L) :- append(D, D, L).

% try to fix warnings:

%% doubled([]).
%% doubled(L) :- proper_length(L, N), mod(N, 2) =:= 0, split_at(L, N // 2, D, DR), reverse(D, DR).

%% split_at([], 0, [], []).
%% split_at(L, 0, _, L).
%% split_at([H | L], I, A, B) :- I > 0, I2 is I - 1, split_at(L, I2, [H | A], B).

% test

%?- trace.
%@ true.

%?- doubled([a, b, a, b]).
%@ true ;
%@ false.

:- begin_tests(doubled).
test(abc) :- doubled([a, b, c, a, b, c]).
test(foo) :- doubled([foo, gubble, foo, gubble]).
test(neg, [fail]) :- doubled([foo, gubble, foo]).
:- end_tests(doubled).

%?- run_tests.
%@ % PL-Unit: doubled
%@ Warning: /tmp/ediprolog6tsCmn:21:
%@ 	PL-Unit: Test abc: Test succeeded with choicepoint
%@ Warning: /tmp/ediprolog6tsCmn:22:
%@ 	PL-Unit: Test foo: Test succeeded with choicepoint
%@ . done
%@ % All 3 tests passed
%@ true.
