sum-up-numbers-simple([], 0).
sum-up-numbers-simple([X|Y], N):- 
     (number(X), sum-up-numbers-simple(Y, A), N is X + A);
     (\+ number(X), sum-up-numbers-simple(Y, N)).
