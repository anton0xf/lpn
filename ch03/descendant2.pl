descend(X, Y) :- child(X, Z), descend(Z, Y).
descend(X, Y) :- child(X, Y).

child(anne, bridget).
child(bridget, caroline).
child(caroline, donna).
child(donna, emily).

%?- descend(anne, donna).
%@ true ;
%@ false.

%?- descend(X, Y).
%@ X = anne,
%@ Y = emily ;
%@ X = anne,
%@ Y = donna ;
%@ X = anne,
%@ Y = caroline ;
%@ X = bridget,
%@ Y = emily ;
%@ X = bridget,
%@ Y = donna ;
%@ X = caroline,
%@ Y = emily ;
%@ X = anne,
%@ Y = bridget ;
%@ X = bridget,
%@ Y = caroline ;
%@ X = caroline,
%@ Y = donna ;
%@ X = donna,
%@ Y = emily.
