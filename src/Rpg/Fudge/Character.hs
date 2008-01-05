module Rpg.Fudge.Character
   where

import Data.Map

import Rpg.Fudge.Skill


data Character = Character
   { displayName :: String
   , fullName :: String
   , health :: Int
   , skills :: Data.Map.Map String Skill
   }
   deriving Show
