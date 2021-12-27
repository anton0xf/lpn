% from Practical section

connected(1, 2).
connected(3, 4).
connected(5, 6).
connected(7, 8).
connected(9, 10).
connected(12, 13).
connected(13, 14).
connected(15, 16).
connected(17, 18).
connected(19, 20).
connected(4, 1).
connected(6, 3).
connected(4, 7).
connected(6, 11).
connected(14, 9).
connected(11, 15).
connected(16, 12).
connected(14, 17).
connected(16, 19).

%% use following commands to generate .dot and .png files
% $ swipl -s maze.pl -g 'format("graph {~n").' \
%      -g 'forall(connected(X,Y), format("  ~d -> ~d~n", [X, Y])).' \
%      -g 'format("}~n").' -t halt > maze.dot
%
% $ dot maze.dot -Tpng -o maze.png

path(X, Y) :- connected(X, Y).
path(X, Y) :- connected(X, Z), path(Z, Y).

%?- path(5, 10).
%@ true .

%?- path(1, X).
%@ X = 2 ;
%@ false.

%?- path(13, X).
%@ X = 14 ;
%@ X = 9 ;
%@ X = 17 ;
%@ X = 10 ;
%@ X = 18 ;
%@ false.

get_path(X, Y, [X, Y]) :- connected(X, Y).
get_path(X, Y, [X | Path]) :- connected(X, Z), get_path(Z, Y, Path).

%?- get_path(5, 10, P), write(P).
%@ [5,6,11,15,16,12,13,14,9,10]
%@ P = [5, 6, 11, 15, 16, 12, 13, 14, 9|...] ;
%@ false.
