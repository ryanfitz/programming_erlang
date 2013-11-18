
-module(chap_ten).
-export([start/2, loop/1]).

start(AnAtom, Fun) ->
  case whereis(AnAtom) of
    undefined ->
      register(AnAtom, spawn(?MODULE, loop, [Fun]));
    Pid ->
      {error, AnAtom, Pid}
  end.

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop(Fun) ->
  receive
    Any -> 
      io:format("Received:~p~n",[Any]),
      Fun(),
      loop(Fun)
  end.
