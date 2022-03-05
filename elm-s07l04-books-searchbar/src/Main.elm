module Main exposing (..)

import Browser
import Element as E
import Element.Background as EBG
import Element.Border as EB
import Element.Font as EF
import Element.Input as EI
import Html


type alias Model =
    { searchText : String
    , results : List String
    }


type Msg
    = MsgSearch
    | MsgGotResults
    | MsgInputTextField String


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initModel, Cmd.none )


initModel : Model
initModel =
    { searchText = ""
    , results = []
    }


view : Model -> Html.Html Msg
view model =
    viewLayout model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgInputTextField newTextInput ->
            ( { model | searchText = newTextInput }, Cmd.none )

        MsgSearch ->
            ( model, Cmd.none )

        MsgGotResults ->
            ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions _ =
    Sub.none


viewLayout : Model -> Html.Html Msg
viewLayout model =
    E.layoutWith
        { options =
            [ E.focusStyle
                { borderColor = Nothing
                , backgroundColor = Nothing
                , shadow = Nothing
                }
            ]
        }
        []
        (viewSearchBar model)


viewSearchBar : Model -> E.Element Msg
viewSearchBar model =
    E.row []
        [ EI.search []
            { onChange = MsgInputTextField
            , text = model.searchText
            , placeholder = Nothing
            , label = EI.labelLeft [] (E.text "Search books:")
            }
        , viewSearchButton
        ]


viewSearchButton : E.Element Msg
viewSearchButton =
    EI.button
        [ EBG.color (E.rgb255 0x00 0x33 0x66)
        , EF.color (E.rgb255 0xEE 0xEE 0xEE)
        , EB.rounded 5
        , E.padding 12
        , E.mouseOver
            [ EBG.color (E.rgb255 0x33 0x66 0x99)
            , EF.color (E.rgb255 0xDD 0xDD 0xDD)
            ]
        ]
        { onPress = Just MsgSearch
        , label = E.text "Search"
        }
