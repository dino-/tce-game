module Rpg.Dice
   where

import System.Random ( Random, RandomGen, randomRs )


listOfListN :: Int -> [a] -> [[a]]
listOfListN n xs = f : listOfListN n b
   where (f, b) = splitAt n xs


rollNs :: (Num r, Random r, RandomGen g) => (r, r) -> Int -> g -> [[r]]
rollNs range numDice = (listOfListN numDice) . (randomRs range)


rollSums :: (Num r, Random r, RandomGen g) => (r, r) -> Int -> g -> [r]
rollSums range numDice = (map sum) . (rollNs range numDice)
