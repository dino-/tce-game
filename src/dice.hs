import Control.Arrow ( (&&&), first )
import Control.Monad ( replicateM_ )
import Data.Char ( toLower )
import System.Environment ( getArgs )
import System.Random ( StdGen, newStdGen )
import Text.Printf ( printf )

import Rpg.Dice ( roll )
import Rpg.Fudge.Dice ( rolldF )
import Rpg.Fudge.Trait ( Level (..), ldispL )


parseArgList :: [String] -> (String, Int)
parseArgList []                = error "NO ARGUMENTS"
parseArgList (diceCmd:[])      = (map toLower diceCmd, 1)
parseArgList (diceCmd:rolls:_) = (map toLower diceCmd, read rolls)


parseDiceCmd :: String -> (Int, String)
parseDiceCmd = (first pf) . ((takeWhile p) &&& (tail . (dropWhile p)))
   where
      p = (/= 'd')

      pf "" = 1
      pf s  = read s


rollFunction :: String -> (Int -> StdGen -> [Int])
rollFunction "f"  = rolldF
rollFunction "%"  = roll (1, 100)
rollFunction "20" = roll (1, 20)
rollFunction "12" = roll (1, 12)
rollFunction "10" = roll (1, 10)
rollFunction "8"  = roll (1, 8)
rollFunction "6"  = roll (1, 6)
rollFunction "4"  = roll (1, 4)
rollFunction _    = error "NO DIE TYPE"


display :: String -> [Int] -> IO ()
display "f" rs = printf "%-25s  %s\n" (ldispL . Level . sum $ rs) (show rs)
display _   rs = printf "%3d  %s\n" (sum rs) (show rs)


main :: IO ()
main = do
   (diceCmd, numRolls) <- fmap parseArgList getArgs
   let (numDice, diceType) = parseDiceCmd diceCmd
   replicateM_ numRolls $ do
      rolls <- fmap (rollFunction diceType numDice) newStdGen
      display diceType rolls
