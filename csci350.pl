sum-up-numbers-simple([], 0).
sum-up-numbers-simple([X|Y], N):- 
     (number(X), sum-up-numbers-simple(Y, A), N is X + A);
     (\+ number(X), sum-up-numbers-simple(Y, N)).

sum-up-numbers-general([], 0).
sum-up-numbers-general([X|Y], N) :- 
     (number(X), sum-up-numbers-general(Y, A), N is X + A); 
     (is_list(X), sum-up-numbers-general(Y, A), sum-up-numbers-general(X, V), N is A + V);
     ((\+ number(X), \+ is_list(X)), sum-up-numbers-general(Y, N)).
