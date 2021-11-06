word(determiner, a).
word(determiner, every).
word(noun, criminal).
word(noun, 'big  kahuna  burger').
word(verb, eats).
word(verb, likes).

sentence(Word1, Word2, Word3, Word4, Word5)
:- word(determiner, Word1),
   word(noun, Word2),
   word(verb, Word3),
   word(determiner, Word4),
   word(noun, Word5).

%?- sentence(W1,  W2,  W3,  W4,  W5).
%@ W1 = W4, W4 = a,
%@ W2 = W5, W5 = criminal,
%@ W3 = eats ;

%@ W1 = W4, W4 = a,
%@ W2 = criminal,
%@ W3 = eats,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = a,
%@ W2 = W5, W5 = criminal,
%@ W3 = eats,
%@ W4 = every ;

%@ W1 = a,
%@ W2 = criminal,
%@ W3 = eats,
%@ W4 = every,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = W4, W4 = a,
%@ W2 = W5, W5 = criminal,
%@ W3 = likes ;

%@ W1 = W4, W4 = a,
%@ W2 = criminal,
%@ W3 = likes,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = a,
%@ W2 = W5, W5 = criminal,
%@ W3 = likes,
%@ W4 = every ;

%@ W1 = a,
%@ W2 = criminal,
%@ W3 = likes,
%@ W4 = every,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = W4, W4 = a,
%@ W2 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W5 = criminal ;

%@ W1 = W4, W4 = a,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = eats ;

%@ W1 = a,
%@ W2 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W4 = every,
%@ W5 = criminal ;

%@ W1 = a,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W4 = every ;

%@ W1 = W4, W4 = a,
%@ W2 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W5 = criminal ;

%@ W1 = W4, W4 = a,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = likes ;

%@ W1 = a,
%@ W2 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W4 = every,
%@ W5 = criminal ;

%@ W1 = a,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W4 = every ;

%@ W1 = every,
%@ W2 = W5, W5 = criminal,
%@ W3 = eats,
%@ W4 = a ;

%@ W1 = every,
%@ W2 = criminal,
%@ W3 = eats,
%@ W4 = a,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = W4, W4 = every,
%@ W2 = W5, W5 = criminal,
%@ W3 = eats ;

%@ W1 = W4, W4 = every,
%@ W2 = criminal,
%@ W3 = eats,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = every,
%@ W2 = W5, W5 = criminal,
%@ W3 = likes,
%@ W4 = a ;

%@ W1 = every,
%@ W2 = criminal,
%@ W3 = likes,
%@ W4 = a,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = W4, W4 = every,
%@ W2 = W5, W5 = criminal,
%@ W3 = likes ;

%@ W1 = W4, W4 = every,
%@ W2 = criminal,
%@ W3 = likes,
%@ W5 = 'big  kahuna  burger' ;

%@ W1 = every,
%@ W2 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W4 = a,
%@ W5 = criminal ;

%@ W1 = every,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W4 = a ;

%@ W1 = W4, W4 = every,
%@ W2 = 'big  kahuna  burger',
%@ W3 = eats,
%@ W5 = criminal ;

%@ W1 = W4, W4 = every,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = eats ;

%@ W1 = every,
%@ W2 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W4 = a,
%@ W5 = criminal ;

%@ W1 = every,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W4 = a ;

%@ W1 = W4, W4 = every,
%@ W2 = 'big  kahuna  burger',
%@ W3 = likes,
%@ W5 = criminal ;

%@ W1 = W4, W4 = every,
%@ W2 = W5, W5 = 'big  kahuna  burger',
%@ W3 = likes.
