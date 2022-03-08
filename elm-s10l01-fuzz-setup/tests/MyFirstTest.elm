module MyFirstTest exposing (..)

import Test exposing(..)
import Expect

test1 =
    test "1 + 1 should be 2" test1Plus1

test1Plus1 _ =
    let
        result = 1 + 1
        ok = result == 2
    in
    Expect.true "1 + 1" ok
