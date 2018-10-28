#! /usr/bin/runhaskell -isrc

import qualified Data.Map as Map
import Data.Maybe ( fromJust )
import System.Random
import Text.Printf

import TCE.Game.RPG.Fudge.Action
import TCE.Game.RPG.Fudge.Trait


data Item
   = ProjWeap
      { pwName :: String
      }
   | Ammo
      { ammoName :: String
      , ammoWeaps :: String
      , ammoDmg :: Int
      }
   deriving Show


data Character = Character
   { charName :: String
   , charFullName :: String
   , charAttrs :: Map.Map String Level
   , charSkills :: Map.Map String Level
   , charScale :: Int
   , charDC :: Level  -- Damage Capacity
   , charEquip :: Map.Map String Item
   }
   deriving Show


defaultChar :: Character
defaultChar = Character
   { charName = ""
   , charFullName = ""
   , charAttrs = Map.empty
   , charSkills = Map.empty
   , charScale = 0
   , charDC = superb
   , charEquip = Map.empty
   }


lookupU k = fromJust . (Map.lookup k)


{-
charJoe = Character "Joe" 0 $ Map.fromList
   [(id defSkSwordsmanship, defSkSwordsmanship { level = good })]
-}

charJill = defaultChar
   { charName = "Jill"
   , charFullName = "Jill Valentine"
   , charAttrs = Map.fromList
      [ ("Strength", fair)
      , ("Constitution", good)
      , ("Dexterity", great)
      , ("Intelligence", good)
      , ("Perception", good)
      , ("Willpower", great)
      ]
   } 

charJane = defaultChar
   { charName = "Jane"
   , charFullName = "Jane"
   , charSkills = Map.fromList [("Lockpicking", mediocre)]
   }

diffLock = good

main = do
   g <- newStdGen

   print charJill
   let zombieDistance = fair
   printf "zombie distance: %s\n" (ldispShort zombieDistance)
   let result = resolveUnopAct fair zombieDistance g
   print result

   print charJane
   printf "lock difficulty: %s\n" (ldispShort diffLock)
   g <- newStdGen
   --let skill = fromJust . (Map.lookup "Lockpicking") $ charSkills charJane
   let skill = lookupU "Lockpicking" $ charSkills charJane
   let result = resolveUnopAct skill diffLock g
   print result
