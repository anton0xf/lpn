% see https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)
:- begin_tests(lists).
:- ensure_loaded(vertical_horisontal).


test(vertical_yes)
:- vertical(line(point(1,1),point(1,3))).

test(vertical_no, fail)
:- vertical(line(point(1,1),point(3,2))).

:- end_tests(lists).

%?- run_tests.
%@ % PL-Unit: lists .. done
%@ % All 2 tests passed
%@ true.

