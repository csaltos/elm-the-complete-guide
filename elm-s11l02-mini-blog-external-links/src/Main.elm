module Main exposing (..)

import Browser
import Browser.Navigation
import Element
import Element.Font
import Html
import Url


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
    { title : String
    }


type Msg
    = MsgDummy
    | MsgUrlChanged Url.Url
    | MsgUrlRequested Browser.UrlRequest


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url navigationKey =
    ( initModel, Cmd.none )


initModel =
    { title = "Hello Navigation"
    }


view : Model -> Browser.Document Msg
view model =
    { title = "Test"
    , body = [ viewContent model ]
    }


viewContent model =
    Element.layout []
        (Element.column [ Element.padding 22 ]
            [ Element.text model.title
            , Element.link
                [ Element.Font.color (Element.rgb255 0x11 0x55 0xFF)
                , Element.Font.underline
                ]
                { url = "https://www.duckduckgo.com"
                , label = Element.text "DuckDuckGo"
                }
            ]
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgUrlChanged url ->
            ( model, Cmd.none )

        MsgUrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Cmd.none )

                Browser.External url ->
                    ( { model | title = url }, Browser.Navigation.load url )

        MsgDummy ->
            ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none


onUrlChange : Url.Url -> Msg
onUrlChange url =
    MsgUrlChanged url


onUrlRequest : Browser.UrlRequest -> Msg
onUrlRequest urlRequest =
    MsgUrlRequested urlRequest
