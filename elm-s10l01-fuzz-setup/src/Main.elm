module Main exposing (..)
import Html

main : Html.Html msg
main = Html.text (shrinkText 120 "Hello Fuzz this is a longer string")

shrinkText max text =
    if String.length text <= max then
        text
    else
        let
            extra = String.length text - max
        in
            String.dropRight extra text ++ " ..."
