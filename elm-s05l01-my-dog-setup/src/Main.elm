module Main exposing (..)

import Element
import Element.Font

main =
    viewLayout

viewLayout =
    Element.layoutWith {
        options = []
    }
    [ Element.Font.bold ]
    (Element.text "My dog")
