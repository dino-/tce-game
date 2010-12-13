import Control.Monad ( replicateM_ )
import System.Environment ( getArgs )
import System.Random ( newStdGen )
import Text.Printf ( printf )

import Rpg.Fudge.Dice ( rolldF )
import Rpg.Fudge.Trait ( Level (..), ldispL )


parseArgs :: [String] -> (Int, Int)
parseArgs []             = (1, 1)
parseArgs (dice:[])      = (read dice, 1)
parseArgs (dice:rolls:_) = (read dice, read rolls)


main :: IO ()
main = do
   args <- getArgs
   let (numDice, numRolls) = parseArgs args
   replicateM_ numRolls $ do
      rolls <- fmap (rolldF numDice) newStdGen
      let rollsLevel = Level . sum $ rolls

      printf "%-25s  %s\n" (ldispL rollsLevel) (show rolls)
