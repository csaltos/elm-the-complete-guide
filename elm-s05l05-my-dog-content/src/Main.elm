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
    "Chocolate bar shortbread shortbread muffin sugar plum biscuit danish. Cupcake tart powder gummi bears donut cake cotton candy. Marshmallow cotton candy sweet halvah lollipop jujubes. Oat cake macaroon chocolate bar gummies candy canes. Topping cupcake dragée biscuit dragée bonbon biscuit. Soufflé powder jelly-o shortbread toffee apple pie. Soufflé cupcake sesame snaps sweet apple pie chocolate biscuit powder dragée. Jelly cotton candy chocolate tart halvah halvah."


text2 =
    "Sweet croissant pie liquorice pudding carrot cake. Chupa chups dessert pudding danish croissant cotton candy. Gummi bears toffee caramels chocolate oat cake donut soufflé. Lemon drops oat cake sugar plum cotton candy candy brownie pie pastry. Halvah jelly-o cookie gummies chocolate chocolate. Ice cream chocolate bar croissant chocolate sugar plum macaroon sesame snaps cake caramels."


text3 =
    "Danish pie dragée chupa chups sweet jelly-o sweet roll biscuit bonbon. Cheesecake sesame snaps brownie pastry pastry. Jelly-o macaroon tootsie roll cupcake jelly beans candy lemon drops. Sugar plum croissant wafer icing gingerbread carrot cake marzipan. Bear claw sesame snaps cotton candy croissant toffee wafer jujubes jelly ice cream. Bear claw cupcake topping wafer pastry bonbon chocolate cake chocolate gingerbread. Gummi bears soufflé ice cream icing tart jelly beans cheesecake sweet. Chocolate brownie danish powder jelly."


paddingTop size =
    Element.paddingEach { top = size, right = 0, bottom = 0, left = 0 }

viewContent =
    Element.column
        [ fontTypewriter
        , Element.Font.size 16
        , paddingTop 20
        ]
        [ Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text1
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text2
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text3
            ]
        ]
