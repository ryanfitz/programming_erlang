
-module(fib).
-export([fib/1, fib_seq/1, fib_list/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) when fib > 1 -> fib(N-1) + fib(N-2).

fib_seq(N) -> fib_seq(N, []).

fib_seq(0, L) -> [0 | L];
fib_seq(N, L) ->
  fib_seq(N-1, [fib(N) | L]).

fib_list(N) -> fib_list(N, [0,1,1]).

fib_list(0, L) -> [0 | L];
fib_list(1, L) -> [0, 1 | L];
fib_list(N, L) ->
  [H1, H2 | _] = L,
  fib_list(N-1, [H1 + H2 | L]).
