import Control.Arrow ( (&&&), first )
import Control.Monad ( replicateM_ )
import Data.Char ( toLower )
import System.Environment ( getArgs )
import System.Random ( StdGen, newStdGen )
import Text.Printf ( printf )

import Rpg.Dice ( roll )
import Rpg.Fudge.Dice ( rolldF )
import Rpg.Fudge.Trait ( Level (..), ldispL )


usage :: String -> String
usage msg = init . unlines $
   [ msg
   , ""
   , "Usage: dice [<NUMDICE>]d<TYPE> [<NUMROLLS>]"
   , "Generate random dice rolls."
   , ""
   , "NUMDICE defaults to 1 if not specified"
   , ""
   , "Types:"
   , "  20 - 20 sided die"
   , "  12 - 12 sided die"
   , "  10 - 10 sided die"
   , "   8 -  8 sided die"
   , "   6 -  6 sided die"
   , "   4 -  4 sided die"
   , "   % - percentile (value between 1 and 100)"
   , "   F - Fudge die (value of -1, 0 or 1)"
   , ""
   , "Output:  SUM  [INDIVIDUAL DIE VALUES]"
   , "  Note that Fudge output is also annoted with the standard Fudge scale:"
   , "     4 Legendary (Superb + 1)"
   , "     3 Superb"
   , "     2 Great"
   , "     1 Good"
   , "     0 Fair"
   , "    -1 Mediocre"
   , "    -2 Poor"
   , "    -3 Terrible"
   , "    -4 Terrible - 1"
   , ""
   , "Examples:"
   , "  dice d20  =>  11  [11]"
   , "  dice 3d6  =>  13  [2,5,6]"
   , "  dice 2d%  =>  114  [44,70]"
   , "  dice 4dF  =>  +1 Good  [0,-1,1,1]"
   ]


parseArgList :: [String] -> (String, Int)
parseArgList []                = error . usage $ "NO ARGUMENTS"
parseArgList (diceCmd:[])      = (map toLower diceCmd, 1)
parseArgList (diceCmd:rolls:_) = (map toLower diceCmd, read rolls)


parseDiceCmd :: String -> (Int, String)
parseDiceCmd = (first parseNumDice) .
   ((takeWhile pr) &&& (tailF . (dropWhile pr)))

   where
      pr = (/= 'd')

      parseNumDice "" = 1
      parseNumDice s  = read s

      tailF [] = error . usage $ "NO DIE TYPE"
      tailF t  = tail t


rollFunction :: String -> (Int -> StdGen -> [Int])
rollFunction "f"  = rolldF
rollFunction "%"  = roll (1, 100)
rollFunction "20" = roll (1, 20)
rollFunction "12" = roll (1, 12)
rollFunction "10" = roll (1, 10)
rollFunction "8"  = roll (1, 8)
rollFunction "6"  = roll (1, 6)
rollFunction "4"  = roll (1, 4)
rollFunction _    = error . usage $ "UNKNOWN DIE TYPE"


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
