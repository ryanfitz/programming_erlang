
-module(lib_misc).
-export([odds_and_evens1/1, odds_and_evens2/1, my_tuple_to_list/1]).

odds_and_evens1(L) ->
  Odds  = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.

odds_and_evens2(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H|Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H|Evens])
  end;

odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.

my_tuple_to_list(T) ->
  my_tupple_to_list_acc(T, size(T), []).

my_tupple_to_list_acc(_, 0, Acc) -> Acc;
my_tupple_to_list_acc(T, N, Acc) ->
  my_tupple_to_list_acc(T, N-1, [element(N, T) | Acc]).
