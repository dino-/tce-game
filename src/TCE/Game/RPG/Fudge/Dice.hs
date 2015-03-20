module TCE.Game.RPG.Fudge.Dice
   ( rolldFs, rolldFSums )
   where

import System.Random ( randoms )

import TCE.Game.Dice
import TCE.Game.RPG.Fudge.Trait


{- | Roll groups of Fudge dice and produce an infinite list of results
-}
rolldFs :: RandomGen g => Int -> g -> [[Level]]
rolldFs numDice = (listOfListN numDice) . randoms


{- | Roll groups of Fudge dice and produce an infinite list of
   summed results
-}
rolldFSums :: RandomGen g => Int -> g -> [Level]
rolldFSums numDice = (map sum) . rolldFs numDice
