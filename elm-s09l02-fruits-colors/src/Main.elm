module Main exposing (..)

import Chart as C
import Chart.Attributes as CA
import Dict
import Svg as S


main =
    C.chart
        [ CA.width 900
        , CA.height 300
        , CA.margin { top = 50, right = 50, bottom = 50, left = 50 }
        ]
        [ C.bars []
            [ C.bar .calories [ CA.color "#336699" ]
            , C.bar .kj [ CA.color "#339966" ]
            ]
            data
        , C.xLabels [ CA.format labelFor ]
        , C.yLabels [ CA.withGrid ]
        , C.labelAt CA.middle
            .max
            [ CA.moveUp 20
            , CA.fontSize 24
            ]
            [ S.text "Fruits" ]
        ]


data =
    [ { x = 1, calories = 52.0, kj = 218.0 }
    , { x = 2, calories = 160.0, kj = 672.0 }
    , { x = 3, calories = 47.0, kj = 197.0 }
    , { x = 4, calories = 88.0, kj = 478.0 }
    ]


labels =
    Dict.fromList
        [ ( 1, "Apple" )
        , ( 2, "Avocado" )
        , ( 3, "Clementine" )
        , ( 4, "Chirimoya" )
        ]


labelFor x =
    Maybe.withDefault "" (Dict.get x labels)
