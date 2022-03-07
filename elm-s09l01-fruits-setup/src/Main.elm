module Main exposing (..)

import Chart as C
import Chart.Attributes as CA
import Svg as S


main =
    C.chart
        [ CA.width 900
        , CA.height 300
        , CA.margin { top = 50, right = 50, bottom = 50, left = 50 }
        ]
        [ C.bars []
            [ C.bar .calories []
            , C.bar .kj []
            ]
            data
          , C.xLabels []
          , C.yLabels [ CA.withGrid ]  
        ]


data =
    [ { x = 1, calories = 52.0, kj = 218.0 }
    , { x = 2, calories = 160.0, kj = 672.0 }
    , { x = 3, calories = 47.0, kj = 197.0 }
    ]
