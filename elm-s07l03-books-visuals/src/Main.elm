module Main exposing (..)
import Browser
import Html
import Element as E
import Element.Background as EBG
import Element.Border as EB
import Element.Input as EI

type alias Model =
    { searchText : String
    , results : List String
    }

type Msg =
    MsgSearch
    | MsgGotResults
    | MsgInputTextField String

main: Program () Model Msg
main =
    Browser.element {
        init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }

init: () -> ( Model, Cmd Msg )
init _ =
    ( initModel, Cmd.none)

initModel: Model
initModel = {
    searchText = ""
    , results = []
    }

view : Model -> Html.Html Msg
view model =
    viewLayout model

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgInputTextField newTextInput ->
            ( { model | searchText = newTextInput }, Cmd.none)
        
        MsgSearch ->
            (model, Cmd.none)
    
        MsgGotResults ->
            (model, Cmd.none)

subscriptions : model -> Sub msg
subscriptions _ =
    Sub.none

viewLayout : Model -> Html.Html Msg
viewLayout model =
    E.layout [] (
        viewSearchBar model
    )

viewSearchBar : Model -> E.Element Msg
viewSearchBar model =
    EI.search []
    {
        onChange = MsgInputTextField
        , text = model.searchText
        , placeholder = Nothing
        , label = EI.labelLeft [] (E.text "Search books:")
    }