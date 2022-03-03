module Main exposing (..)

import Element
import Element.Background
import Element.Font


main =
    viewLayout


colors =
    { primary = Element.rgb255 0xFF 0xAB 0x00
    , primaryLight = Element.rgb255 0xFF 0xDD 0x4B
    , primaryDark = Element.rgb255 0xC6 0x7C 0x00
    , secondary = Element.rgb255 0x3E 0x27 0x23
    , secondaryLight = Element.rgb255 0x6A 0x4F 0x4B
    , secondaryDark = Element.rgb255 0x1B 0x00 0x00
    , textOnPrimary = Element.rgb255 0x00 0x00 0x00
    , textOnSecondary = Element.rgb255 0xFF 0xFF 0xFF
    }


fontGreatVibes =
    Element.Font.family [ Element.Font.typeface "GreatVibes" ]


fontTypewriter =
    Element.Font.family [ Element.Font.typeface "Typewriter" ]


viewLayout =
    Element.layoutWith
        { options = []
        }
        [ Element.Background.color colors.secondaryDark
        , Element.padding 22
        , Element.Font.color colors.textOnSecondary
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
        , Element.Font.color colors.primary
        , fontGreatVibes
        , Element.Font.size 52
        ]
        [ Element.text "My Dog"
        ]


viewSubtitle =
    Element.paragraph
        [ Element.Font.color colors.primaryLight
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
