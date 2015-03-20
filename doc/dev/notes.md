# Development notes


# 2015-02-25 Rewrite below here in Markdown:

-----
Fudge trait levels

 4 Legendary (Superb +1)
 3 Superb
 2 Great
 1 Good
 0 Fair
-1 Mediocre
-2 Poor
-3 Terrible
-4 Terrible -1

-----
Traits in Fudge

Trait
+-Attribute
+-Skill
+-Gift
+-Fault

(all of these things are traits)

-----
answering questions

 4 Legendary (Superb +1)
 3 Superb                   3 and above, exceptional yes
 2 Great
 1 Good                     1 and above, yes
 0 Fair                     0 marginal yes
-1 Mediocre                -1 and below, no
-2 Poor
-3 Terrible                -3 and below, exceptional no
-4 Terrible -1

-----
random events

4dF roll of >= +3Su : random event check, about 10% of the time
chaos: starts at +0Fa
4dF >= chaos : random event is occurring

-----
Fudging Mythic RPG - Odds Questions
Written by fudgebob dicepants
Saturday, 17 July 2010 05:04

http://fudgerpg.com/community/fudge-blogs/discovering-fudge/77-fudging-mythic-rpg-odds-questions.html

Mythic has a neat mechanic in resolving in-game questions which the GM has not prepared for or haven't even thought about.

Check out Mythic RPG at http://www.mythic.wordpr.com/page14/page14.html.

Here are my somewhat-simplified Fudge conversion:

1. Ask an in-game question, answerable by a YES or a NO.

2. Determine the Odds Modifiers:

Has to be      +3
A Sure Thing   +2
Likely         +1
50/50           0
Unlikely       -1
No Way         -2
Impossible     -3

3. To get the final answer, roll 4DF with modifiers:

    *   A Superb or higher is an EXCEPTIONAL YES.
    *   A Good to Great is a YES.
    *   A Fair can be MARGINAL YES, A YES with Complications, or Unresolved/Delayed answer (Pick only 1 for the session/campaign)
    *   A Mediocre to Poor is a NO.
    *   A Terrible or lower is an EXCEPTIONAL NO.

-----
other systems:
- Osprey (sucky?)
- WikiRPS
- Yags
- Alternate Realities

-----
Two categories:
- chracter description
- action resolution

-----
computer RPG games I admire
- TES (Daggerfall, Morrowind)
- Fallout (SPECIAL RPG system)
- Jagged Alliance (pre-2 system in particular)

-----
- Fading Suns RPG system similar to Fallout (VPS system)
- Savage Worlds
- Mutants and Masterminds
- Alternity
- RuneQuest has skill advancement. Very old system

-----
- Being able to roll action points to subsequent rounds a-la JA and Fallout
- Do want mental attributes (?)
- Differentiate between physical and mental attributes
- PCs, NPCs and monsters should use same creation mechanisms? This is NOT how D&D (d20, 3.xE) works.
- Exponential scales? This is how Fudge works. Hero does it with Strength
- Body used in Hero to 'counter-weight' Strength. What does this mean?
- Movement rate?
- Hexes or quads?
- Need initiative.

-----
Things I need in any game:

- time of day and time passage
- action points
   - Being able to roll action points forward to subsequent rounds
- movement rate
- skill and attribute advancement
   - What will be the mechanism we use to store training?
- must be able to save anywhere for any reason
- initiative

-----
What types of things can I borrow from some of these past games?

- Jagged Alliance
- Fallout
- TES
- Nethack

-----
Actions points from Fallout RPG

They're based on the Agility Statistic like this:

   Fallout Agility   #AP      Fudge Agility  #AP
         1            5       Superb          11
        2-3           6       Great           10
        4-5           7       Good             9
        6-7           8       Fair             8
        8-9           9       Mediocre         7
        10+          10       Poor             6
                              Terrible         5

   Or by formula: AP = Agility + 8

-----
Attributes in _Another Fine Mess_

all animals:
   Agility
   Perception (Wisdom)
   Strength
   Health (Endurance, Constitution)
   Willpower
   Wits (Intelligence)

individual animals' special attributes:

   owl         Wisdom: Fair
   racoon      Dexterity: Good
   mutt        Energy: Great
   bloodhound  Common Sense: Good
   horse       Alertness: Great
   falcon      Courage: Great
   ferret      Curiosity: Great
   cat         Dignity: Good

-----
Attributes for my thing:

* Agility (Dexterity?)
     I will use for: Action Points
     Would this be the same as Dexterity for my purposes?
* Perception (Wisdom?)
     I will use for: initiative?, ranged weapon distance?,
        noticing things or awareness
* Strength
     I will use for: melee damage, hit points?, carry weight
* Health (Endurance, Constitution)
     I will use for: hit points? base damage capacity?
  Willpower
* Wits (Intelligence?)
     I will use for: advancement rate adjustment?

-----
health and wound tracking
This is showing two different methods of wound tracking. One is with the masks representing successive damagings. The other is using a DC attribute (or secondary attribute, whatever it's called)

                                 DC (using this kind of like hit points)
               mask  mod   dmg
--              000    0   --    Superb* (default? Not damaged?)
Scratch1        001    0   1,2   Great
Scratch2        010    0   1,2   Good
Scratch3        011    0   1,2   Fair
Hurt            100   -1   3,4   Mediocre
Very Hurt       101   -2   5,6   Poor
Incapacitated   110   --   7,8   Terrible (mod -3 ?)
Near Death      111   --    9+   Terrible - 1

- Relative degree of +1 is a graze
- 0 or less, no damage
- If using DC method:
   - scratch damage does not reduce DC
   - don't use it to calculate wound severity
