
-module(ring).
-compile(export_all).

start(N) ->
  [spawn(?MODULE, loop, [X]) || X <- lists:seq(0, N)].

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

msg([], _Any) -> void;

msg([H|T], Any) ->
  H ! Any,
  msg(T, Any).

broadcast(_Pids, 0, _Msg) ->
  io:format("Done broadcasting:~n");

broadcast(Pids, N, Msg) ->
  msg(Pids, Msg),
  broadcast(Pids, N-1, Msg).

loop(X) ->
  receive
    Any ->
      io:format("Received:~p on process:~p~n",[Any, self()]),
      loop(X)
  end.
