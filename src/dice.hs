import Control.Arrow ( (&&&), first )
import Data.Char ( toLower )
import System.Environment ( getArgs )
import System.Random ( RandomGen, newStdGen )
import Text.Printf ( printf )

import TCE.Game.Dice ( rollNs )
import TCE.Game.RPG.Fudge.Dice ( rolldFs )
import TCE.Game.RPG.Fudge.Trait ( Level (..), ldispLong )


usage :: String -> String
usage msg = init . unlines $
   [ msg
   , ""
   , "Usage: dice [<NUMDICE>]d<TYPE> [<NUMROLLS>]"
   , "Generate random dice rolls."
   , ""
   , "NUMDICE and NUMROLLS both default to 1 if not specified"
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
   , "Really, any positive number for type works here, not just 20, 12, 10... You'll get random values in the range of 1 to NUM. And the F can be lower-case for Fudge dice."
   , ""
   , "Output:  SUM  [INDIVIDUAL DIE VALUES]"
   , "  Note that Fudge output is also described using the standard Fudge scale:"
   , "    +4 Superb + 1"
   , "    +3 Superb"
   , "    +2 Great"
   , "    +1 Good"
   , "    +0 Fair"
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
parseArgList []             = error . usage $ "NO ARGUMENTS"
parseArgList (diceCmd:[])   = (map toLower diceCmd, 1)
parseArgList (diceCmd:rs:_) = (map toLower diceCmd, read rs)


parseDiceCmd :: String -> (Int, String)
parseDiceCmd = (first parseNumDice) .
   ((takeWhile pr) &&& (tailF . (dropWhile pr)))

   where
      pr = (/= 'd')

      parseNumDice "" = 1
      parseNumDice s  = read s

      tailF [] = error . usage $ "NO DIE TYPE"
      tailF t  = tail t


data Results
   = IntS   [Int]
   | LevelS [Level]

instance Show Results where
   show (IntS   rs) = printf "%3d  %s"   (sum rs) (show rs)
   show (LevelS rs) = printf "%-15s  %s" (ldispLong . sum $ rs)
      (show . map unLevel $ rs)


rollFunction :: RandomGen g => String -> Int -> g -> [Results]
rollFunction "f"   numDice = map LevelS . rolldFs numDice
rollFunction "%"   numDice = map IntS   . rollNs (1, 100) numDice
rollFunction sides numDice = map IntS   . rollNs (1, read sides) numDice


main :: IO ()
main = do
   (diceCmd, numRolls) <- fmap parseArgList getArgs
   let (numDice, diceType) = parseDiceCmd diceCmd

   rs <- fmap ((take numRolls) .
      (rollFunction diceType numDice)) newStdGen
   mapM_ print rs
