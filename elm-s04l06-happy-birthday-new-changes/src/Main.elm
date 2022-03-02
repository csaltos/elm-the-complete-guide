module Main exposing (..)

import Browser
import Html
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


initModel : Model
initModel =
    { message = "Welcome"
    , firstname = ""
    , age = 0
    }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }


type Msg
    = MsgSuprise
    | MsgReset
    | MsgNewName String
    | MsgNewAgeAsString String


type alias Model =
    { message : String
    , firstname : String
    , age: Int
    }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.text model.message
        , Html.input [ onInput MsgNewName, value model.firstname ] []
        , Html.input [ onInput MsgNewAgeAsString, value (String.fromInt model.age) ] []
        , Html.button [ onClick MsgSuprise ] [ Html.text "Surprise" ]
        , Html.button [ onClick MsgReset ] [ Html.text "Reset" ]
        , Html.text (String.fromInt (String.length model.firstname))
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgSuprise ->
            { model
                | message = "Happy Birthday " ++ model.firstname ++ " with " ++ (String.fromInt model.age) ++ " years old !!"
            }

        MsgReset ->
            initModel

        MsgNewName newName ->
            { model
                | firstname = newName
            }
        
        MsgNewAgeAsString newValue ->
            case String.toInt newValue of
                Just anInt ->
                    {
                        model
                            | age = anInt
                    }
                Nothing ->
                    {
                        model
                            | message = "The age is wrong", age = 0
                    }

