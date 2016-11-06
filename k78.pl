solution([]).
solution([X/Y|Others]) :-
    solution(Others),
    member(Y, [7, 8]),
    noattack(X/Y, Others).


noattack(_,[]).
noattack(X/Y, [X1/Y1|Others]):-
    Y1 - Y =\= 2, X1 - X =\= 1, %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 2, X1 - X =\= 1, %   8 |    |    |    |    |    |    |    |    |
    Y1 - Y =\= 2, X - X1 =\= 1, %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 2, X - X1 =\= 1, %   7 |    |    |  @ |    |  @ |    |    |    |
    Y1 - Y =\= 1, X1 - X =\= 2, %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 1, X1 - X =\= 2, %   6 |    |  @ |    |    |    |  @ |    |    |
    Y1 - Y =\= 1, X - X1 =\= 2, %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 1, X - X1 =\= 2, %   5 |    |    |    | *S |    |    |    |    |
                                %   +----+----+----+----+----+----+----+----+
                                %   4 |    |  @ |    |    |    |  @ |    |    |
                                %   +----+----+----+----+----+----+----+----+
                                %   3 |    |    |  @ |    |  @ |    |    |    |
                                %   +----+----+----+----+----+----+----+----+
                                %   2 |    |    |    |    |    |    |    |    |
                                %   +----+----+----+----+----+----+----+----+
                                %   1 |    |    |    |    |    |    |    |    |
                                %   +----+----+----+----+----+----+----+----+
                                %      a    b    c    d    e    f    g    h



    Y1 - Y =\= 2, X1 =\= X; %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 2, X1 =\= X; %   8 |    |    |    |    |    |    |    |    |
    X1 - X =\= 2, Y1 =\= Y; %     +----+----+----+----+----+----+----+----+
    X - X1 =\= 2, Y1 =\= Y; %   7 |    |    |    |  @ |   |    |    |    |
                            %   +----+----+----+----+----+----+----+----+
                            %   6 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   5 |    |  @ |    | *S |    |  @ |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   4 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   3 |    |    |    |  @ |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   2 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   1 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %
                            %       a    b    c    d    e    f    g    h



    Y1 - Y =\= 1, X1 =\= X; %     +----+----+----+----+----+----+----+----+
    Y - Y1 =\= 1, X1 =\= X; %   8 |    |    |    |    |    |    |    |    |
    X1 - X =\= 1, Y1 =\= Y; %     +----+----+----+----+----+----+----+----+
    X - X1 =\= 1, Y1 =\= Y, %   7 |    |    |    |    |   |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   6 |    |    |    |  @ |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   5 |    |    |  @ | *S |  @ |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   4 |    |    |    |  @ |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   3 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   2 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   1 |    |    |    |    |    |    |    |    |
                            %     +----+----+----+----+----+----+----+----+
                            %   
                            %        a    b    c    d    e    f    g    h    
    noattack(X/Y, Others).

template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).

main :-
    open('knights.out',write,ID),
    (   ( template(X), solution(X), write(ID,X), nl(ID), fail )
       ; close(ID)
    ).
