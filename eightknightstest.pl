%:- use_module(library(lists), [member/2]).
:- use_module(contestlib, [for/3]).

knights(N,Max) :-
	PlacedKnights = [],
	findall((X,Y),(for(X,1,N),for(Y,1,N)),Squares),
	knights(Squares,PlacedKnights,Max).

knights([],PlacedKnights,Max) :-
	length(PlacedKnights,Max).
knights([(X,Y)|Squares],PlacedKnights,Max) :-
	( is_attacked(X,Y,PlacedKnights) ->
	knights(Squares,PlacedKnights,Max)
	;
	knights(Squares,[knight(X,Y)|PlacedKnights],Max1),
	knights(Squares,PlacedKnights,Max2),
	Max is max(Max1,Max2)
	).

is_attacked(X,Y,PlacedKnights) :-
	( NX is X - 1, NY is Y - 2
	; NX is X - 1, NY is Y + 2
	; NX is X + 1, NY is Y - 2
	; NX is X + 1, NY is Y + 2
	; NX is X - 2, NY is Y - 1
	; NX is X - 2, NY is Y + 1
	; NX is X + 2, NY is Y - 1
	; NX is X + 2, NY is Y + 1
	),
	member(knight(NX,NY),PlacedKnights).


main :-
    open('knights.out',write,ID),
    (   ( knights(8, X), write(ID,X), nl(ID), fail )
       ; close(ID)
    ).