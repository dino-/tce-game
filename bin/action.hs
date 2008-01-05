#! /usr/bin/runhaskell -isrc

import qualified Data.Map as Map
import System.Random

import Rpg.Fudge.Action
import Rpg.Fudge.Character
import Rpg.Fudge.Skill
import Rpg.Fudge.Trait


-- Should this default to Terrible instead of Poor?
skSwordsmanship = Skill "Swordsmanship" "Swordsmanship" "foo" poor

skLockpicking = Skill "Lockpicking" "Lockpicking" "bar" poor


{-
charJoe = Character "Joe" 0 $ Map.fromList
   [(id defSkSwordsmanship, defSkSwordsmanship { level = good })]
-}
charJill = Character "Jill" "Jill" 0 $ Map.fromList
   [(name skLockpicking, skLockpicking { level = mediocre })]

actLock1 = Action "locked door 1" (name skLockpicking) good

main = do
   print charJill
   print actLock1
   g <- newStdGen
   let result = resolveUnopAct actLock1 skLockpicking charJill g
   print result
