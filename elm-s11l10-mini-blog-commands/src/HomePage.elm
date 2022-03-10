module HomePage exposing (..)

import Element
import Element.Font


type Msg
    = MsgDummy


type alias Model =
    { counter : Int
    }


initModel : Model
initModel =
    { counter = 0
    }


view : Model -> Element.Element msg
view model =
    Element.column [ Element.padding 20 ]
        [ Element.text ("My blog " ++ String.fromInt model.counter)
        , Element.paragraph
            [ Element.paddingXY 0 20
            , Element.Font.size 14
            ]
            [ Element.text "Welcome to my mini blog made with Elm and Elm UI"
            ]
        ]


update : Msg -> Model -> (Model, Cmd.Cmd Msg)
update msg model =
    case msg of
        MsgDummy ->
            (model, Cmd.none)
