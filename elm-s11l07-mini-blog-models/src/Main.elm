module Main exposing (..)

import AboutPage
import Browser
import Browser.Navigation
import Element
import Element.Font
import Url
import HomePage


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
    , url : Url.Url
    , navigationKey : Browser.Navigation.Key
    , modelAboutPage : AboutPage.Model
    }


type Msg
    = MsgDummy
    | MsgUrlChanged Url.Url
    | MsgUrlRequested Browser.UrlRequest


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url navigationKey =
    ( initModel url navigationKey, Cmd.none )


initModel url navigationKey =
    { title = "Hello Navigation"
    , url = url
    , navigationKey = navigationKey
    , modelAboutPage = AboutPage.initModel
    }


view : Model -> Browser.Document Msg
view model =
    { title = getTitle model.url
    , body = [ viewContent model ]
    }


getTitle url =
    if String.startsWith "/about" url.path then
        "About"

    else
        "My Blog"


viewContent model =
    Element.layout []
        (Element.column [ Element.padding 22 ]
            [  viewLink "/about" "About"
            , viewLink "/" "Home"
            , viewPage model
            , viewLink "https://www.duckduckgo.com" "DuckDuckGo"
            , viewLink "https://www.ecosia.org" "Ecosia"
            ]
        )


viewPage model =
    if String.startsWith "/about" model.url.path then
        AboutPage.view model.modelAboutPage

    else
        HomePage.view


viewLink url caption =
    Element.link
        [ Element.Font.color (Element.rgb255 0x11 0x55 0xFF)
        , Element.Font.underline
        , Element.Font.size 12
        ]
        { url = url
        , label = Element.text caption
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgUrlChanged url ->
            ( { model | url = url }, Cmd.none )

        MsgUrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.navigationKey (Url.toString url)
                    )

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
