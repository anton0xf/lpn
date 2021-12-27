% from Practical section

by_car(auckland, hamilton).
by_car(hamilton, raglan).
by_car(valmont, saarbruecken).
by_car(valmont, metz).

by_train(metz, frankfurt).
by_train(saarbruecken, frankfurt).
by_train(metz, paris).
by_train(saarbruecken, paris).

by_plane(frankfurt, bangkok).
by_plane(frankfurt, singapore).
by_plane(paris, losAngeles).
by_plane(bangkok, auckland).
by_plane(singapore, auckland).
by_plane(losAngeles, auckland).

print_dot
:- write('digraph {\n\n'),
   forall(by_car(X, Y), format('  ~w -> ~w [label="car"]~n', [X, Y])), nl,
   forall(by_train(X, Y), format('  ~w -> ~w [label="train"]~n', [X, Y])), nl,
   forall(by_plane(X, Y), format('  ~w -> ~w [label="plane"]~n', [X, Y])), nl,   
   write('}\n').

%?- open('travel.dot', write, Out), with_output_to(Out, print_dot), close(Out).
%@ Out = <stream>(0x56044668ad20).

% To generate travel.png run
% $ dot travel.dot -Tpng -o travel.png

by_any(X, Y) :- by_car(X, Y); by_train(X, Y); by_plane(X, Y).
travel(X, Y) :- by_any(X, Y).
travel(X, Y) :- by_any(X, Z), travel(Z, Y).

%?- travel(valmont, raglan).
%@ true .

%?- travel(frankfurt, losAngeles).
%@ false.

travel_go(X, Y, go(X, Y)) :- by_any(X, Y).
travel_go(X, Y, go(X, Z, Path)) :- by_any(X, Z), travel_go(Z, Y, Path).

%?- travel_go(valmont, raglan, Path).
%@ Path = go(valmont, saarbruecken, go(saarbruecken, frankfurt, go(frankfurt, bangkok, go(bangkok, auckland, go(auckland, hamilton, go(hamilton, raglan)))))) .

by_any(X, Y, car) :- by_car(X, Y).
by_any(X, Y, train) :- by_train(X, Y).
by_any(X, Y, plane) :- by_plane(X, Y).

travel(X, Y, [X, by(Type), Y]) :- by_any(X, Y, Type).
travel(X, Y, [X, by(Type) | Path]) :- by_any(X, Z, Type), travel(Z, Y, Path).

%?- forall(travel(valmont, raglan, Path), (write(Path), nl)).
%@ [valmont,by(car),saarbruecken,by(train),frankfurt,by(plane),bangkok,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ [valmont,by(car),saarbruecken,by(train),frankfurt,by(plane),singapore,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ [valmont,by(car),saarbruecken,by(train),paris,by(plane),losAngeles,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ [valmont,by(car),metz,by(train),frankfurt,by(plane),bangkok,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ [valmont,by(car),metz,by(train),frankfurt,by(plane),singapore,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ [valmont,by(car),metz,by(train),paris,by(plane),losAngeles,by(plane),auckland,by(car),
%   hamilton,by(car),raglan]
%@ true.
