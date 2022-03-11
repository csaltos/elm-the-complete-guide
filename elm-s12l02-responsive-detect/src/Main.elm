module Main exposing (..)

import Browser
import Browser.Events
import Element
import Html


main : Program Size Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Size =
    { w : Int
    , h : Int
    }


type alias Model =
    { windowSize : Size
    }


type Msg
    = MsgWindowSizeChanged Int Int


initModel : Size -> Model
initModel flags =
    { windowSize =
        { w = flags.w
        , h = flags.h
        }
    }


init : Size -> ( Model, Cmd.Cmd Msg )
init flags =
    ( initModel flags, Cmd.none )


view : Model -> Html.Html Msg
view model =
    Element.layout []
        (Element.text
            (String.fromInt model.windowSize.w
                ++ "x"
                ++ String.fromInt model.windowSize.h
            )
        )


update : Msg -> Model -> ( Model, Cmd.Cmd Msg )
update msg model =
    case msg of
        MsgWindowSizeChanged w h ->
            let
                newWindowSize =
                    { w = w
                    , h = h
                    }
            in
            ( { model | windowSize = newWindowSize }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize MsgWindowSizeChanged
