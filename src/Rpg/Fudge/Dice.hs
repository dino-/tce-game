module Rpg.Fudge.Dice
   ( rolldFs, rolldFSums )
   where

import Rpg.Dice
import Rpg.Fudge.Trait
import System.Random ( RandomGen, randoms )


{- Roll groups of Fudge dice and produce an infinite list of results
-}
rolldFs :: RandomGen g => Int -> g -> [[Level]]
rolldFs numDice = (listOfListN numDice) . randoms


{- Roll groups of Fudge dice and produce an infinite list of results
   summed and packed into trait Level datatypes
-}
rolldFSums :: RandomGen g => Int -> g -> [Level]
rolldFSums numDice = (map sum) . rolldFs numDice
