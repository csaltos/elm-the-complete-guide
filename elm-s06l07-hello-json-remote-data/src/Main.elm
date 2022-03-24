module Main exposing (..)

import Browser
import Html
import Http
import Json.Decode
import RemoteData exposing (RemoteData)


main : Program () Model Msg
main =
    Browser.element
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initModel : () -> ( Model, Cmd Msg )
initModel _ =
    ( { result = RemoteData.NotAsked }, getTitle )


view : Model -> Html.Html msg
view model =
    case model.result of
        RemoteData.Failure error ->
            Html.text (getErrorMessage error)

        RemoteData.Success title ->
            Html.text title

        RemoteData.Loading ->
            Html.text "Loading ..."

        RemoteData.NotAsked ->
            Html.text "Where everything starts"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgGotTitle result ->
            ( { model | result = result }, Cmd.none )


getErrorMessage errorDetail =
    case errorDetail of
        Http.NetworkError ->
            "Connection error"

        Http.BadStatus errorStatus ->
            "Invalid server response " ++ String.fromInt errorStatus

        Http.Timeout ->
            "Request time out"

        Http.BadUrl reasonError ->
            "Invalid request URL " ++ reasonError

        Http.BadBody invalidData ->
            "Invalid data " ++ invalidData


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none


type alias Model =
    { result : RemoteData Http.Error String
    }


type Msg
    = MsgGotTitle (RemoteData Http.Error String)


getTitle : Cmd Msg
getTitle =
    Http.get
        { url = "https://jsonplaceholder.typicode.com/posts/2"
        , expect = Http.expectJson upgradeToRemoteData dataTitleDecoder
        }


upgradeToRemoteData result =
    MsgGotTitle (RemoteData.fromResult result)


dataTitleDecoder : Json.Decode.Decoder String
dataTitleDecoder =
    Json.Decode.field "title" Json.Decode.string
