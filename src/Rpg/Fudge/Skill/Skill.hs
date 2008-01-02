module Rpg.Fudge.Skill.Skill
   where

import Rpg.Fudge.Trait


data Skill = Skill
   { name :: String
   , displayName :: String
   , desc :: String
   , level :: Level
   } deriving Show


-- Should this default to Terrible instead of Poor?
skSwordsmanship = Skill "Swordsmanship" "Swordsmanship" "foo" poor

skLockpicking = Skill "Lockpicking" "Lockpicking" "bar" poor
