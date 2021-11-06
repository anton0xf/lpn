loves(vincent, mia).
loves(marsellus, mia).
loves(pumpkin, honey_bunny).
loves(honey_bunny, pumpkin).

jealous(X, Y):- loves(X, Z),  loves(Y, Z).

%?- jealous(X, Y).
%@    X = vincent, Y = vincent
%@ ;  X = vincent, Y = marsellus
%@ ;  X = marsellus, Y = vincent
%@ ;  X = marsellus, Y = marsellus
%@ ;  X = pumpkin, Y = pumpkin
%@ ;  X = honey_bunny, Y = honey_bunny.

jealous2(X, Y):- loves(X, Z),  loves(Y, Z), X \== Y.
% X \= Y % also works

%?- jealous2(X, Y).
%@    X = vincent, Y = marsellus
%@ ;  X = marsellus, Y = vincent
%@ ;  false.
