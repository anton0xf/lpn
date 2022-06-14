% s := noun verb
% noun := i | you | he | she
% verb := do | see | listen

s --> noun, verb.

noun --> [i].
noun --> [you].
noun --> [he].
noun --> [she].

verb --> [do].
verb --> [see].
verb --> [listen].

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
