#! /usr/bin/runhaskell -isrc

import qualified Data.Map as Map
import System.Random

import Rpg.Fudge.Action
import Rpg.Fudge.Character
import Rpg.Fudge.Skill
import Rpg.Fudge.Trait


-- Should this default to Terrible instead of Poor?
skSwordsmanship = Skill "Swordsmanship" "foo" poor hard

skLockpicking = Skill
   { skillName = "Lockpicking"
   , skillDesc = "bar"
   , skillLevel = poor
   , trainLevel = average
   }


{-
charJoe = Character "Joe" 0 $ Map.fromList
   [(id defSkSwordsmanship, defSkSwordsmanship { level = good })]
-}
charJill = Character "Jill" "Jill" 0 $ Map.fromList
   [(skillName skLockpicking, skLockpicking { skillLevel = mediocre })]

actLock1 = Action "locked door 1" (skillName skLockpicking) good

main = do
   print charJill
   print actLock1
   g <- newStdGen
   let result = resolveUnopAct actLock1 skLockpicking charJill g
   print result
