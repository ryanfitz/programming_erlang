
-module(math_functions).
-export([even/1, odd/1, filter/2, split/1, split2/1]).

even(X) when X rem 2 =:= 1 -> false;
even(X) when is_integer(X) -> true.

odd(X) when is_integer(X) ->
  not even(X).

filter(F,L) ->
  [X || X <- L, F(X) =:= true].

split(L) ->
  Odds = filter(fun odd/1, L),
  Evens = filter(fun even/1, L),
  {Evens, Odds}.


split2(L) -> split_acc(L, [], []).

split_acc([H|T], Evens, Odds) ->
  case even(H) of
    true -> split_acc(T, [H | Evens], Odds);
    false -> split_acc(T, Evens, [H | Odds])
  end;

split_acc([], Evens, Odds) ->
  {lists:reverse(Evens), lists:reverse(Odds)}.
