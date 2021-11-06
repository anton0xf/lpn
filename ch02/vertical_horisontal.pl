vertical(line(point(X, _), point(X, _))).
horizontal(line(point(_, Y), point(_, Y))).

%?- vertical(line(point(1,1),point(1,3))).
%@ true.

%?- vertical(line(point(1,1),point(3,2))).
%@ false.

%?- horizontal(line(point(1,1),point(2,Y))).
%@ Y = 1.

%?- horizontal(line(point(2,3),P)).
%@ P = point(_114, 3).
