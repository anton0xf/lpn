twice([], []).
twice([X | T], [X, X | TT]) :- twice(T, TT).

%?- twice([a, 4, buggle], X).
%@ X = [a, a, 4, 4, buggle, buggle].

%?- twice([1, 2, 1, 1], X).
%@ X = [1, 1, 2, 2, 1, 1, 1, 1].
