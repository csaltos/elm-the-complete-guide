module Main exposing (..)

import Browser
import Html
import Html.Events exposing (onClick)


main =
    Browser.sandbox
        { init = "Welcome"
        , view = view
        , update = update
        }


type Msg
    = MsgSuprise
    | MsgReset


view data =
    Html.div []
        [ Html.text data
        , Html.button [ onClick MsgSuprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        ]


update msg data =
    case msg of
        MsgSuprise ->
            "Happy Birthday !!"

        MsgReset ->
            ""
