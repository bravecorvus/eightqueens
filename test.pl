bootstrap(N,Sol) :-
    once(bootstrap(N,[],0,Sol)).

bootstrap(N,_,I,S) :-
    once((generateSolution([],N,R),length(R,K),K > I)),
    !,
    bootstrap(N,R,K,S).
bootstrap(_,S,_,S).

generateSolution(R,_,R).
generateSolution([],N,R) :-
    for(X,1,N),
    for(Y,1,N),
    generateSolution([(X,Y)],N,R).
generateSolution([(XL,YL)|T],N,R) :-
    YL1 is YL+1,
    for(Y,YL1,N),
    \+ is_attacked(XL,Y,[(XL,YL)|T]),
    generateSolution([(XL,Y),(XL,YL)|T],N,R).
generateSolution([(XL,YL)|T],N,R) :-
    XL1 is XL+1,
    for(X,XL1,N),
    for(Y,1,N),
    \+ is_attacked(X,Y,[(XL,YL)|T]),
    generateSolution([(X,Y),(XL,YL)|T],N,R).

is_attacked(X,Y,PlacedKnights) :-
    member((NX,NY),PlacedKnights),
    is_attacked(X,Y,NX,NY).

is_attacked(XA,YA,XB,YB) :-
    DX is abs(XA-XB),
    DY is abs(YA-YB),
    is_attacked(DX,DY).

is_attacked(1,2).
is_attacked(2,1).


solution(1,[(1,1)]).
solution(2,[(2,2),(2,1),(1,2),(1,1)]).
solution(N,L) :-
    N > 2,
    solution([],N,1,1,L).

solution(L,N,I,_,L) :-
    I > N,
    !.
solution(L,N,I,J,S) :-
    JN is J+2,
    JN =< N,
    !,
    solution([(I,J)|L],N,I,JN,S).
solution(L,N,I,J,S) :-
    IN is I+1,
    JN is (I mod 2)+1,
    IN =< N,
    !,
    solution([(I,J)|L],N,IN,JN,S).
solution(L,N,I,J,[(I,J)|L]).