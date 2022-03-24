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
    ( { result = Nothing }, getTitle )


view : Model -> Html.Html msg
view model =
    case model.result of
        Just result ->
            case result of
                Err error ->
                    Html.text (getErrorMessage error)

                Ok title ->
                    Html.text title

        Nothing ->
            Html.text "Loading ..."


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgGotTitle result ->
            ( { model | result = Just result }, Cmd.none )


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
    { result : Maybe (Result Http.Error String)
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
    Json.Decode.field "titleX" Json.Decode.string
