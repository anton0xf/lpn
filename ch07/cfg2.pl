s(X, Z):- np(X, Y), vp(Y, Z).

np(X, Z):- det(X, Y), n(Y, Z).

vp(X, Z):- v(X, Y), np(Y, Z).
vp(X, Z):- v(X, Z).

det([the | W], W).
det([a | W], W).

n([woman | W], W).
n([man | W], W).

v([shoots | W], W).

%?- s([a, woman, shoots, a, man], []).
%@ true.

%?- s(X, []).
%@ X = [the, woman, shoots, the, woman] ;
%@ X = [the, woman, shoots, the, man] ;
%@ X = [the, woman, shoots, a, woman] ;
%@ X = [the, woman, shoots, a, man] ;
%@ X = [the, woman, shoots] ;
%@ X = [the, man, shoots, the, woman] ;
%@ X = [the, man, shoots, the, man] ;
%@ X = [the, man, shoots, a, woman] ;
%@ X = [the, man, shoots, a, man] ;
%@ X = [the, man, shoots] ;
%@ X = [a, woman, shoots, the, woman] ;
%@ X = [a, woman, shoots, the, man] ;
%@ X = [a, woman, shoots, a, woman] ;
%@ X = [a, woman, shoots, a, man] ;
%@ X = [a, woman, shoots] ;
%@ X = [a, man, shoots, the, woman] ;
%@ X = [a, man, shoots, the, man] ;
%@ X = [a, man, shoots, a, woman] ;
%@ X = [a, man, shoots, a, man] ;
%@ X = [a, man, shoots].

%?- np([a, woman], []).
%@ true.
