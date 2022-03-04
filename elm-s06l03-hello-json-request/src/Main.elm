module Main exposing (..)
import Http
import Json.Decode
import Browser
import Html

main : Program () Model Msg
main = Browser.element {
    init = initModel,
    view = view,
    update = update,
    subscriptions = subscriptions
    }

initModel flags =
    ( { title = "Testing"}, getTitle )

view model =
    Html.text model.title

update msg model =
    (model, Cmd.none)

subscriptions model =
    Sub.none

type alias Model =
    { title : String
    }

type Msg =
    MsgGotTitle (Result Http.Error String)


getTitle =
    Http.get {
       url = "https://jsonplaceholder.typicode.com/posts/1"
       , expect = Http.expectJson MsgGotTitle dataTitleDecoder 
    }

dataTitleDecoder =
    Json.Decode.field "title" Json.Decode.string
