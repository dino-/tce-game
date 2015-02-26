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
veryEasy = poor
easy     = mediocre
average  = fair
hard     = good
veryHard = great


{- Calculate the multipler for assessing an advancement in a specific 
   skill. This depends on the train difficulty of the skill.
-}
skillAdvDiff :: Skill -> Level
skillAdvDiff s = skillAdvDiff' (trainLevel s) (skillLevel s)

skillAdvDiff' :: Level -> Level -> Level
skillAdvDiff' difficulty trait
   | adjusted < fair = good  -- All of these eval to Level 1
   | otherwise = Level $ 2 ^ ((unLevel adjusted) + 1)
   where adjusted = difficulty + trait
