module Rpg.Fudge.Trait
   where


data Level = Level Int

instance Eq Level where
   (Level l1) == (Level l2) = l1 == l2

instance Show Level where
   show (Level   4 ) = "Legendary (Superb + 1)"
   show (Level   3 ) = "Superb"
   show (Level   2 ) = "Great"
   show (Level   1 ) = "Good"
   show (Level   0 ) = "Fair"
   show (Level (-1)) = "Mediocre"
   show (Level (-2)) = "Poor"
   show (Level (-3)) = "Terrible"
   show (Level (-4)) = "Terrible - 1"
   show (Level   l ) = "Level " ++ show l

instance Num Level where
   (Level l1) + (Level l2) = Level (l1 + l2)
   (Level l1) * (Level l2) = Level (l1 * l2)
   abs (Level l) = Level $ abs l
   signum (Level l) = Level $ signum l
   fromInteger n = Level $ fromInteger n

instance Ord Level where
   (Level l1) <= (Level l2) = l1 <= l2


-- Construct the shortest possible description of these trait values
-- short of using numbers alone
showShort :: Level -> String
showShort (Level l)
   | l >   3  = "S" ++ show (l - 3)
   | l < (-3) = "T" ++ show (abs (l + 3))
showShort (Level   3 ) = "Su"
showShort (Level   2 ) = "Gr"
showShort (Level   1 ) = "Go"
showShort (Level   0 ) = "Fa"
showShort (Level (-1)) = "Me"
showShort (Level (-2)) = "Po"
showShort (Level (-3)) = "Te"


superb, great, good, fair, mediocre, poor, terrible :: Level
superb   = Level   3
great    = Level   2
good     = Level   1
fair     = Level   0
mediocre = Level (-1)
poor     = Level (-2)
terrible = Level (-3)
