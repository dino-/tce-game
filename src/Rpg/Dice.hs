module Rpg.Dice
   where

import System.Random ( RandomGen, randomRs )


listOfListN :: Int -> [a] -> [[a]]
listOfListN n xs = f : listOfListN n b
   where (f, b) = splitAt n xs


rolls :: RandomGen g => (Int, Int) -> g -> [Int]
rolls = randomRs


rollNs :: RandomGen g => (Int, Int) -> Int -> g -> [[Int]]
rollNs range numDice = (listOfListN numDice) . (rolls range)


rollSums :: RandomGen g => (Int, Int) -> Int -> g -> [Int]
rollSums range numDice = (map sum) . (rollNs range numDice)
