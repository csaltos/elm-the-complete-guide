module Main exposing (..)

import Browser
import Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)


main =
    Browser.sandbox
        { init = {
            message = "Welcome",
            firstname = ""
        }
        , view = view
        , update = update
        }


type Msg
    = MsgSuprise
    | MsgReset
    | MsgNewName String

type alias Model =
    { message : String
    , firstname : String
    }

view model =
    Html.div []
        [ Html.text model.message
        , Html.input [ onInput MsgNewName, value model.firstname ] []
        , Html.button [ onClick MsgSuprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        ]


update msg model =
    case msg of
        MsgSuprise ->
            {
                message = "Happy Birthday " ++ model.firstname ++ " !!"
                , firstname = model.firstname
            }

        MsgReset ->
            {
                message = "Welcome"
                , firstname = ""
            }
        
        MsgNewName newName ->
            {
                message = model.message
                , firstname = newName
            }
