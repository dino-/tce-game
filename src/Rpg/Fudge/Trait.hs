module Rpg.Fudge.Trait
   where

import Text.Printf


type Level = Int

{-
data Trait = Trait String Level
   deriving Show
-}


{- Construct the shortest possible description of these trait values
   short of using numbers alone
-}
ldisp2 :: Level -> String
ldisp2 l
   | l >   3  = 'S' : show (l - 3)
   | l < (-3) = 'T' : show (abs (l + 3))
ldisp2   3  = "Su"
ldisp2   2  = "Gr"
ldisp2   1  = "Go"
ldisp2   0  = "Fa"
ldisp2 (-1) = "Me"
ldisp2 (-2) = "Po"
ldisp2 (-3) = "Te"
ldisp2 _    = undefined


{- Construct a short description of these trait values that includes 
   the numbers
-}
ldisp4 :: Level -> String
ldisp4 l = printf "%+d%s" l (ldisp2 l)


{- Construct a long, human-readable description of a trait value
-}
ldisp :: Level -> String
ldisp   4  = "Superb + 1"
ldisp   3  = "Superb"
ldisp   2  = "Great"
ldisp   1  = "Good"
ldisp   0  = "Fair"
ldisp (-1) = "Mediocre"
ldisp (-2) = "Poor"
ldisp (-3) = "Terrible"
ldisp (-4) = "Terrible - 1"
ldisp   l  = "Level " ++ show l


{- Construct a long, human-readable description of a trait value
   that includes the full number
-}
ldispL :: Level -> String
ldispL l = printf "%+d %s" l (ldisp l)


superb, great, good, fair, mediocre, poor, terrible :: Level
superb   =   3
great    =   2
good     =   1
fair     =   0
mediocre = (-1)
poor     = (-2)
terrible = (-3)
