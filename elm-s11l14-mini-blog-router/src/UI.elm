module UI exposing (..)

import Element
import Element.Font
import Element.Input


link : List (Element.Attribute msg) -> String -> String -> Element.Element msg
link attrs url caption =
    Element.link
        ([ Element.Font.color (Element.rgb255 0x11 0x55 0xFF)
         , Element.Font.underline
         ]
            ++ attrs
        )
        { url = url
        , label = Element.text caption
        }


linkWithAction : List (Element.Attribute msg) -> msg -> String -> Element.Element msg
linkWithAction attrs msg caption =
    Element.Input.button
        ([ Element.Font.color (Element.rgb255 0x11 0x55 0xFF)
         , Element.Font.underline
         ]
            ++ attrs
        )
        { onPress = Just msg
        , label = Element.text caption
        }
