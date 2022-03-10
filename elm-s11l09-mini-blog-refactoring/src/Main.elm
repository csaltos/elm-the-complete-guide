module Main exposing (..)

import AboutPage
import Browser
import Browser.Navigation
import Element
import Element.Font
import Url
import HomePage
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
    { url : Url.Url
    , navigationKey : Browser.Navigation.Key
    , modelAboutPage : AboutPage.Model
    , modelHomePage: HomePage.Model
    }


type Msg
    = MsgAboutPage AboutPage.Msg
    | MsgHomePage HomePage.Msg
    | MsgUrlChanged Url.Url
    | MsgUrlRequested Browser.UrlRequest


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url navigationKey =
    ( initModel url navigationKey, Cmd.none )


initModel : Url.Url -> Browser.Navigation.Key -> Model
initModel url navigationKey =
    { url = url
    , navigationKey = navigationKey
    , modelAboutPage = AboutPage.initModel
    , modelHomePage = HomePage.initModel
    }


view : Model -> Browser.Document Msg
view model =
    { title = getTitle model.url
    , body = [ viewContent model ]
    }


getTitle : Url.Url -> String
getTitle url =
    if String.startsWith "/about" url.path then
        "About"

    else
        "My Blog"


viewContent : Model -> Html.Html Msg
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


viewPage : Model -> Element.Element Msg
viewPage model =
    if String.startsWith "/about" model.url.path then
        Element.map MsgAboutPage (AboutPage.view model.modelAboutPage)

    else
        Element.map MsgHomePage (HomePage.view model.modelHomePage)


viewLink : String -> String -> Element.Element msg
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
                    ( model, Browser.Navigation.load url )

        MsgAboutPage msgAboutPage ->
            let
                newAboutPageModel = AboutPage.update msgAboutPage model.modelAboutPage
            in
            ( { model | modelAboutPage = newAboutPageModel }, Cmd.none)

        MsgHomePage msgHomePage ->
            let
                newHomePageModel = HomePage.update msgHomePage model.modelHomePage
            in
            ( { model | modelHomePage = newHomePageModel }, Cmd.none)

        


subscriptions : model -> Sub msg
subscriptions _ =
    Sub.none


onUrlChange : Url.Url -> Msg
onUrlChange url =
    MsgUrlChanged url


onUrlRequest : Browser.UrlRequest -> Msg
onUrlRequest urlRequest =
    MsgUrlRequested urlRequest
