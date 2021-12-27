directly_in(olga, katarina).
directly_in(natasha, olga).
directly_in(irina, natasha).

in(X, Y) :- directly_in(X, Y).
in(X, Y) :- directly_in(X, Z), in(Z, Y).

%?- in(natasha, katarina).
%@ true ;
%@ false.

%?- in(katarina, olga).
%@ false.

%?- in(X, Y).
%@ X = olga, %@ Y = katarina ;
%@ X = natasha, %@ Y = olga ;
%@ X = irina, %@ Y = natasha ;
%@ X = natasha, %@ Y = katarina ;
%@ X = irina, %@ Y = olga ;
%@ X = irina, %@ Y = katarina ;
%@ false.
