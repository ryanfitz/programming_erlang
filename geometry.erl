%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(geometry).
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side})             -> Side * Side;
area({circle, Radius})           -> math:pi() * math:pow(Radius, 2);
area({triangle, A, B})           -> A * B * 0.5.

perimeter({square, Width})            -> perimeter({rectangle, Width, Width});
perimeter({rectangle, Width, Height}) -> 2 * Width + 2 * Height;
perimeter({circle, Diameter})         -> math:pi() * Diameter;
perimeter({triangle, A, B, C})        -> A + B + C.
