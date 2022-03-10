module AboutPage exposing (..)

import Element
import Element.Font


view =
    Element.column [ Element.padding 20 ]
        [ Element.text "About page"
        , Element.paragraph
            [ Element.paddingXY 0 20
            , Element.Font.size 14
            ]
            [ Element.text "This is a web site for learning about navigation"
            ]
        ]
