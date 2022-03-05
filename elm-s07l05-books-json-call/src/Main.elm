module Main exposing (..)

import Browser
import Element as E
import Element.Background as EBG
import Element.Border as EB
import Element.Font as EF
import Element.Input as EI
import Html
import Http
import Json.Decode as JD


type alias Model =
    { searchText : String
    , results : List String
    }


type Msg
    = MsgSearch
    | MsgGotResults (Result Http.Error (List String))
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
            ( model, cmdSearch )

        MsgGotResults result ->
            case result of
                Ok data ->
                    ( { model | results = data }, Cmd.none )
                Err error ->
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
        (E.column [] [ viewSearchBar model, viewResults model])


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

viewResults model =
    E.column [] [
        case List.head model.results of
            Just firstItem ->
                E.text firstItem
            Nothing ->
                E.text "Empty"
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

cmdSearch =
    Http.get {
        url = "https://www.googleapis.com/books/v1/volumes?q=Elm+Language"
        , expect = Http.expectJson MsgGotResults decodeJson
    }

decodeJson =
    JD.field "items" decodeItems

decodeItems =
    JD.list decodeItem

decodeItem =
    JD.field "id" JD.string
