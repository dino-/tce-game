module TCE.Game.RPG.Fudge.Action
   where

import System.Random

import TCE.Game.RPG.Fudge.Dice
import TCE.Game.RPG.Fudge.Trait


resolveUnopAct :: RandomGen g => Level -> Level -> g -> (Bool, Level)
resolveUnopAct skill difficulty g =
   ((rolledDegree >= difficulty), rolledDegree - difficulty)

   where
      roll = head . (rolldFSums 4) $ g
      rolledDegree = skill + roll


resolveOppAct :: RandomGen g => Level -> Level -> g -> (Bool, Level)
resolveOppAct offensiveFactor defensiveFactor g =
   ((offensiveRoll >= defensiveRoll), offensiveRoll - defensiveRoll)

   where
      (or' : dr : _) = (take 2) . (rolldFSums 4) $ g
      offensiveRoll = offensiveFactor + or'
      defensiveRoll = defensiveFactor + dr
