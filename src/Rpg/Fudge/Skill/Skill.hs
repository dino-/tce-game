module Rpg.Fudge.Skill.Skill
   where

import Rpg.Fudge.Trait


data Skill = Skill
   { name :: String
   , displayName :: String
   , desc :: String
   , level :: Level
   } deriving Show
