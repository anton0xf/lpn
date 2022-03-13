palindrome([]).
palindrome(X) :- reverse(X, X).

%?- palindrome([a, b, a]).
%@ true.

%?- palindrome([a, b, c]).
%@ false.

:- begin_tests(palindrome).
test(rotator) :- palindrome([r, o, t, a, t, o, r]).
test(nursesrun) :- palindrome([n, u, r, s, e, s, r, u, n]).
test(nothis, [fail]) :- palindrome([n, o, t, h, i, s]).
:- end_tests(palindrome).

%?- run_tests.
%@ % PL-Unit: palindrome ... done
%@ % All 3 tests passed
%@ true.
