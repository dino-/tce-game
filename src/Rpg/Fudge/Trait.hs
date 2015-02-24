{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Rpg.Fudge.Trait
   ( Level (..)
   , ldispShort
   , ldispLong
   , superb, great, good, fair, mediocre, poor, terrible
   )
   where

import Text.Printf


newtype Level = Level Int
   deriving (Eq, Num, Ord)

instance Show Level where
   show = ldispShort

{-
data Trait = Trait String Level
   deriving Show
-}


{- Construct the shortest possible description of these trait values
   short of using numbers alone
-}
ldispAbbrev :: Level -> String
ldispAbbrev (Level l)
   | l >   3  = 'S' : show (l - 3)
   | l < (-3) = 'T' : show (abs (l + 3))
ldispAbbrev (Level   3 ) = "Su"
ldispAbbrev (Level   2 ) = "Gr"
ldispAbbrev (Level   1 ) = "Go"
ldispAbbrev (Level   0 ) = "Fa"
ldispAbbrev (Level (-1)) = "Me"
ldispAbbrev (Level (-2)) = "Po"
ldispAbbrev (Level (-3)) = "Te"
ldispAbbrev _            = undefined


{- Construct a short description of these trait values that includes 
   the numbers
-}
ldispShort :: Level -> String
ldispShort l@(Level v) = printf "%+d%s" v (ldispAbbrev l)


{- Construct a long, human-readable description of a trait value
-}
ldispFull :: Level -> String
ldispFull (Level   4 ) = "Superb + 1"
ldispFull (Level   3 ) = "Superb"
ldispFull (Level   2 ) = "Great"
ldispFull (Level   1 ) = "Good"
ldispFull (Level   0 ) = "Fair"
ldispFull (Level (-1)) = "Mediocre"
ldispFull (Level (-2)) = "Poor"
ldispFull (Level (-3)) = "Terrible"
ldispFull (Level (-4)) = "Terrible - 1"
ldispFull (Level   l ) = "Level " ++ show l


{- Construct a long, human-readable description of a trait value
   that includes the full number
-}
ldispLong :: Level -> String
ldispLong l@(Level v) = printf "%+d %s" v (ldispFull l)


superb, great, good, fair, mediocre, poor, terrible :: Level
superb   = Level   3
great    = Level   2
good     = Level   1
fair     = Level   0
mediocre = Level (-1)
poor     = Level (-2)
terrible = Level (-3)
