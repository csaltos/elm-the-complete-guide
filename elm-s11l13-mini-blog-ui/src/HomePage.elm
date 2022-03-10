module HomePage exposing (..)

import Element
import Element.Font
import Element.Input


type Msg
    = MsgIncrementCounter


type alias Model =
    { counter : Int
    }


initModel : Model
initModel =
    { counter = 0
    }


view : Model -> Element.Element Msg
view model =
    Element.column [ Element.padding 20 ]
        [ Element.text ("My blog " ++ String.fromInt model.counter)
        , Element.paragraph
            [ Element.paddingXY 0 20
            , Element.Font.size 14
            ]
            [ Element.text "Welcome to my mini blog made with Elm and Elm UI"
            ]
        , Element.Input.button []
            { onPress = Just MsgIncrementCounter
            , label = Element.text "Count"
            }
        ]


update : Msg -> Model -> ( Model, Cmd.Cmd Msg )
update msg model =
    case msg of
        MsgIncrementCounter ->
            ( { model | counter = model.counter + 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
