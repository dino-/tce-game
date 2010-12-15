module Rpg.Dice
   where

import System.Random


roll :: (Int, Int) -> Int -> StdGen -> [Int]
roll range numDice g = take numDice $ randomRs range g


rollSum :: (Int, Int) -> Int -> StdGen -> Int
rollSum range numDice g = sum $ roll range numDice g
