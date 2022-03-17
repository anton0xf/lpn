% 1. Define last/2 using the predicate rev/2 discussed in the text.
%% last(L, X) :- reverse(L, [X | _]).
    
% 2. Define last/2 using recursion.
last([X], X).
last([_, H | L], X) :- last([H | L], X).

%?- last([], _).
%@ false.

%?- last([a], _).
%@ true ;
%@ false.

:- begin_tests(last).
test(empty, [fail]) :- last([], _).
test(one) :- last([a], a).
test(two) :- last([a, b], b).
test(three) :- last([a, b, c], c).
:- end_tests(last).

%?- run_tests.
%@ % PL-Unit: last .
%@ Warning: /tmp/ediprologilClRF:16:
%@ 	PL-Unit: Test one: Test succeeded with choicepoint
%@ Warning: /tmp/ediprologilClRF:17:
%@ 	PL-Unit: Test two: Test succeeded with choicepoint
%@ Warning: /tmp/ediprologilClRF:18:
%@ 	PL-Unit: Test three: Test succeeded with choicepoint
%@  done
%@ % All 4 tests passed
%@ true.
