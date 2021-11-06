happy(yolanda).
listens2Music(mia).
listens2Music(yolanda) :- happy(yolanda).
playsAirGuitar(mia) :- listens2Music(mia).
playsAirGuitar(yolanda) :- listens2Music(yolanda).

%?- happy(X).
%@    X = yolanda.

%?- listens2Music(X).
%@    X = mia
%@ ;  X = yolanda.

%?- playsAirGuitar(X).
%@    X = mia
%@ ;  X = yolanda.
