
-module(math_functions).
-export([even/1, odd/1, filter/2]).

even(X) when X rem 2 =:= 1 -> false;
even(X) when is_integer(X) -> true.

odd(X) when is_integer(X) ->
  not even(X).

filter(F,L) ->
  [X || X <- L, F(X) =:= true].
