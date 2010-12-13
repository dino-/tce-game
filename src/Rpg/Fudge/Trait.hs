module Rpg.Fudge.Trait
   where

import Text.Printf


data Level = Level Int
   deriving Show

instance Eq Level where
   (Level l1) == (Level l2) = l1 == l2

instance Num Level where
   (Level l1) + (Level l2) = Level (l1 + l2)
   (Level l1) * (Level l2) = Level (l1 * l2)
   abs (Level l) = Level $ abs l
   signum (Level l) = Level $ signum l
   fromInteger n = Level $ fromInteger n

instance Ord Level where
   (Level l1) <= (Level l2) = l1 <= l2


{- Construct the shortest possible description of these trait values
   short of using numbers alone
-}
ldisp2 :: Level -> String
ldisp2 (Level l)
   | l >   3  = 'S' : show (l - 3)
   | l < (-3) = 'T' : show (abs (l + 3))
ldisp2 (Level   3 ) = "Su"
ldisp2 (Level   2 ) = "Gr"
ldisp2 (Level   1 ) = "Go"
ldisp2 (Level   0 ) = "Fa"
ldisp2 (Level (-1)) = "Me"
ldisp2 (Level (-2)) = "Po"
ldisp2 (Level (-3)) = "Te"
ldisp2 _            = undefined


{- Construct a short description of these trait values that includes 
   the numbers
-}
ldisp4 :: Level -> String
ldisp4 l@(Level m) = printf "%+d%s" m (ldisp2 l)


{- Construct a long, human-readable description of a trait value
-}
ldisp :: Level -> String
ldisp (Level   4 ) = "Legendary (Superb + 1)"
ldisp (Level   3 ) = "Superb"
ldisp (Level   2 ) = "Great"
ldisp (Level   1 ) = "Good"
ldisp (Level   0 ) = "Fair"
ldisp (Level (-1)) = "Mediocre"
ldisp (Level (-2)) = "Poor"
ldisp (Level (-3)) = "Terrible"
ldisp (Level (-4)) = "Terrible - 1"
ldisp (Level   l ) = "Level " ++ show l


{- Construct a long, human-readable description of a trait value
   that includes the full number
-}
ldispL :: Level -> String
ldispL l@(Level m) = printf "%+d %s" m (ldisp l)


superb, great, good, fair, mediocre, poor, terrible :: Level
superb   = Level   3
great    = Level   2
good     = Level   1
fair     = Level   0
mediocre = Level (-1)
poor     = Level (-2)
terrible = Level (-3)
