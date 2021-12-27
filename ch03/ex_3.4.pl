?- [numeral].

greater_than(succ(X), X).
greater_than(succ(X), Y) :- greater_than(X, Y).

%?- greater_than(succ(succ(succ(0))), succ(0)).
%@ true ;
%@ false.

%?- greater_than(succ(succ(0)), succ(succ(succ(0)))).
%@ false.
