module Rpg.Fudge.Dice
   ( rolldF, rolldFSum )
   where

import Rpg.Dice
import Rpg.Fudge.Trait
import System.Random (StdGen)


fudgeDieRange :: (Int, Int)
fudgeDieRange = (-1, 1)


rolldF :: Int -> StdGen -> [Int]
rolldF numDice g = roll g numDice fudgeDieRange


rolldFSum :: Int -> StdGen -> Level
rolldFSum numDice g = Level $ rollSum g numDice fudgeDieRange
