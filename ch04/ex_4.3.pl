second(X, [_, X | _]).

%?- second(1, []).
%@ false.

%?- second(1, [1]).
%@ false.

%?- second(1, [1, 2]).
%@ false.

%?- second(2, [1, 2]).
%@ true.

%?- second(2, [1, 2, 3]).
%@ true.

%?- second(3, [1, 2, 3]).
%@ false.
