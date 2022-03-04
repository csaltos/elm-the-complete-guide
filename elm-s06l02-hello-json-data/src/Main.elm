module Main exposing (..)
import Http
import Json.Decode

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
