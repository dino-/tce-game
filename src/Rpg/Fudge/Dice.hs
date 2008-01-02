module Rpg.Fudge.Dice
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


roll3dF :: StdGen -> Level
roll3dF = rolldFSum 3


roll4dF :: StdGen -> Level
roll4dF = rolldFSum 4
