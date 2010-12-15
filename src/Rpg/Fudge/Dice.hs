module Rpg.Fudge.Dice
   ( rolldF, rolldFSum )
   where

import Rpg.Dice
import Rpg.Fudge.Trait
import System.Random (StdGen)


{- Fudge dice are 6-sided dice with two + sides, two - sides, and two 
   blank sides. The possible values of each die are [-1, 0, 1]
-}
fudgeDieRange :: (Int, Int)
fudgeDieRange = (-1, 1)


rolldF :: Int -> StdGen -> [Int]
rolldF = roll fudgeDieRange


rolldFSum :: Int -> StdGen -> Level
rolldFSum numDice g = Level $ rollSum fudgeDieRange numDice g
