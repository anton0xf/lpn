% s := noun verb
% noun := i | you | he | she
% verb := do | see | listen

s(L, R) :- noun(L, R1), verb(R1, R).

noun([i | R], R).
noun([you | R], R).
noun([he | R], R).
noun([she | R], R).

verb([do | R], R).
verb([see | R], R).
verb([listen | R], R).

%?- s(L, []).
%@ L = [i, do] ;
%@ L = [i, see] ;
%@ L = [i, listen] ;
%@ L = [you, do] ;
%@ L = [you, see] ;
%@ L = [you, listen] ;
%@ L = [he, do] ;
%@ L = [he, see] ;
%@ L = [he, listen] ;
%@ L = [she, do] ;
%@ L = [she, see] ;
%@ L = [she, listen].
