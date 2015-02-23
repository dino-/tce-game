module Rpg.Fudge.Character
   where

--import Data.Map

--import Rpg.Fudge.Skill
import Rpg.Fudge.Trait


{-
data Character = Character
   { displayName :: String
   , fullName :: String
   , health :: Int
   , skills :: Data.Map.Map String Skill
   }
   deriving Show
-}

data Character = Character
   { charDisplayName :: String
   , charFullName :: String
   , charScale :: Int
   , charDamageCapacity :: Trait
   --, charAttributes :: Map String Trait
   --, charSkills :: Map String Skill
   }
   deriving Show
