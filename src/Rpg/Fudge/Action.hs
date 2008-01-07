module Rpg.Fudge.Action
   where

import qualified Data.Map as Map
import System.Random

import Rpg.Fudge.Character
import Rpg.Fudge.Dice
import Rpg.Fudge.Skill
import Rpg.Fudge.Trait


data Outcome = Outcome
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


resolveUnopAct :: Action -> Skill -> Character -> StdGen -> Outcome
resolveUnopAct act defSkill char g = Outcome (deg >= actDiff) deg
   where
      actDiff = difficulty act
      skill = Map.findWithDefault defSkill
         (skillName defSkill) (skills char)
      deg = (skillLevel skill) + (rolldFSum 4 g)
