hasWand(harry).
quidditchPlayer(harry).
wizard(ron).
wizard(X) :- hasBroom(X), hasWand(X).
hasBroom(X) :- quidditchPlayer(X).

%?- wizard(ron).
%@ true ;
%@ false.

%?- witch(ron).
%@ ERROR: Undefined procedure: witch/1 (DWIM could not correct goal)

%?- wizard(hermione).
%@ false.

%?- witch(hermione).
%@ ERROR: Undefined procedure: witch/1 (DWIM could not correct goal)

%?- wizard(harry).
%@ true.

%?- wizard(Y).
%@ Y = ron ;
%@ Y = harry.

%?- witch(Y).
%@ ERROR: Undefined procedure: witch/1 (DWIM could not correct goal)

