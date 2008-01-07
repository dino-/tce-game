module Rpg.Fudge.Skill
   where

import Rpg.Fudge.Trait


data Skill = Skill
   { skillName :: String
   , skillDesc :: String
   , skillLevel :: Level
   , trainLevel :: Level
   }
   deriving Show


veryEasy, easy, average, hard, veryHard :: Level
veryEasy = Level (-2)
easy     = Level (-1)
average  = Level   0
hard     = Level   1
veryHard = Level   2


{- Calculate the multipler for assessing an advancement in a specific 
   skill. This depends on the train difficulty of the skill.
-}
skillAdvDiff :: Skill -> Int
skillAdvDiff s = skillAdvDiff' (trainLevel s) (skillLevel s)

skillAdvDiff' :: Level -> Level -> Int
skillAdvDiff' (Level difficulty) (Level trait)
   | adjusted < 0     = 2 ^ 0  -- All of these eval to 1
   | otherwise = 2 ^ (adjusted + 1)
   where adjusted = trait + difficulty
