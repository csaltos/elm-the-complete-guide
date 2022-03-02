module Main exposing (..)
import Html
import Browser


main =
    Browser.sandbox
        { init = "Welcome"
        , view = view
        , update = update
        }


view data =
    Html.text data

update msg data =
    "Testing"
