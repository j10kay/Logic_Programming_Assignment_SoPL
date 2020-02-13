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
