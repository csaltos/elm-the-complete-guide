module Main exposing (..)

import Browser
import Element as E
import Element.Background as EBG
import Element.Border as EB
import Element.Font as EF
import Element.Input as EI
import Element.Region as ER
import Html exposing (Html)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = darkColors
        , view = viewLayout
        , update = update
        }


type Msg
    = MsgChangeColors


update : Msg -> Model -> Model
update _ model =
    if model.primary == darkColors.primary then
        lightColors

    else
        darkColors


darkColors : Model
darkColors =
    { primary = E.rgb255 0xFF 0xAB 0x00
    , primaryLight = E.rgb255 0xFF 0xDD 0x4B
    , primaryDark = E.rgb255 0xC6 0x7C 0x00
    , secondary = E.rgb255 0x3E 0x27 0x23
    , secondaryLight = E.rgb255 0x6A 0x4F 0x4B
    , secondaryDark = E.rgb255 0x1B 0x00 0x00
    , textOnPrimary = E.rgb255 0x00 0x00 0x00
    , textOnSecondary = E.rgb255 0xFF 0xFF 0xFF
    }


lightColors : Model
lightColors =
    { secondary = E.rgb255 0xFF 0xAB 0x00
    , secondaryLight = E.rgb255 0xFF 0xDD 0x4B
    , secondaryDark = E.rgb255 0xC6 0x7C 0x00
    , primary = E.rgb255 0x3E 0x27 0x23
    , primaryLight = E.rgb255 0x6A 0x4F 0x4B
    , primaryDark = E.rgb255 0x1B 0x00 0x00
    , textOnSecondary = E.rgb255 0x00 0x00 0x00
    , textOnPrimary = E.rgb255 0xFF 0xFF 0xFF
    }


fontGreatVibes : E.Attribute msg
fontGreatVibes =
    EF.family [ EF.typeface "GreatVibes" ]


fontTypewriter : E.Attribute msg
fontTypewriter =
    EF.family [ EF.typeface "Typewriter" ]


type alias Model =
    { primaryDark : E.Color
    , secondaryDark : E.Color
    , textOnSecondary : E.Color
    , textOnPrimary : E.Color
    , primaryLight : E.Color
    , primary : E.Color
    , secondary : E.Color
    , secondaryLight : E.Color
    }


viewLayout : Model -> Html Msg
viewLayout model =
    E.layoutWith
        { options =
            [ E.focusStyle
                { backgroundColor = Nothing
                , borderColor = Just model.primaryDark
                , shadow = Nothing
                }
            ]
        }
        [ EBG.color model.secondaryDark
        , E.padding 22
        , EF.color model.textOnSecondary
        ]
        (E.column []
            [ buttonChangeColors model
            , viewTitle model
            , viewSubtitle model
            , dogImage
            , viewContent
            ]
        )


viewTitle : Model -> E.Element msg
viewTitle model =
    E.paragraph
        [ EF.bold
        , EF.color model.primary
        , fontGreatVibes
        , EF.size 52
        , ER.heading 1
        ]
        [ E.text "My Dog version 2"
        ]


viewSubtitle : Model -> E.Element msg
viewSubtitle model =
    E.paragraph
        [ EF.color model.primaryLight
        , EF.size 16
        , fontTypewriter
        , E.paddingXY 0 10
        , ER.heading 2
        ]
        [ E.text "A web page for my dog"
        ]


dogImage : E.Element msg
dogImage =
    E.image
        [ E.width (E.maximum 300 E.fill)
        , E.centerX
        ]
        { src = "dog.png"
        , description = "A picture of my dog"
        }


buttonChangeColors : Model -> E.Element Msg
buttonChangeColors model =
    EI.button
        [ EBG.color model.primaryLight
        , EB.rounded 8
        , EF.color model.secondaryDark
        , E.alignRight
        , E.paddingEach { top = 12, right = 12, bottom = 9, left = 12 }
        , EF.size 16
        , EF.bold
        , E.mouseOver
            [ EBG.color model.primary
            ]
        ]
        { onPress = Just MsgChangeColors
        , label = E.text "Change colors"
        }


text1 : String
text1 =
    "Chocolate this is version 2 bar shortbread shortbread muffin sugar plum biscuit danish. Cupcake tart powder gummi bears donut cake cotton candy. Marshmallow cotton candy sweet halvah lollipop jujubes. Oat cake macaroon chocolate bar gummies candy canes. Topping cupcake dragée biscuit dragée bonbon biscuit. Soufflé powder jelly-o shortbread toffee apple pie. Soufflé cupcake sesame snaps sweet apple pie chocolate biscuit powder dragée. Jelly cotton candy chocolate tart halvah halvah."


text2 : String
text2 =
    "Sweet croissant pie liquorice pudding carrot cake. Chupa chups dessert pudding danish croissant cotton candy. Gummi bears toffee caramels chocolate oat cake donut soufflé. Lemon drops oat cake sugar plum cotton candy candy brownie pie pastry. Halvah jelly-o cookie gummies chocolate chocolate. Ice cream chocolate bar croissant chocolate sugar plum macaroon sesame snaps cake caramels."


text3 : String
text3 =
    "Danish pie dragée chupa chups sweet jelly-o sweet roll biscuit bonbon. Cheesecake sesame snaps brownie pastry pastry. Jelly-o macaroon tootsie roll cupcake jelly beans candy lemon drops. Sugar plum croissant wafer icing gingerbread carrot cake marzipan. Bear claw sesame snaps cotton candy croissant toffee wafer jujubes jelly ice cream. Bear claw cupcake topping wafer pastry bonbon chocolate cake chocolate gingerbread. Gummi bears soufflé ice cream icing tart jelly beans cheesecake sweet. Chocolate brownie danish powder jelly."


paddingTop : Int -> E.Attribute msg
paddingTop size =
    E.paddingEach { top = size, right = 0, bottom = 0, left = 0 }


viewContent : E.Element msg
viewContent =
    E.column
        [ fontTypewriter
        , EF.size 16
        , paddingTop 20
        , ER.mainContent
        ]
        [ E.paragraph
            [ E.paddingXY 0 20
            ]
            [ E.text text1
            ]
        , E.paragraph
            [ E.paddingXY 0 20
            ]
            [ E.text text2
            ]
        , E.paragraph
            [ E.paddingXY 0 20
            ]
            [ E.text text3
            ]
        ]
