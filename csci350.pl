sum-up-numbers-simple([], 0).
sum-up-numbers-simple([X|Y], N):- 
     (number(X), sum-up-numbers-simple(Y, A), N is X + A);
     (\+ number(X), sum-up-numbers-simple(Y, N)).

sum-up-numbers-general([], 0).
sum-up-numbers-general([X|Y], N) :- 
     (number(X), sum-up-numbers-general(Y, A), N is X + A); 
     (is_list(X), sum-up-numbers-general(Y, A), sum-up-numbers-general(X, V), N is A + V);
     ((\+ number(X), \+ is_list(X)), sum-up-numbers-general(Y, N)).

minimum(X,Y,X):- number(X), number(Y), X < Y.
minimum(X,Y,Y):- number(X), number(Y), Y < X.
minimum(X,Y,Y):- \+number(X).
minimum(X,Y,X):- \+number(Y).

min-list([X], X):- number(X).
min-list([X,Y|Z], Min):-
     minimum(X,Y,X), 
     min-list([X|Z], Min).

min-list([X,Y|Z], Min):-
     minimum(X,Y,Y),
     min-list([Y|Z], Min). 

min-above-min(L1, [], N):-
     (\+length(L1, 0), min-list(L1, Min)),
     N is Min. 
     
min-above-min(L1, L2, N):-
     min-list(L2, Min),
     include(greater(Min), L1, MinsAbove),
     min-list(MinsAbove, X),
     N is X.
     
unwrap-list([], []) :- !.
unwrap-list([X|Y], UnwrappedList) :-
    !,
    unwrap-list(X, NewX),
    unwrap-list(Y, NewY),
    append(NewX, NewY, UnwrappedList).
unwrap-list(L, [L]).

is-unique([]).
is-unique([X|Y]):-
\+member(X,Y),
     is-unique(Y).

common-unique-elements(L1, L2, N):-
    unwrap-list(L1, L3),
    unwrap-list(L2, L4),
    common-unique-elements1(L3, L4, N1),
    unique(N1, N).

common-unique-elements1([], _, []).
common-unique-elements1([A|B], L2, N):-
    member(A, L2),
    common-unique-elements(B, L2, N2),
    append([A], N2, N);
    \+(member(A, L2)),
    common-unique-elements(B, L2, N).

