module Main exposing (..)

import Element
import Element.Background
import Element.Font


main =
    viewLayout


red =
    Element.rgb255 255 0 0


blue =
    Element.rgb255 0 0 200


black =
    Element.rgb255 0 0 0


lightGray =
    Element.rgb255 180 180 180


viewLayout =
    Element.layoutWith
        { options = []
        }
        [ Element.Background.color lightGray
        , Element.padding 22
        ]
        (Element.column []
            [ viewTitle
            , viewSubtitle
            , dogImage
            ]
        )


viewTitle =
    Element.paragraph
        [ Element.Font.bold
        , Element.Font.color blue
        ]
        [ Element.text "My Dog"
        ]


viewSubtitle =
    Element.paragraph [ Element.Font.color black ]
        [ Element.text "A web page for my dog"
        ]


dogImage =
    Element.image [ Element.width Element.fill ]
        { src = "dog.png"
        , description = "A picture of my dog"
        }
