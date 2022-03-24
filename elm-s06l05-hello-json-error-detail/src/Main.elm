module Main exposing (..)

import Browser
import Html
import Http
import Json.Decode


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
    ( { title = "Loading", error = Nothing }, getTitle )


view : Model -> Html.Html msg
view model =
    case model.error of
        Just error ->
            Html.text (getErrorMessage error)

        Nothing ->
            Html.text model.title


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgGotTitle result ->
            case result of
                Ok data ->
                    ( { model | title = data }, Cmd.none )

                Err errorDetail ->
                    ( { model | error = Just errorDetail }, Cmd.none )


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
    { title : String
    , error : Maybe Http.Error
    }


type Msg
    = MsgGotTitle (Result Http.Error String)


getTitle : Cmd Msg
getTitle =
    Http.get
        { url = "https://jsonplaceholder.typicode.com/posts/2"
        , expect = Http.expectJson MsgGotTitle dataTitleDecoder
        }


dataTitleDecoder : Json.Decode.Decoder String
dataTitleDecoder =
    Json.Decode.field "title" Json.Decode.string
