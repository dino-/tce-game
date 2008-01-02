#! /usr/bin/runhaskell

import qualified Data.Map as Map
import System.Random

import Rpg.Fudge.Dice
import Rpg.Fudge.Skill.Skill as Skill
import Rpg.Fudge.Trait


data Result = Result
   { succeeded :: Bool
   , degree :: Level
   }
   deriving Show


data Action = Action
   { desc :: String
   , relatedSkill :: String
   , difficulty :: Level
   }
   deriving Show


data Character = Character
   { displayName :: String
   , fullName :: String
   , health :: Int
   , skills :: Map.Map String Skill
   }
   deriving Show


resolveUnopAct :: Action -> Character -> StdGen -> Result
resolveUnopAct act char g = Result (deg >= actDiff) deg
   where
      actDiff = difficulty act
      skill = Map.findWithDefault skLockpicking
         (Skill.name skLockpicking) (skills char)
      deg = (level skill) + (roll4dF g)


{-
charJoe = Character "Joe" 0 $ Map.fromList
   [(id defSkSwordsmanship, defSkSwordsmanship { level = good })]
-}
charJill = Character "Jill" "Jill" 0 $ Map.fromList
   [(Skill.name skLockpicking, skLockpicking { level = mediocre })]

actLock1 = Action "locked door 1" (Skill.name skLockpicking) good

main = do
   print charJill
   print actLock1
   g <- newStdGen
   let result = resolveUnopAct actLock1 charJill g
   print result
