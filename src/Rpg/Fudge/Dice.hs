module Rpg.Fudge.Dice
   ( rolldFs, rolldFSums )
   where

import Rpg.Dice
import System.Random ( RandomGen )


{- Fudge dice are 6-sided dice with two + sides, two - sides, and two 
   blank sides. The possible values of each die are [-1, 0, 1]
-}
fudgeDieRange :: (Int, Int)
fudgeDieRange = (-1, 1)


{- Roll groups of Fudge dice and produce an infinite list of results
-}
rolldFs :: RandomGen g => Int -> g -> [[Int]]
rolldFs = rollNs fudgeDieRange


{- Roll groups of Fudge dice and produce an infinite list of results
   summed and packed into trait Level datatypes
-}
rolldFSums :: RandomGen g => Int -> g -> [Int]
rolldFSums = rollSums fudgeDieRange
