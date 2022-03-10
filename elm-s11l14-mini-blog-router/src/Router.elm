module Router exposing (..)

import Url
import Url.Parser exposing ((</>))


type Route
    = RouteAboutPage
    | RouteHomePage

aboutPageParser =
    Url.Parser.s "about"

referenceContacPageParse =
    Url.Parser.s "about" </> Url.Parser.s "contact"

homePageParser =
    Url.Parser.top

routerParser =
    Url.Parser.oneOf [
        Url.Parser.map RouteAboutPage aboutPageParser
        , Url.Parser.map RouteHomePage homePageParser
    ]

fromUrl : Url.Url -> Maybe Route
fromUrl url =
    Url.Parser.parse routerParser url


asPath : Route -> String
asPath route =
    case route of
        RouteAboutPage ->
            "/about"

        RouteHomePage ->
            "/"
