module TCE.Game.RPG.Fudge.Character
   where

--import Data.Map

--import TCE.Game.RPG.Fudge.Skill
import TCE.Game.RPG.Fudge.Trait


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
   , charDamageCapacity :: Level
   --, charAttributes :: Map String Trait
   --, charSkills :: Map String Skill
   }
   deriving Show
