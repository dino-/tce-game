{-# LANGUAGE GeneralizedNewtypeDeriving #-}

{- | A module to define traits as described by the Fudge role-playing
   game system.

   For more information, see the Fudge System Reference Document
   located here: <http://www.fudgerpg.com/goodies/fudge-files/core/>
-}

module Rpg.Fudge.Trait
   ( Level (..)
   , ldispShort
   , ldispLong
   , superb, great, good, fair, mediocre, poor, terrible
   )
   where

import System.Random ( Random, randomR, random )
import Text.Printf


{- | Data type for containing a Trait Level
-}
newtype Level = Level { unLevel :: Int }
   deriving (Eq, Num, Ord)


instance Show Level where
   show = ldispShort


instance Random Level where

   randomR ((Level v), (Level w)) g = (Level x, newG)
      where (x, newG) = randomR (v, w) g

   random = randomR fudgeDieRange


{- | Fudge dice are 6-sided dice with two + sides, two - sides,
   and two blank sides. The possible values of each die are
   [-1, 0, 1]

   This definition is used above for the Random instance of Level
-}
fudgeDieRange :: (Level, Level)
fudgeDieRange = (mediocre, good)


{-
data Trait = Trait String Level
   deriving Show
-}


{- | Construct the shortest possible description of these trait
   values short of using numbers alone
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


{- | Construct a short description of a trait value that includes
   the numeric value
-}
ldispShort :: Level -> String
ldispShort l@(Level v) = printf "%+d%s" v (ldispAbbrev l)


{- | Construct a long, human-readable description of a trait value
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


{- | Construct a long, human-readable description of a trait value
   that includes the numeric value
-}
ldispLong :: Level -> String
ldispLong l@(Level v) = printf "%+d %s" v (ldispFull l)


{- | Convenience definitions of the core set of Trait Levels
-}
superb, great, good, fair, mediocre, poor, terrible :: Level
superb   = Level   3
great    = Level   2
good     = Level   1
fair     = Level   0
mediocre = Level (-1)
poor     = Level (-2)
terrible = Level (-3)
