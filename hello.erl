
-module(hello).
-export([start/0, hello/1]).

start() ->
  hello("World").

hello(Name) ->
  io:fwrite("Hello ~s ~n", [Name]).
