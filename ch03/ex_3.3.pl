direct_train(saarbruecken, dudweiler).
direct_train(forbach, saarbruecken).
direct_train(freyming, forbach).
direct_train(stAvold, freyming).
direct_train(fahlquemont, stAvold).
direct_train(metz, fahlquemont).
direct_train(nancy, metz).

travel_from_to(X, Y) :- direct_train(X, Y).
travel_from_to(X, Y) :- direct_train(X, Z), travel_from_to(Z, Y).

%?- travel_from_to(nancy, saarbruecken).
%@ true ;
%@ false.

%?- travel_from_to(fahlquemont, nancy).
%@ false.
