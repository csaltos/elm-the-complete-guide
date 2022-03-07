module Main exposing (..)
import Browser
import Html

main : Program () Model msg
main = Browser.document {
    init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
    { title : String
    }

initModel : Model
initModel = {
    title = "My Title"
    }

init : () -> (Model, Cmd msg)
init _ =
    ( initModel, Cmd.none)

view: Model -> Browser.Document msg
view model = 
    {
        title = model.title
        , body = [ Html.text "Hello Document" ]
    }

update : msg -> Model -> (Model, Cmd msg)
update _ model =
    (model, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
