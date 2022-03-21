module MyFirstTest exposing (..)

import Expect
import Fuzz exposing (..)
import Main
import Test exposing (..)


suite =
    describe "My first tests"
        [ test "shrink text should work" testShrinkText
        , test "shrink text 2 should work" testShrinkText2
        , test "1 + 1 should be 2" test1Plus1
        , fuzz int "n + 0 should be n" testNPlusZero
        ]


testNPlusZero n =
    let
        result =
            n + 0

        ok =
            result == n
    in
    Expect.true "n+0" ok


testShrinkText _ =
    let
        result =
            Main.shrinkText 20 "This is a test"

        ok =
            result == "This is a test"
    in
    Expect.true "shrinked" ok


testShrinkText2 _ =
    let
        result =
            Main.shrinkText 5 "This is a test"

        ok =
            result == "This  ..."
    in
    Expect.true "shrinked" ok


test1Plus1 _ =
    let
        result =
            1 + 1

        ok =
            result == 2
    in
    Expect.true "1 + 1" ok
