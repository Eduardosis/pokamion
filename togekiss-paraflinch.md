# 2v2 Togekiss Paraflinch & Omniboost Battle Script

This document provides the script to initiate a special 2v2 wild battle against two Togekiss. The script is designed to be placed in an event command and utilizes the mid-battle scripting features to create a unique challenge.

The Togekiss will employ a "paraflinch" strategy and are guaranteed to receive all-stat boosts when they use the move Ancient Power.

## Event Script

To use this, copy and paste the following code into a `Script` event command in your game.

```ruby
#===============================================================================
# 2v2 Togekiss Paraflinch & Omniboost Battle
#
# To use this script, call it from an event using a Script command.
# This script creates a 2v2 battle against two wild Togekiss which will
# attempt to use a paralysis + flinch strategy, and will gain an
# omniboost from Ancient Power.
#===============================================================================

# --- Battle Rules ---
# Set the battle to be a 2v2 battle.
setBattleRule("size", "2v2")

# --- Mid-Battle Script Definition ---
# This script controls the special mechanics of the battle.
# We define it in a hash as per the mid-battle scripting documentation.
TOGEKISS_HAX_SCRIPT = {
  # At the start of the first round, one of the Togekiss says a line.
  "RoundStartCommand_1_foe1" => {
    "speech" => "Let's see if you can handle our combination!"
  },

  # This trigger fires every time an opposing Togekiss deals damage with Ancient Power.
  # It then forces the omniboost effect that Ancient Power sometimes grants.
  "UserDealtDamage_ANCIENTPOWER_foe_repeat" => {
    "speech"       => [:Self, "{1} is glowing with a mysterious power!"],
    "playAnim"     => "StatUp",
    "battlerStats" => [
      :ATTACK, 1, 
      :DEFENSE, 1, 
      :SPECIAL_ATTACK, 1, 
      :SPECIAL_DEFENSE, 1, 
      :SPEED, 1
    ]
  },

  # --- Paraflinch AI for the two Togekiss ---
  # The two Togekiss will attempt their strategy by focusing on one of the
  # player's Pokemon each and alternating between paralyzing and flinching moves.

  # Togekiss 1 (at index 1) focuses on the player's Pokemon at index 0.
  "TurnStart_foe1_repeat_odd" => {
    "useMove" => [:THUNDERWAVE, 0] # Use Thunder Wave on odd turns
  },
  "TurnStart_foe1_repeat_even" => {
    "useMove" => [:AIRSLASH, 0]    # Use Air Slash on even turns
  },

  # Togekiss 2 (at index 3) focuses on the player's Pokemon at index 2.
  "TurnStart_foe2_repeat_odd" => {
    "useMove" => [:THUNDERWAVE, 2] # Use Thunder Wave on odd turns
  },
  "TurnStart_foe2_repeat_even" => {
    "useMove" => [:AIRSLASH, 2]    # Use Air Slash on even turns
  }
}

# Set the mid-battle script for the upcoming battle.
setBattleRule("midbattleScript", TOGEKISS_HAX_SCRIPT)


# --- Wild Pokemon Definition ---
# Define the two wild Togekiss that the player will face.
# Both have Serene Grace to double the chance of secondary effects (flinch).
# Their movesets are built for the para-flinch strategy and the omniboost.
def create_hax_togekiss
  pkmn = Pokemon.new(:TOGEKISS, 50)
  pkmn.ability = :SERENEGRACE
  pkmn.moveset = [
    GameData::Move.get(:AIRSLASH),
    GameData::Move.get(:THUNDERWAVE),
    GameData::Move.get(:ANCIENTPOWER),
    GameData::Move.get(:AURASPHERE)
  ]
  pkmn.calc_stats
  return pkmn
end

pkmn1 = create_hax_togekiss
pkmn2 = create_hax_togekiss

# --- Start the Battle ---
# This initiates a 2v2 wild battle against the two defined Togekiss.
# The battle will use the rules and scripts defined above.
WildBattle.start(pkmn1, pkmn2)
```

## How It Works

This script leverages several features from the mid-battle scripting documentation:

1.  **`setBattleRule("size", "2v2")`**: This establishes the battle as a double battle.
2.  **`setBattleRule("midbattleScript", ...)`**: This applies our custom script hash to the battle.
3.  **`RoundStartCommand_1_foe1`**: A trigger that makes an opposing trainer (or in this case, the wild Pokémon's "will") speak at the beginning of the first turn.
4.  **`UserDealtDamage_ANCIENTPOWER_foe_repeat`**: This trigger activates every time either of the opposing Togekiss successfully deals damage with `ANCIENTPOWER`.
    - **`"battlerStats"`**: This command key is used to forcibly raise all of the user's stats by one stage, guaranteeing the "omniboost".
    - **`"speech"`** and **`"playAnim"`**: These add flavor, announcing the boost and showing the stat-up animation.
5.  **`TurnStart_foe...` Triggers**: These triggers give the Togekiss their AI.
    - By using `_foe1` and `_foe2`, we can give separate commands to each of the opposing Pokémon.
    - By using `_repeat_odd` and `_repeat_even`, we make them alternate moves each turn.
    - **`"useMove"`**: This command key forces the Pokémon to use a specific move on a specific target, which is how we direct their paraflinch strategy. Each Togekiss focuses on one of the player's Pokémon, alternating between `THUNDERWAVE` to paralyze and `AIRSLASH` to cause flinching.
