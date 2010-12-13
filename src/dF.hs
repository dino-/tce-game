module Main
   where

import Control.Monad ( replicateM_ )
import System.Environment ( getArgs )
import System.Random ( newStdGen )
import Text.Printf ( printf )

import Rpg.Fudge.Dice ( rolldF )
import Rpg.Fudge.Trait ( Level (..) )


parseArgs :: [String] -> (Int, Int)
parseArgs (dice:[]) = (read dice, 1)
parseArgs (dice:rolls:_) = (read dice, read rolls)


main :: IO ()
main = do
   args <- getArgs
   let (numDice, numRolls) = parseArgs args
   replicateM_ numRolls $ do
      g <- newStdGen

      let rolls = rolldF numDice g
      let rollsSum = sum rolls
      let rollsLevel = Level rollsSum

      let levelSumString = printf "%s (%d)" (show rollsLevel) rollsSum
      printf "%-26s  %s\n" (levelSumString::String) (show rolls)
