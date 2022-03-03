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


fontGreatVibes =
    Element.Font.family [ Element.Font.typeface "GreatVibes" ]


fontTypewriter =
    Element.Font.family [ Element.Font.typeface "Typewriter" ]


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
            , viewContent
            ]
        )


viewTitle =
    Element.paragraph
        [ Element.Font.bold
        , Element.Font.color blue
        , fontGreatVibes
        , Element.Font.size 48
        ]
        [ Element.text "My Dog"
        ]


viewSubtitle =
    Element.paragraph
        [ Element.Font.color black
        , Element.Font.size 16
        , fontTypewriter
        , Element.paddingXY 0 10
        ]
        [ Element.text "A web page for my dog"
        ]


dogImage =
    Element.image
        [ Element.width (Element.maximum 300 Element.fill)
        , Element.centerX
        ]
        { src = "dog.png"
        , description = "A picture of my dog"
        }


text1 =
    "Donut caramels chocolate cake powder biscuit. Jelly beans tootsie roll lollipop chocolate bar carrot cake tart gingerbread shortbread croissant. Chocolate shortbread bear claw ice cream sugar plum lemon drops tootsie roll donut gingerbread. Muffin tiramisu croissant brownie danish apple pie croissant powder marshmallow. Pudding chocolate cake sweet liquorice apple pie toffee. Candy canes soufflé liquorice gingerbread dragée caramels cake caramels marshmallow. Cheesecake apple pie cake pie chocolate. Chocolate bar gummi bears liquorice cake sugar plum. Jelly beans jujubes sesame snaps oat cake marshmallow bonbon toffee brownie."


text2 =
    "Jelly biscuit ice cream apple pie pie. Chocolate croissant croissant marzipan sweet roll chocolate cake sesame snaps sweet roll liquorice. Lemon drops macaroon tootsie roll candy canes shortbread tootsie roll. Candy canes chocolate gummi bears cupcake soufflé. Carrot cake soufflé tiramisu chocolate bar cupcake cake. Ice cream gummi bears cheesecake biscuit bear claw tart sweet jujubes. Sesame snaps toffee candy muffin lemon drops bonbon chupa chups pie. Croissant marshmallow cheesecake jujubes cookie sweet chocolate chupa chups gummies. Marshmallow jelly gummies sweet chocolate."


text3 =
    "Chocolate cake oat cake lemon drops dragée lollipop tart. Bear claw oat cake cotton candy soufflé sugar plum toffee sweet roll muffin marzipan. Tiramisu carrot cake sugar plum candy bear claw wafer brownie ice cream jelly. Oat cake sweet biscuit cheesecake brownie. Sweet roll ice cream caramels cake topping sweet roll apple pie danish jelly-o. Jujubes chocolate cake jujubes topping danish sweet cotton candy. Candy ice cream biscuit toffee cheesecake. Candy dessert soufflé pie ice cream pie pudding muffin icing. Sweet roll chocolate bar ice cream sugar plum wafer. Wafer halvah oat cake marshmallow gummi bears gingerbread ice cream cheesecake sweet."


viewContent =
    Element.column
        [ Element.Font.color blue
        , fontTypewriter
        ]
        [ viewText text1
        , viewText text2
        , viewText text3
        ]


viewText contentText =
    Element.paragraph
        [ Element.padding 20
        ]
        [ Element.text
            contentText
        ]
