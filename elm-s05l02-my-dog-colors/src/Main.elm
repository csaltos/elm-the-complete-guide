module Main exposing (..)

import Element
import Element.Font

main =
    viewLayout

red = Element.rgb255 255 0 0
blue = Element.rgb255 0 0 200
black = Element.rgb255 0 0 0

viewLayout =
    Element.layoutWith {
        options = []
    }
    [ Element.Font.bold
    , Element.Font.color blue ]
    (Element.column []
    [
        Element.text "My Dog"
        , viewParagraph
    ])

viewParagraph =
    Element.paragraph [ Element.Font.color black ]
    [
        Element.text "A web page for my dog"
    ]
