module Rpg.Dice
   where

import System.Random


roll :: StdGen -> Int -> (Int, Int) -> [Int]
roll g numDice range = take numDice $ randomRs range g


rollSum :: StdGen -> Int -> (Int, Int) -> Int
rollSum g numDice range = sum $ roll g numDice range
