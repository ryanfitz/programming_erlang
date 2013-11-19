
-module(ring).
-compile(export_all).

benchmark(N, M) ->
    Max = erlang:system_info(process_limit),
    io:format("Maximum allowed processes:~p~n",[Max]),
    statistics(runtime),
    statistics(wall_clock),
    Pids = start(N),
    broadcast(Pids, M, foobar),
    %lib_misc:flush_buffer(),
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000 / N,
    U2 = Time2 * 1000 / N,
    io:format("Process spawn time=~p (~p) microseconds~n",
        [U1, U2]).

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
  H ! {self(), Any},
  msg(T, Any).

broadcast(_Pids, 0, _Msg) ->
  io:format("Done broadcasting~n");

broadcast(Pids, N, Msg) ->
  msg(Pids, Msg),
  broadcast(Pids, N-1, Msg).

loop(X) ->
  receive
    {From, _Any} ->
      %io:format("Received:~p on process:~p~n",[Any, self()]),
      From ! {self(), die},
      loop(X)
  end.
