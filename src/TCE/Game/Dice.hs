module TCE.Game.Dice
   ( listOfListN , rollNs , rollSums

   -- Re-exporting
   , RandomGen
   )
   where

import System.Random ( Random, RandomGen, randomRs )


{- | Partition a list into sub-lists of a specific length. Example:

   > listOfListN 2 [1,2,3,4,5,6...] -> [[1,2],[3,4],[5,6]...]
-}
listOfListN :: Int -> [a] -> [[a]]
listOfListN n xs = f : listOfListN n b
   where (f, b) = splitAt n xs


{- | Generate a finite list of random values across the specified range
-}
rollNs :: (Num r, Random r, RandomGen g) => (r, r) -> Int -> g -> [[r]]
rollNs range numDice = (listOfListN numDice) . (randomRs range)


{- | Generate a finite list of sums of some number of random values
   across the specified range
-}
rollSums :: (Num r, Random r, RandomGen g) => (r, r) -> Int -> g -> [r]
rollSums range numDice = (map sum) . (rollNs range numDice)
