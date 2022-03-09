module Main exposing (..)
import Browser
import Browser.Navigation
import Url
import Html

main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        }

type alias Model =
    { title: String
    }

type Msg = MsgDummy

init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url navigationKey =
    ( initModel, Cmd.none)
    
initModel = {
    title = "Hello Navigation"
    }

view : Model -> Browser.Document Msg
view model =
    {
        title = "Test"
        , body = [ viewContent ]
    }

viewContent =
    Html.text "Navigation"

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgDummy ->
            (model, Cmd.none)

subscriptions : model -> Sub msg
subscriptions model =
    Sub.none

onUrlChange : Url.Url -> Msg
onUrlChange url =
    MsgDummy

onUrlRequest : Browser.UrlRequest -> Msg
onUrlRequest urlRequest =
    MsgDummy
