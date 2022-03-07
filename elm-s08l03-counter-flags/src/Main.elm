module Main exposing (..)

import Browser
import Html
import Html.Events exposing (onClick)


main : Program Int Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { title : String
    , counter : Int
    }

type Msg =
    MsgIncreaseCounter

initModel : Int -> Model
initModel counter =
    { title = "My Title"
    , counter = counter
    }


init : Int -> ( Model, Cmd msg )
init counter =
    ( initModel counter, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title =
        model.title
    , body =
        [ Html.button [ onClick MsgIncreaseCounter ]
            [ Html.text ("Counter "
                ++ String.fromInt model.counter)
            ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgIncreaseCounter ->
            let
                newCounter = model.counter + 1
                newTitle = "My Title " ++ String.fromInt newCounter
                newModel = { model | counter = newCounter, title = newTitle }
            in
            ( newModel, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
