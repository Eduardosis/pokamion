# Mid-Battle Scripting

The Deluxe Battle Kit allows you to create special scripts that will run during battle to create custom scenarios. This can be used to display trainer speech during battle, change the battle music, make an animation play, edit the attributes of a battler or the battlefield, and so much more. What you can accomplish with this is only limited by your imagination.

To set up a midbattle script, you must use the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule. This is a special rule that wasn't covered in the "Deluxe Battle Rules" section above, as it requires its own section to go over all the ways in which it may be used and set up.

This rule is entered as `setBattleRule("midbattleScript", Script)`, where "Script" can be a hash which contains a series of Trigger Keys.&#x20;

Refer to the "Trigger Keys" section for more details.

# Trigger Keys

The primary way of setting up a midbattle script is by entering a hash which contains a series of keys and values. Each key corresponds to a specific point in battle where you want something to trigger. Because of this, I'm going to refer to this set of keys as "Trigger Keys." In the following subsections, I will go over every possible Trigger Key, how they can be set, and at what specific point in battle they activate. Trigger Keys which activate under similar points in battle have been grouped together to make them easier to find.

Note that Trigger Keys are always strings, and always begin with an upper case letter.
# Triggers: Round Phases

These are keys which trigger during certain phases of a battle round.

* <mark style="background-color:purple;">**"RoundStartCommand"**</mark>\
  Triggers at the start of the Command Phase, before any inputs or decisions are made.\\

* <mark style="background-color:purple;">**"RoundStartAttack"**</mark>\
  Triggers at the start of the Attack Phase, after all selections have been made, but prior to any of them executing.\\

* <mark style="background-color:purple;">**"RoundEnd"**</mark>\
  Triggers at the very end of a round, after everything has concluded, but before the next Command Phase begins.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a number to specify a turn that they should trigger on. For example, <mark style="background-color:purple;">"RoundStartCommand\_2"</mark> would trigger only on the second turn.

Note that these particular triggers will always require an extension to indicate who to trigger them on. For more details, check out the "Extensions: User" section.
{% endhint %}
# Triggers: Battler Turns

These are keys which trigger during a specific battler's turn.

* <mark style="background-color:purple;">**"TurnStart"**</mark>\
  Triggers at the start of a battler's turn, before any of the commands entered for that battler's turn are executed.\\

* <mark style="background-color:purple;">**"TurnEnd"**</mark>\
  Triggers at the end of a battler's turn, after all of its commands have been executed.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a number to specify a turn that they should trigger on. For example, <mark style="background-color:purple;">"TurnEnd\_4"</mark> would trigger only on the battler's fourth turn. You may also extend these keys with a species or type ID so that they may only trigger during the turn of a specific species or a species of a specific type. For example, <mark style="background-color:purple;">"TurnStart\_CUBONE"</mark> would only trigger at the start of a Cubone's turn, while <mark style="background-color:purple;">"TurnEnd\_ROCK"</mark> would only trigger at the end of a Rock-type's turn.
{% endhint %}
# Triggers: Item Usage

These are keys which trigger upon a trainer using an item from their inventory.

* <mark style="background-color:purple;">**"BeforeItemUse"**</mark>\
  Triggers when a trainer chooses to use an item, but before the effects of that item are actually executed.\\

* <mark style="background-color:purple;">**"AfterItemUse"**</mark>\
  Triggers after the effects of a trainer's used item are executed.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with an item ID to specify that they should only trigger when a specific item is used. For example, <mark style="background-color:purple;">"BeforeItemUse\_POTION"</mark> would trigger only when a trainer is about to use a Potion.
{% endhint %}
# Triggers: Wild Capture

These are keys which trigger upon the player throwing a Poke Ball in a wild battle.

* <mark style="background-color:purple;">**"BeforeCapture"**</mark>\
  Triggers when the player is chooses to throw a Poke Ball, but before the ball is actually thrown.\\

* <mark style="background-color:purple;">**"AfterCapture"**</mark>\
  Triggers after the player threw a Poke Ball and it successfully captured the target Pokemon.\\

* <mark style="background-color:purple;">**"FailedCapture"**</mark>\
  Triggers after the player threw a Poke Ball and it failed to capture the target Pokemon.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID or a type ID to specify that they should only trigger when capturing a specific species, or species of a specific type. For example, <mark style="background-color:purple;">"AfterCapture\_PIKACHU"</mark> would trigger only when capturing a wild Pikachu, where <mark style="background-color:purple;">"FailedCapture\_ELECTRIC"</mark> would trigger only when you failed to capture any wild Electric-type.
{% endhint %}
# Triggers: Switching

These are keys which trigger upon a trainer withdrawing or sending out a new Pokemon.

* <mark style="background-color:purple;">**"BeforeSwitchOut"**</mark>\
  Triggers when a trainer chooses to manually switch out an active Pokemon, but before that Pokemon is actually recalled.\\

* <mark style="background-color:purple;">**"BeforeSwitchIn"**</mark>\
  Triggers when a trainer sends out a new Pokemon, but before that Pokemon actually enters the field.\\

* <mark style="background-color:purple;">**"BeforeLastSwitchIn"**</mark>\
  Triggers when a trainer is about to send out the last remaining Pokemon in reserve, but before that Pokemon actually enters the field. If there are multiple trainers on a side, this only counts the last remaining Pokemon for that *side*, not any particular trainer.\\

* <mark style="background-color:purple;">**"AfterSwitchIn"**</mark>\
  Triggers after a trainer has successfully sent out a new Pokemon.\\

* <mark style="background-color:purple;">**"AfterLastSwitchIn"**</mark>\
  Triggers after a trainer has successfully sent out the last remaining Pokemon in reserve. If there are multiple trainers on a side, this only counts the last remaining Pokemon for that *side*, not any particular trainer.\\

* <mark style="background-color:purple;">**"AfterSendOut"**</mark>\
  This is identical to <mark style="background-color:purple;">"AfterSwitchIn"</mark>, except this will trigger whenever a Pokemon is sent out, and not specifically when sent out due to a switch (for example, when sending out the lead Pokemon at the start of battle).\\

* <mark style="background-color:purple;">**"AfterLastSendOut"**</mark>\
  This is identical to <mark style="background-color:purple;">"AfterLastSwitchIn"</mark>, except this will trigger whenever a trainer sends out the last remaining Pokemon in reserve, and not specifically when sent out due to a switch (for example, when sending out the lead Pokemon at the start of battle). If there are multiple trainers on a side, this only counts the last remaining Pokemon for that *side*, not any particular trainer.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID or a type ID to specify that they should only trigger when switching a specific species, or species of a specific type. For example, <mark style="background-color:purple;">"BeforeSwitchOut\_MEOWTH"</mark> would trigger only before switching out an active Meowth, where <mark style="background-color:purple;">"AfterSwitchIn\_DARK"</mark> would trigger only after sending out a Dark-type.
{% endhint %}
# Triggers: Megas & Primals

These are keys which trigger upon a battler utilizing Mega Evolution or Primal Reversion.

* <mark style="background-color:purple;">**"BeforeMegaEvolution"**</mark>\
  Triggers when a battler is going to Mega Evolve this turn, but before that Pokemon actually Mega Evolves.\\

* <mark style="background-color:purple;">**"AfterMegaEvolution"**</mark>\
  Triggers after a battler successfully Mega Evolves.\\

* <mark style="background-color:purple;">**"BeforePrimalReversion"**</mark>\
  Triggers when a battler is going to Primal Revert, but before that Pokemon actually undergoes Primal Reversion.\\

* <mark style="background-color:purple;">**"AfterPrimalReversion"**</mark>\
  Triggers when a battler successfully completes its Primal Reversion.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID or a type ID to specify that they should only trigger when Mega Evolving or Primal Reverting a specific species, or species of a specific type. For example, <mark style="background-color:purple;">"BeforeMegaEvolution\_MAWILE"</mark> would trigger only when a Mawile is about to Mega Evolve, where <mark style="background-color:purple;">"AfterPrimalReversion\_WATER"</mark> would trigger only after a Water-type has Primal Reverted.
{% endhint %}
# Triggers: Megas & Primals

These are keys which trigger upon a battler utilizing Mega Evolution or Primal Reversion.

* <mark style="background-color:purple;">**"BeforeMegaEvolution"**</mark>\
  Triggers when a battler is going to Mega Evolve this turn, but before that Pokemon actually Mega Evolves.\\

* <mark style="background-color:purple;">**"AfterMegaEvolution"**</mark>\
  Triggers after a battler successfully Mega Evolves.\\

* <mark style="background-color:purple;">**"BeforePrimalReversion"**</mark>\
  Triggers when a battler is going to Primal Revert, but before that Pokemon actually undergoes Primal Reversion.\\

* <mark style="background-color:purple;">**"AfterPrimalReversion"**</mark>\
  Triggers when a battler successfully completes its Primal Reversion.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID or a type ID to specify that they should only trigger when Mega Evolving or Primal Reverting a specific species, or species of a specific type. For example, <mark style="background-color:purple;">"BeforeMegaEvolution\_MAWILE"</mark> would trigger only when a Mawile is about to Mega Evolve, where <mark style="background-color:purple;">"AfterPrimalReversion\_WATER"</mark> would trigger only after a Water-type has Primal Reverted.
{% endhint %}
# Triggers: Damage Results

These are keys which trigger after the results of a used damage-dealing move has been calculated.

* <mark style="background-color:purple;">**"UserDealtDamage"**</mark>\
  Triggers when the result of the user's move is that it dealt damage to the target.\\

* <mark style="background-color:purple;">**"UserDamagedSub"**</mark>\
  Triggers when the result of the user's move is that it damaged the target's Substitute, but didn't break it.\\

* <mark style="background-color:purple;">**"UserBrokeSub"**</mark>\
  Triggers when the result of the user's move is that it broke the target's Substitute.\\

* <mark style="background-color:purple;">**"UserDealtCriticalHit"**</mark>\
  Triggers when the result of the user's move is that it landed a critical hit.\\

* <mark style="background-color:purple;">**"UserMoveEffective"**</mark>\
  Triggers when the result of the user's move is that it landed a Super Effective hit.\\

* <mark style="background-color:purple;">**"UserMoveResisted"**</mark>\
  Triggers when the result of the user's move is that it landed a Not Very Effective hit.\\

* <mark style="background-color:purple;">**"UserMoveNegated"**</mark>\
  Triggers when the result of the user's move is that it was completely negated by the target (type immunity, Protect, etc.)\\

* <mark style="background-color:purple;">**"UserMoveDodged"**</mark>\
  Triggers when the result of the user's move is that it missed the target.\\

* <mark style="background-color:purple;">**"UserHPHalf"**</mark>\
  Triggers when the user of the move has 50% or less of their total HP remaining after their move is executed.\\

* <mark style="background-color:purple;">**"UserHPLow"**</mark>\
  Triggers when the user of the move has 25% or less of their total HP remaining after their move is executed.\\

* <mark style="background-color:purple;">**"LastUserHPHalf"**</mark>\
  Triggers when the user of the move has no remaining ally Pokemon in reserve on their side, and it has 50% or less of its total HP remaining after its move is executed.\\

* <mark style="background-color:purple;">**"LastUserHPLow"**</mark>\
  Triggers when the user of the move has no remaining ally Pokemon in reserve on their side, and it has 25% or less of its total HP remaining after its move is executed.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID, move ID or type ID to specify that they should only trigger when the user is of a specific species, used a specific move, or used a specific type of move. For example, <mark style="background-color:purple;">"UserDealtDamage\_SCYTHER"</mark> would trigger only when a Scyther was the user of a move that dealt damage, where <mark style="background-color:purple;">"UserMoveEffective\_EMBER"</mark> would trigger only when the user's Ember attack dealt Super Effective damage, and <mark style="background-color:purple;">"UserMoveNegated\_GHOST"</mark> would trigger only when the user's Ghost-type move was ineffective on its target.
{% endhint %}

* <mark style="background-color:purple;">**"TargetTookDamage"**</mark>\
  Triggers when the target took damage as a result of a used move.\\

* <mark style="background-color:purple;">**"TargetSubDamaged"**</mark>\
  Triggers when the target's Substitute was damaged as a result of a used move, but it didn't break.\\

* <mark style="background-color:purple;">**"TargetSubBroken"**</mark>\
  Triggers when the target's Substitute was broken as a result of a used move.\\

* <mark style="background-color:purple;">**"TargetTookCriticalHit"**</mark>\
  Triggers when the target suffered a critical hit as a result of a used move.\\

* <mark style="background-color:purple;">**"TargetWeakToMove"**</mark>\
  Triggers when the target suffered a Super Effective hit as a result of a used move.\\

* <mark style="background-color:purple;">**"TargetResistedMove"**</mark>\
  Triggers when the target suffered a Not Very Effective hit as a result of a used move.\\

* <mark style="background-color:purple;">**"TargetNegatedMove"**</mark>\
  Triggers when the target completely negated a used move, resulting in no damage taken (type immunity, Protect, etc.)\\

* <mark style="background-color:purple;">**"TargetDodgedMove"**</mark>\
  Triggers when the target evaded a used move, resulting in a miss.\\

* <mark style="background-color:purple;">**"TargetHPHalf"**</mark>\
  Triggers when the target has 50% or less of their total HP remaining after being hit by a move.\\

* <mark style="background-color:purple;">**"TargetHPLow"**</mark>\
  Triggers when the target has 25% or less of their total HP remaining after being hit by a move.\\

* <mark style="background-color:purple;">**"LastTargetHPHalf"**</mark>\
  Triggers when the target has no remaining ally Pokemon in reserve on their side, and it has 50% or less of its total HP remaining after being hit by a move.\\

* <mark style="background-color:purple;">**"LastTargetHPLow"**</mark>\
  Triggers when the target has no remaining ally Pokemon in reserve on their side, and it has 25% or less of its total HP remaining after being hit by a move.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a species ID, move ID or type ID to specify that they should only trigger when the target is of a specific species, was targeted by a specific move, or targeted by a specific type of move. For example, <mark style="background-color:purple;">"TargetDodgedMove\_NINJASK"</mark> would trigger only when a Ninjask evaded a move it was targeted with, where <mark style="background-color:purple;">"TargetResistedMove\_WATERGUN"</mark> would trigger only when the target resisted the move Water Gun, and <mark style="background-color:purple;">"TargetTookCriticalHit\_GRASS"</mark> would trigger only when the target suffered a critical hit from a Grass-type move.
{% endhint %}
# Triggers: Battler Condition

These are keys which trigger upon the battler undergoing some kind of change to its condition.

* <mark style="background-color:purple;">**"BattlerHPRecovered"**</mark>\
  Triggers whenever a battler recovers HP for any reason.\\

* <mark style="background-color:purple;">**"BattlerHPFull"**</mark>\
  Triggers whenever a battler recovers HP for any reason and it results in its HP being restored to full.\\

* <mark style="background-color:purple;">**"BattlerHPReduced"**</mark>\
  Triggers whenever a battler's HP is reduced for any reason.\\

* <mark style="background-color:purple;">**"BattlerHPCritical"**</mark>\
  Triggers whenever a battler's HP is reduced for any reason and it results in its HP falling to critically low levels (<= 25% of max HP).\\

* <mark style="background-color:purple;">**"BattlerFainted"**</mark>\
  Triggers upon a battler's HP falling to zero and fainting.\\

* <mark style="background-color:purple;">**"LastBattlerFainted"**</mark>\
  Triggers upon the last remaining Pokemon on a side falling to zero HP and fainting.\\

* <mark style="background-color:purple;">**"BattlerReachedHPCap"**</mark>\
  Triggers upon a battler's HP reaching a specific threshold where it cannot fall any lower.\\

* <mark style="background-color:purple;">**"BattlerStatusChange"**</mark>\
  Triggers upon a battler being inflicted with a status condition.\\

* <mark style="background-color:purple;">**"BattlerStatusCured"**</mark>\
  Triggers upon a battler's status condition returning to normal.\\

* <mark style="background-color:purple;">**"BattlerConfusionStart"**</mark>\
  Triggers upon a battler being inflicted with confusion.\\

* <mark style="background-color:purple;">**"BattlerConfusionEnd"**</mark>\
  Triggers upon a battler snapping out of confusion.\\

* <mark style="background-color:purple;">**"BattlerAttractStart"**</mark>\
  Triggers upon a battler becoming infatuated with another Pokemon.\\

* <mark style="background-color:purple;">**"BattlerAttractEnd"**</mark>\
  Triggers upon a battler shaking off its infatuation.\\

* <mark style="background-color:purple;">**"BattlerStatRaised"**</mark>\
  Triggers upon a battler's stats being raised by a number of stages.\\

* <mark style="background-color:purple;">**"BattlerStatLowered"**</mark>\
  Triggers upon a battler's stats being lowered by a number of stages.\\

* <mark style="background-color:purple;">**"BattlerMoveZeroPP"**</mark>\
  Triggers upon one of a battler's moves falling to zero PP either through using the move, or having it reduced by an effect.

{% hint style="info" %}
Trigger Extensions 1: You may extend these keys with a species ID to specify when a battler of a specific species suffers from one of these conditions. For example, <mark style="background-color:purple;">"BattlerFainted\_PIDGEY"</mark> would trigger only when a Pidgey fainted.&#x20;
{% endhint %}

{% hint style="info" %}
Trigger Extensions 2: For all keys related to HP or fainting, you may also use a type ID to specify a species of a specific type. For example, <mark style="background-color:purple;">"BattlerHPCritical\_NORMAL"</mark> would trigger only when a Normal-type's HP falls to critical levels.
{% endhint %}

{% hint style="info" %}
Trigger Extensions 3: For the <mark style="background-color:purple;">"BattlerStatusChange"</mark> key specifically, you may also use a status ID to specify when a specific status condition is inflicted. For example, <mark style="background-color:purple;">"BattlerStatusChange\_BURN"</mark> would trigger only when a battler is inflicted with a Burn.&#x20;
{% endhint %}

{% hint style="info" %}
Trigger Extensions 4: For the <mark style="background-color:purple;">"BattlerStatRaised"</mark> and <mark style="background-color:purple;">"BattlerStatLowered"</mark> keys specifically, you may also use a stat ID to specify a specific stat that was raised or lowered, respectively. For example, <mark style="background-color:purple;">"BattlerStatRaised\_ATTACK"</mark> would trigger only when a battler's Attack stat has been raised.
{% endhint %}

{% hint style="info" %}
Trigger Extensions 5: For the <mark style="background-color:purple;">"BattlerMoveZeroPP"</mark> key specifically, you may also use a move ID or type ID to specify when a specific move or move of a specific type runs out of PP. For example, <mark style="background-color:purple;">"BattlerMoveZeroPP\_HYPERBEAM"</mark> would trigger only when a battler's Hyper Beam runs out of PP, where <mark style="background-color:purple;">"BattlerMoveZeroPP\_ICE"</mark> would trigger only when a battler's Ice-type move runs out of PP.
{% endhint %}
# Triggers: End of Effects

These are keys which trigger after some kind of battle effect has ended.

* <mark style="background-color:purple;">**"WeatherEnded"**</mark>\
  Triggers upon a weather condition ending.\\

* <mark style="background-color:purple;">**"TerrainEnded"**</mark>\
  Triggers upon a battle terrain condition ending.\\

* <mark style="background-color:purple;">**"FieldEffectEnded"**</mark>\
  Triggers upon a field effect ending, such as Trick Room or Gravity.\\

* <mark style="background-color:purple;">**"TeamEffectEnded"**</mark>\
  Triggers upon a team effect ending, such as Reflect or Light Screen.\\

* <mark style="background-color:purple;">**"BattlerEffectEnded"**</mark>\
  Triggers upon a battler effect ending, such as Disable or Encore.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a specific effect ID to specify that they should only trigger when a specific effect ends. For example, <mark style="background-color:purple;">"WeatherEnded\_Rain"</mark> would trigger only when it stopped raining, where <mark style="background-color:purple;">"TeamEffectEnded\_Tailwind"</mark> would trigger only when the Tailwind effect ended on one side. Only effects that count down each turn are compatible extensions.
{% endhint %}
# Triggers: End of Effects

These are keys which trigger after some kind of battle effect has ended.

* <mark style="background-color:purple;">**"WeatherEnded"**</mark>\
  Triggers upon a weather condition ending.\\

* <mark style="background-color:purple;">**"TerrainEnded"**</mark>\
  Triggers upon a battle terrain condition ending.\\

* <mark style="background-color:purple;">**"FieldEffectEnded"**</mark>\
  Triggers upon a field effect ending, such as Trick Room or Gravity.\\

* <mark style="background-color:purple;">**"TeamEffectEnded"**</mark>\
  Triggers upon a team effect ending, such as Reflect or Light Screen.\\

* <mark style="background-color:purple;">**"BattlerEffectEnded"**</mark>\
  Triggers upon a battler effect ending, such as Disable or Encore.

{% hint style="info" %}
Trigger Extensions: You may extend these keys with a specific effect ID to specify that they should only trigger when a specific effect ends. For example, <mark style="background-color:purple;">"WeatherEnded\_Rain"</mark> would trigger only when it stopped raining, where <mark style="background-color:purple;">"TeamEffectEnded\_Tailwind"</mark> would trigger only when the Tailwind effect ended on one side. Only effects that count down each turn are compatible extensions.
{% endhint %}
# Triggers: Variable

These are keys which only trigger when a special midbattle variable is changed.

* <mark style="background-color:purple;">**"Variable\_#"**</mark>\
  Triggers upon the midbattle variable reaching a specified number (#).\\

* <mark style="background-color:purple;">**"VariableUp"**</mark>\
  Triggers upon the midbattle variable being increased.\\

* <mark style="background-color:purple;">**"VariableDown"**</mark>\
  Triggers upon the midbattle variable being decreased.\\

* <mark style="background-color:purple;">**"VariableOver\_#"**</mark>\
  Triggers upon the midbattle variable reaching a value that is greater than a specified number (#).\\

* <mark style="background-color:purple;">**"VariableUnder\_#"**</mark>\
  Triggers upon the midbattle variable reaching a value that is less than a specified number (#).

{% hint style="warning" %}
Trigger Extensions: These keys are not compatible with any trigger extensions except for the ones listed in the "Extensions: Frequency" subsection.
{% endhint %}
# Triggers: Choices

These are keys which only trigger when the player selects a choice during a midbattle text or speech event.

* <mark style="background-color:purple;">**"Choice\_\id\\\_#"**</mark>\
  Triggers upon the player selecting a specified choice index (#) for a question with a specified ID (\id\\).\\

* <mark style="background-color:purple;">**"ChoiceRight\_\id\\"**</mark>\
  Triggers upon the player making the correct choice for a question with a specified ID (\id\\).\\

* <mark style="background-color:purple;">**"ChoiceWrong\_\id\\"**</mark>\
  Triggers upon the player making the incorrect choice for a question with a specified ID (\id\\).

{% hint style="danger" %}
Trigger Extensions: These keys are not compatible with any trigger extensions.
{% endhint %}
# Triggers: Extensions

Most keys can be extended by adding an underscore followed by additional qualifiers. I already noted within each Trigger Key subsection specific extensions that are compatible with those keys. However, there are more general extensions you may include to provide additional utility. These extensions help to narrow down more specifically when they should trigger, or by which trainer or battler. \\
# Extensions: User

These extensions specify the activation of a Trigger Key from a particular perspective. For example, attaching the <mark style="background-color:orange;">"\_player"</mark> extension would only activate Trigger Key's from the player's perspective, while attaching the <mark style="background-color:orange;">"\_foe"</mark> extension would only activate Trigger Keys from the opponent's perspective.\
\
However, not every key is compatible with these extensions. Since these extensions are used to specify the perspective of who has activated a specific key, any keys that occur during a point in battle that don't happen from any particular perspective aren't compatible.

For example, <mark style="background-color:purple;">"TargetHPLow"</mark> is compatible with these extensions, since it is possible to specify a particular battler that may have low HP. However, <mark style="background-color:purple;">"BattleEnd"</mark> would not be compatible with these extensions, since the end of the battle doesn't occur from any particular perspective, it's simply part of the structure of battle itself.\
\
As a rule of thumb, all of the keys in the subsections "Triggers: End of Battle", "Triggers: Variable", and "Triggers: Choices" are not compatible with these extensions. In addition, none of the keys in the "Wild Capture" subsection are compatible with these extensions since only the player is ever capable of capturing a Pokemon, so there isn't ever a need to specify any other perspective for those Trigger Keys.\
\
With all of that out of the way, here are all of the possible user extensions that can be used:

<details>

<summary><mark style="background-color:orange;"><strong>"_player"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by one of the player's Pokemon. For example, <mark style="background-color:purple;">"BeforeMove"</mark> would trigger before any Pokemon uses a move, but <mark style="background-color:purple;">"BeforeMove\_player"</mark> would only ever trigger before one of the *player's* Pokemon uses a move.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_player1"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the left-most position on the player's side (index 0). For example, <mark style="background-color:purple;">"BeforeMove\_player"</mark> would trigger before any of the Pokemon on the player's side uses a move, but <mark style="background-color:purple;">"BeforeMove\_player1"</mark> would only ever trigger before the first Pokemon on the player's side uses a move.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_player2"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the right-most position (doubles) or center position (triples) on the player's side (index 2). For example, <mark style="background-color:purple;">"BeforeMove\_player1"</mark> would trigger before the first Pokemon on the player's side uses a move, but <mark style="background-color:purple;">"BeforeMove\_player2"</mark> would only ever trigger before the second Pokemon on the player's side uses a move. This extension does nothing in single battles.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_player3"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the right-most position on the player's side (index 4). For example, <mark style="background-color:purple;">"BeforeMove\_player2"</mark> would trigger before the second Pokemon on the player's side uses a move, but <mark style="background-color:purple;">"BeforeMove\_player3"</mark> would only ever trigger before the third Pokemon on the player's side uses a move. This extension does nothing in single or double battles.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_foe"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by one of the opponent's Pokemon. For example, <mark style="background-color:purple;">"AfterMove"</mark> would trigger after any Pokemon uses a move, but <mark style="background-color:purple;">"AfterMove\_foe"</mark> would only ever trigger after one of the *opponent's* Pokemon uses a move.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_foe1"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the right-most position on the opponent's side (index 1). For example, <mark style="background-color:purple;">"AfterMove\_foe"</mark> would trigger after any of the Pokemon on the opponent's side uses a move, but <mark style="background-color:purple;">"AfterMove\_foe1"</mark> would only ever trigger after the first Pokemon on the opponent's side uses a move.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_foe2"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the left-most position (doubles) or center position (triples) on the opponent's side (index 3). For example, <mark style="background-color:purple;">"AfterMove\_foe1"</mark> would trigger after the first Pokemon on the opponent's side uses a move, but <mark style="background-color:purple;">"AfterMove\_foe2"</mark> would only ever trigger after the second Pokemon on the opponent's side uses a move. This extension does nothing in single battles.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_foe3"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by the Pokemon that occupies the left-most position on the opponent's side (index 5). For example, <mark style="background-color:purple;">"AfterMove\_foe2"</mark> would trigger after the second Pokemon on the opponent's side uses a move, but <mark style="background-color:purple;">"AfterMove\_foe3"</mark> would only ever trigger after the third Pokemon on the opponent's side uses a move. This extension does nothing in single or double battles.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_ally"</strong></mark></summary>

Add this extension to a key so that it may only trigger when activated by a Pokemon owned by a partner trainer who is teamed up with the player. For example, <mark style="background-color:purple;">"BattlerFainted\_player"</mark> would trigger upon any Pokemon on the player's side fainting, but <mark style="background-color:purple;">"BattlerFainted\_ally"</mark> would only ever trigger upon a Pokemon owned by the player's partner fainting. Unlike "player" and "foe", there is only a single "ally" extension, since the player cannot ever have more than one partner trainer with them at a time, anyway.

</details>
# Extensions: Frequency

These extensions add extra utility to the Trigger Key it's attached to by allowing you to alter when they may trigger, and/or how often. These extensions can be combined with the extensions listed in the "Extensions: User" subsection to add an extra layer of customization to each key. However, not every key is compatible with these extensions, although most are. Since these extensions are used to alter the frequency of a key triggering, any keys that can only ever be triggered once per battle are not compatible with these extensions.&#x20;

For example, the <mark style="background-color:purple;">"BeforeItemUse"</mark> key is compatible with these extensions since it's possible that multiple items may be used in a battle, so it makes sense that you would want to add extensions to repeat or randomize when this key may be triggered. However, the <mark style="background-color:purple;">"BattleEnd"</mark> key is not compatible with these extensions, since each battle obviously only ends once, so it makes no sense to randomize or repeat when that key could trigger.

As a rule of thumb, all of the keys in the subsections "Triggers: End of Battle" and "Triggers: Choices" are not compatible with these extensions.

With all of that out of the way, here are all of the possible frequency extensions that can be used:

<details>

<summary><mark style="background-color:orange;"><strong>"_repeat"</strong></mark></summary>

Add this extension to a key so that it will continuously repeat indefinitely. Normally, each trigger in a midbattle hash will only trigger once. With this extension however, it will continuously trigger for the entire battle. For example, <mark style="background-color:purple;">"TargetTookDamage\_foe"</mark> would only trigger the first time an opponent's Pokemon took damage from an attack, and then never again for that battle. While <mark style="background-color:purple;">"TargetTookDamage\_foe\_repeat"</mark> would continuously trigger each time any of the opponent's Pokemon took damage during this battle.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_random"</strong></mark></summary>

Add this extension to a key so that it will randomly trigger instead of being guaranteed to trigger. For example, <mark style="background-color:purple;">"UserDealtDamage\_player"</mark> is guaranteed to trigger upon one of the player's Pokemon dealing damage to a target with an attack, but <mark style="background-color:purple;">"UserDealtDamage\_player\_random"</mark> would only randomly have a chance to trigger when one of the player's Pokemon deals damage. You can extend this even further by adding another underscore followed by a number to specify the odds of this occurring. For example, <mark style="background-color:purple;">"UserDealtDamage\_player\_random\_25"</mark> would have a 25% chance to randomly trigger when the player's Pokemon deals damage. If no number is added to this extension, this rate defaults to 50%.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_repeat_random"</strong></mark></summary>

This extension is a combo of both the <mark style="background-color:orange;">"\_repeat"</mark> and <mark style="background-color:orange;">"\_random"</mark> extensions above. Add this extension to a key so that it will continuously repeat, but at randomized intervals. For example, <mark style="background-color:purple;">"TurnEnd\_player\_repeat"</mark> would continuously trigger at the end of every turn for the player's Pokemon, while <mark style="background-color:purple;">"TurnEnd\_player\_random"</mark> would randomly trigger once at the end of their turn. However, <mark style="background-color:purple;">"TurnEnd\_player\_repeat\_random"</mark> would continuously trigger at the end of their every turn, but it would only have a random chance of triggering each time. Like with the regular <mark style="background-color:orange;">"\_random"</mark> extension, you can specify the rate at which this random chance occurs by attaching an additional underscore, followed by a number. For example, <mark style="background-color:purple;">"TurnEnd\_player\_repeat\_random\_75"</mark> would continuously trigger at the end of their every turn with a 75% success rate. If no number is added to this extension, this rate defaults to 50%.

</details>

***

<mark style="background-color:yellow;">**Turn Count Extensions**</mark>\
These frequency extensions are special in that they can only apply to the keys listed in the "Triggers: Round Phases", "Triggers: Battler Turns" and "Triggers: Variable" subsections. This is because these extensions determine when they trigger based on the number value that a Trigger Key keeps track of, such as the battle turn count, an individual battler's turn count, or the value of a variable.

<details>

<summary><mark style="background-color:orange;"><strong>"_repeat_odd"</strong></mark></summary>

Add this extension to a key so that it will continuously repeat in battle, but only when the value that the key is tracking is an odd number. For example, <mark style="background-color:purple;">"RoundStartCommand\_foe\_repeat"</mark> would trigger at the start of the Command Phase of every turn, while <mark style="background-color:purple;">"RoundStartCommand\_foe\_repeat\_odd"</mark> would repeatedly trigger only on odd-numbered turns.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_repeat_even"</strong></mark></summary>

Add this extension to a key so that it will continuously repeat in battle, but only when the value that the key is tracking is an even number. For example, <mark style="background-color:purple;">"VariableUp"</mark> would trigger whenever the midbattle variable is increased, while <mark style="background-color:purple;">"VariableUp\_repeat\_even"</mark> would repeatedly trigger only when the value of the variable is increased to an even number.

</details>

<details>

<summary><mark style="background-color:orange;"><strong>"_repeat_every_#"</strong></mark></summary>

Add this extension to a key so that it will continuously repeat in battle, but only when the value that the key is tracking is divisible by the number entered where <mark style="background-color:orange;">#</mark> is. For example, <mark style="background-color:purple;">"RoundEnd\_player\_repeat"</mark> would trigger at the end of each round, while <mark style="background-color:purple;">"RoundEnd\_player\_repeat\_every\_3"</mark> would repeatedly trigger only on turns that are divisible by 3. This means turns 3, 6, 9, etc. will trigger this key, while all other turns will not.

</details>
# Command Keys

Trigger Keys are only half of the equation, however. Once you have a Trigger Key set that will trigger at a specific point in battle, you need to set something that you want to actually *happen* at that point in battle. This is done by setting yet another hash as this Trigger Key's value. In this hash, you can set a whole new set of keys with their own set of values. These keys are what actually prompt specific commands to be carried out. Because of this, I will refer to these set of keys as "Command Keys".&#x20;

In the following subsections, I will go over every possible Command Key, how they can be set, and what actions they will perform. Command Keys which have related effects or affect similar areas of battle have been grouped together to make them easier to find.

Note that Command Keys are always strings, and always begin with a lower case letter.
# Command Keys

Trigger Keys are only half of the equation, however. Once you have a Trigger Key set that will trigger at a specific point in battle, you need to set something that you want to actually *happen* at that point in battle. This is done by setting yet another hash as this Trigger Key's value. In this hash, you can set a whole new set of keys with their own set of values. These keys are what actually prompt specific commands to be carried out. Because of this, I will refer to these set of keys as "Command Keys".&#x20;

In the following subsections, I will go over every possible Command Key, how they can be set, and what actions they will perform. Command Keys which have related effects or affect similar areas of battle have been grouped together to make them easier to find.

Note that Command Keys are always strings, and always begin with a lower case letter.
# Commands: Audio & Animation

These are keys which trigger sound effects, music files, or animations to play.

<details>

<summary><mark style="background-color:blue;"><strong>"playSE"</strong></mark> => <mark style="background-color:yellow;">String</mark></summary>

Plays a sound effect. Set as a string containing the file name of the desired sound effect found in the `Audio/SE` folder.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"playCry"</strong></mark> => <mark style="background-color:yellow;">Integer or Symbol</mark></summary>

Plays the cry of a Pokemon. You can set this as an integer to play the cry of the Pokemon found at a specific battler index. For example, setting this to 1 would play the cry of the opponent's Pokemon at index 1. If you don't want to set specific battler indexes, you can also use the following symbols to more generally set which battler's cry should play: `:Self`, `:Ally`, `:Ally2`, `:Opposing`, `:OpposingAlly`, `:OpposingAlly2`.\
\
Alternatively, you can instead set this to a species ID to play the cry of any species you want, even if that species isn't currently participating in battle.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeBGM"</strong></mark> => <mark style="background-color:yellow;">String or Array</mark></summary>

Changes the current BGM being played to a different track of your choosing. You can set this to a string containing the file name of that music track located in the `Audio/BGM` folder. Alternatively, if you set this as an array, you can customize how this track will play. This array should contain the following data, in this order:

* <mark style="background-color:yellow;">BGM file name</mark> (String)
* <mark style="background-color:yellow;">Fade time</mark> (Integer). This will determine how long the current BGM will take to fade out (in seconds) before the new one begins playing.
* <mark style="background-color:yellow;">Volume</mark> (Integer or nil). This will determine the volume level of the new BGM. You can omit this or set this to nil for the default volume.
* <mark style="background-color:yellow;">Pitch</mark> (Integer or nil). This will determine the pitch level of the new BGM. You can omit this or set this to nil for the default pitch.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"endBGM"</strong></mark> => <mark style="background-color:yellow;">Float</mark> </summary>

Fades out and ends the current BGM being played. This must be set to a float number, which just means any number with a decimal place. This number determines how long (in seconds) the currently playing music will fade out before it completely ends. For example, setting this to `1.5` will have the current music fade out for one and a half seconds before it ends. If you want the current music to end immediately without fading, you would just set this to `0.0`.

Once the music ends, the battle will continue in complete silence. There may be times where you may want this to happen, for some reason. However, if you want to restore music to the battle, you may use <mark style="background-color:blue;">**"resumeBGM"**</mark> to restore the previous BGM, or <mark style="background-color:blue;">**"changeBGM"**</mark> to begin playing a brand new track.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"pauseAndPlayBGM"</strong></mark><strong> => </strong><mark style="background-color:yellow;"><strong>String</strong></mark></summary>

Pauses the current battle music and remembers its position before playing a new BGM. You can set this to a string containing the file name of that music track located in the `Audio/BGM` folder to start playing that BGM.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"resumeBGM"</strong></mark><strong> => </strong><mark style="background-color:yellow;"><strong>Boolean</strong></mark></summary>

Ends the current BGM, and resumes playing a previously paused BGM from its saved position. This won't do anything if there isn't any music track that has been previously paused with <mark style="background-color:blue;">"pauseAndPlayBGM"</mark>.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"playAnim"</strong></mark> => <mark style="background-color:yellow;">String, Symbol, or Array</mark></summary>

This can be used to make a certain animation play. If this is set to a String, this will attempt to play a common animation by that name (for example "StatUp" will play the stat increase animation). If this is set to a move ID Symbol, this will attempt to play the animation of that move. The targets for these animations will automatically be decided based on which Pokemon triggered the specific Trigger Key this command is located in. If you'd wish to manually set who the user and/or target of this animation should be, you may do so by setting this as an array which contains the following data in this order:

* <mark style="background-color:yellow;">Animation ID</mark> (String or Symbol)
* <mark style="background-color:yellow;">User ID</mark> (Integer or Symbol). This is the battler index of the user of the animation. If there is no user for this animation (something that happens independently of any particular battler, like Trick Room or weather), then a user isn't required. If you don't want to set specific battler indexes, you can also use the following symbols to more generally set which battler should be the user of the animation: `:Self`, `:Ally`, `:Ally2`, `:Opposing`, `:OpposingAlly`, `:OpposingAlly2`.
* <mark style="background-color:yellow;">Target ID</mark> (Integer or Symbol). This is the battler index of the target of the animation. If there is no target for this animation (an animation that only affects the user, or happens independently of any particular battler), then a target isn't required. If you don't want to set specific battler indexes, you can also used the same symbols listed in the User ID section above to more generally set which battler should be the target of the animation.

</details>
# Commands: Utilities

These are keys which trigger general utilities, such as creating a pause between actions, delaying an action until a certain point, or setting specific switches or variables.

<details>

<summary><mark style="background-color:blue;"><strong>"setBattler"</strong></mark> => <mark style="background-color:yellow;">Integer or Symbol</mark></summary>

Changes the battler to be used as the focus of many of the commands listed below and in other sections. By default, the battler that these commands apply to is determined by whichever battler triggered the initial Trigger Key. For example, if the Trigger Key is <mark style="background-color:purple;">"UserDealtDamage"</mark>, then the default battler is whoever is the user of the move that just dealt damage. With this key, however, you can manually set which battler should be the focus, regardless of what the default battler may be.&#x20;

To do this, you may simply set this to a battler index to have that battler be flagged as the new focus. Alternatively, you may also use one of the following symbols if you want to more generally assign which battler should be the new focus: `:Self`, `:Ally`, `:Ally2`, `:Opposing`, `:OpposingAlly`, `:OpposingAlly2`.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"wait"</strong></mark> => <mark style="background-color:yellow;">Integer or Float</mark></summary>

Freezes the battle scene and prevents anything from happening for a set number of seconds. You can enter a float number such as 0.5 for a half second pause.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"pause"</strong></mark> => <mark style="background-color:yellow;">Integer or Float</mark></summary>

Creates a delay that pauses any further actions from occurring for a set number of seconds. You can enter a float number such as 0.5 for a half second pause.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"ignoreUntil"</strong></mark> => <mark style="background-color:yellow;">String or Array</mark></summary>

Prevents any other keys below this one from activating until a specified Trigger Key has been triggered. For example, if you set this to <mark style="background-color:purple;">"BattlerFainted\_foe"</mark>, then no other keys in this hash will be able to trigger until one of the foe's Pokemon have fainted to trigger that key. Alternatively, you can set this to an array containing multiple Trigger Keys, and no other keys in this hash will be able to trigger until at least one of the Trigger Keys in this array have been triggered.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"ignoreAfter"</strong></mark> => <mark style="background-color:yellow;">String or Array</mark></summary>

Prevents any other keys below this one from activating after a specified Trigger Key has been triggered. For example, if you set this to <mark style="background-color:purple;">"BattlerFainted\_foe"</mark>, then no other keys in this hash will be able to trigger after one of the foe's Pokemon have fainted to trigger that key. Alternatively, you can set this to an array containing multiple Trigger Keys, and no other keys in this hash will be able to trigger once any of the Trigger Keys in this array have been triggered.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"toggleSwitch"</strong></mark> => <mark style="background-color:yellow;">Integer</mark></summary>

Toggles a particular game switch off or on. The integer set here determines which game switch to toggle. For example, if this is set to 75, then game switch 75 will be toggled on. If game switch 75 is already on, then it will be turned off instead.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"setVariable"</strong></mark> => <mark style="background-color:yellow;">Integer or Array</mark></summary>

Sets the default value of the midbattle variable to whatever number the set integer is. If set as an array of integers, a random value will be selected instead.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"addVariable"</strong></mark> => <mark style="background-color:yellow;">Integer or Array</mark></summary>

Adds to the value of the midbattle variable that is checked for by certain Trigger Keys. Whatever integer is set here will be added to the cumulative total of this variable. If you want to subtract an amount from this variable, set this to a negative number instead.

If set as an array of integers, a random value from this array will be selected to add to the variable's value.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"multVariable"</strong></mark> => <mark style="background-color:yellow;">Integer or Float</mark></summary>

Multiplies the value of the midbattle variable that is checked by certain Trigger Keys by whatever integer is set. If you want to divide the value of the this variable instead, then set this to a float number like 0.5 to divide the value of the variable by half (rounded).

</details>
# Commands: Battle Mechanics

These are keys which trigger certain actions to take place during battle, such as forcing a trainer to use an item or switch out, or toggling the availability of the player's Poke Balls.

<details>

<summary><mark style="background-color:blue;"><strong>"useItem"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Forces a trainer (or a wild Pokemon) to use an item on the battler. The item does not have to be in the trainer's inventory to be used, nor will it be removed from their inventory if it is. If the set item doesn't have any in-battle use, or if the item wouldn't have any effect, then nothing will happen.&#x20;

If the set item is any type of Poke Ball, then the ball will always be used by the player and thrown at the opposing Pokemon, even if the battler who triggered the item to be used is an opposing Pokemon. This is because only the player can use and throw Poke Balls, so this will always default to the player's item, regardless of who triggers the item to be used.&#x20;

If a PP-restoring item is used that would normally require a move to be selected to be used, such as an Ether or Leppa Berry, then these items will just automatically select the move with the lowest PP to use itself on.\
\
If you want to select a random item to be used out of a list, you can simply enter this as an array of item ID's, and a random one will be chosen out of that array.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"useMove"</strong></mark> => <mark style="background-color:yellow;">Integer, Symbol, String, or Array</mark></summary>

Forces a battler to use a specific move in their moveset during their turn, regardless of whatever their actual selected move was going to be this turn. This won't work if the battler has already moved this turn, or if a different action has been chosen besides using a move, such as switching or using an item. This also won't work if the battler is under some condition that would prevent it from using a different move, such as being in the charging turn of a different attack, having zero PP for the selected move, or being under the effects of things like Encore, Disable, or Choice Band. Lastly, this also will fail to work if the battler's naturally selected move is a Z-Move or a Dynamax move, as those cannot be overridden by a normal move.\
\
If this is set as an integer, then the move that the battler will be forced to use will be whatever move appears at the index of that integer. For example, if set to 1, then the battler will be forced to use whatever move appears second in its moveset (since the first index counted would be 0). Alternatively, you can set this to a move ID symbol instead, and the battler will be forced to use that move as long as it appears in their moveset.\
\
If you set this as an array, you may also include an integer as the second argument of the array to specify a particular target for the move. This isn't necessary if the move is a self-targeting move, or doesn't specifically target anyone. If the specified target cannot be found, or isn't eligible, then the first eligible target that can be found will be set instead.\
\
If you don't want to specify which specific move the battler should use, but want to apply a more general rule for which *kinds* of moves it should use, you may do so by setting a string instead of using indexes or move ID's. If it has multiple moves that fit the inputted criteria, it will select a random one to use among those moves. Here are the possible strings you can use to narrow down the kinds of moves that should be used:

* <mark style="background-color:yellow;">**"Damage"**</mark>\
  This will force the battler to select only damage-dealing moves to use, if able. If you use <mark style="background-color:yellow;">"Damage\_foe"</mark> instead, this will specify further that it should only pick damage-dealing moves that will damage opponents, or you can use <mark style="background-color:yellow;">"Damage\_ally"</mark> to specify that it should only pick damage-dealing moves that will damage an ally.

- <mark style="background-color:yellow;">**"Heal"**</mark>\
  This will force the battler to select only healing moves to use, if able. A healing move is any move where `healingMove?` returns true. If you use <mark style="background-color:yellow;">"Heal\_self"</mark>, this will specify further that it should only pick healing moves that target the user, like Recover. If you use <mark style="background-color:yellow;">"Heal\_ally"</mark>, this will specify that only healing moves that are capable of targeting an ally should be picked, like Heal Pulse. If you use <mark style="background-color:yellow;">"Heal\_foe"</mark>, this will specify that only healing moves that are capable of targeting a foe should be picked, like Leech Life.

* <mark style="background-color:yellow;">**"Status"**</mark>\
  This will force the battler to select only non-healing status moves, if able. If you use <mark style="background-color:yellow;">"Status\_self"</mark>, this will specify further that it should only pick status moves that target the user, like Swords Dance. If you use <mark style="background-color:yellow;">"Status\_ally"</mark>, this will specify that only status moves that are capable of targeting an ally should be picked, like Helping Hand. If you used <mark style="background-color:yellow;">"Status\_foe"</mark>, this will specify that only status moves that are capable of targeting a foe should be picked, like Thunder Wave.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"switchOut"</strong></mark> => <mark style="background-color:yellow;">Integer, Symbol, or Array</mark></summary>

Forces the battler to switch out with another one in the party. This key doesn't do anything if there are no other eligible Pokemon to switch to in the battler's party, or if the battler is unable to switch out for some reason. When set to an integer, the new Pokemon that will be sent out will be the one that matches the party index of that integer. For example, if set to 2, then the trainer will send out the Pokemon that appears third in their party line up (since the first index counted would be 0).&#x20;

Alternatively, you may set this to a species ID symbol, and the trainer will send out the first Pokemon in their party line up that matches that species. For example, if you set this to `:PIKACHU`, the trainer will always send out a Pikachu, if they have one in their party. If they have multiple Pokemon of the same species, then the first able one in their party will be the one that gets sent out.\
\
If you set this as an array, you can include a string as the second argument of the array to display a custom battle message that occurs when the battler is switched out. You can use `{1}` in this string to refer to the specific battler's name.\
\
If you don't want to specify which Pokemon the trainer will switch to, there are alternate symbols you may use for this purpose instead of using indexes or species ID's:

* <mark style="background-color:yellow;">**:Choose**</mark>\
  This will allow the trainer to decide for themselves what the next Pokemon sent out should be. If this is the player, then they will manually choose a Pokemon from the party menu. If this is an AI trainer, then they will select the best Pokemon to send out based on their skill level.

- <mark style="background-color:yellow;">**:Random**</mark>\
  This will choose a totally random Pokemon from the trainer's party to send out.

* <mark style="background-color:yellow;">**:Forced**</mark>\
  This functions identically to <mark style="background-color:yellow;">:Random</mark>, except the messages that display will indicate that the trainer is being forced to make this switch, instead of by choice (similar to how moves like Roar and Whirlwind work).

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"megaEvolve"</strong></mark> => <mark style="background-color:yellow;">Boolean or String</mark></summary>

Forces the battler to Mega Evolve when set to `true`, as long as they are able to. If set to a string instead, you can customize a message that will display upon this Mega Evolution triggering. Note that this can even be used to force a wild Pokemon to Mega Evolve, as long as they are holding the appropriate Mega Stone, or has the required Mega Move.\
\
Unlike natural Mega Evolution, you can use this to force Mega Evolution to happen at any point in battle, even at the end of the turn or after the battler has already attacked. This cannot happen if a different action with this battler has been chosen however, such as switching it out or using an item.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"disableMegas"</strong></mark> => <mark style="background-color:yellow;">Boolean</mark></summary>

Toggles the availability of Mega Evolution for the owner of the battler. If set to `true`, Mega Evolution will be disabled for this trainer. If set to `false`, Mega Evolution will no longer be disabled, allowing this trainer to use it again even if they've already used Mega Evolution prior in this battle.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"disableBalls"</strong></mark> => <mark style="background-color:yellow;">Boolean</mark></summary>

Toggles the player's ability to throw Poke Balls during this battle. If set to `true`, Poke Balls will be disabled. When set to `false`, this flag is removed, allowing the trainer to throw Poke Balls again.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"disableItems"</strong></mark> => <mark style="background-color:yellow;">Boolean</mark></summary>

Toggles the ability of all trainers participating in this battle to use items from their inventory during this battle. If set to `true`, item usage will be disabled. When set to `false`, this flag is removed, allowing all trainers to use items again.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"disableControl"</strong></mark> => <mark style="background-color:yellow;">Boolean</mark></summary>

Toggles the player's ability to input controls. If set to `true`, the player's control will be disabled and the AI will control the inputs of the player's character. When set to `false`, this flag is removed, allowing controls to return to the player.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"endBattle"</strong></mark> => <mark style="background-color:yellow;">Integer</mark></summary>

Prematurely ends the battle. This can be used to end a battle early, and manually set its outcome. This is done by setting this to one of the following integers:

* <mark style="background-color:yellow;">1</mark>: Ends the battle as if the player won.
* <mark style="background-color:yellow;">2</mark>: Ends the battle as if the player lost.
* <mark style="background-color:yellow;">3</mark>: Ends the battle as if the player ran/forfeited.
* <mark style="background-color:yellow;">4</mark>: Ends the battle as if the player won (identical to 1).
* <mark style="background-color:yellow;">5</mark>: Ends the battle as if it ended in a draw (identical to 2 in most cases).

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"wildFlee"</strong></mark> => <mark style="background-color:yellow;">Boolean or String</mark></summary>

This wont do anything unless the battler is a wild Pokemon. Setting this to `true` will force the wild Pokemon to flee, prematurely ending the battle. If you set this to a string instead, whatever text you enter will be displayed as the flee message for the wild Pokemon. You can use `{1}` in this string to refer to the wild Pokemon by name.

</details>
# Commands: Battler Attributes

These are keys which trigger something to happen to a battler, such as changing its attributes or effects, changing its stats, or manipulating its HP.

<details>

<summary><mark style="background-color:blue;"><strong>"battlerName"</strong></mark> => <mark style="background-color:yellow;">String</mark></summary>

Changes the name of the battler to whatever string is entered here.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerHP"</strong></mark> => <mark style="background-color:yellow;">Integer or Array</mark></summary>

Changes the HP of the battler. When set to a positive integer, the battler's HP will be restored by that percentage of its total HP. When set to a negative integer, the battler's HP will be reduced by that percentage instead.\
\
For example, if this is set to 25, the battler will restore 25% of its total HP. If set to 100, the battler will restore 100% of its total HP. However, if you inverse these to negative numbers instead, the battler will have their HP reduced by 25% or 100%, respectively. If you set this to 0 instead of a positive or negative number, the battler's HP will always be set to 1 HP, regardless of whatever its current amount is.\
\
If you set this as an array, you can include a string as the second argument of the array to display a custom battle message that occurs when the battler's HP is changed. You can use `{1}` in this string to refer to the specific battler's name.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerHPCap"</strong></mark> => <mark style="background-color:yellow;">Integer</mark></summary>

This sets an HP threshold for the battler that will cap how much damage it can possibly take from direct attacks.\
\
For example, if this is set to 25, the battler's HP will be prevented from dropping below 25% of its max HP when it is struck by an attack, regardless of how strong the attack was. If set to 100, the battler will prevent any damage being taken by an attack at all. If you set this to 0, the battler will survive an attack with 1 HP.\
\
This can be used to design boss-like encounters who trigger certain actions when their HP reaches certain thresholds. Note however that this only affects damage taken by attacks, so any indirect damage may still reduce the battler's HP below the set damage cap.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerStatus"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes the status condition of the battler. If set to a symbol, you may enter the ID of a specific status to inflict that status on the battler. For example, `:BURN` would inflict a burn on the battler. You can also use the symbols `:TOXIC` or `:CONFUSION` to apply toxic Poison or to make the battler confused, respectively. If you want to cure the battler of its status conditions, you can use the symbol `:NONE` to remove them. Note that this will also remove the confusion and infatuation conditions, too. If you want to set a random status condition, you can simply set an array of different status symbols, and a random one will be chosen out of that array.\
\
Another way to use an array is to have the first item of the array be a status symbol (or array of status symbols), and the second item in the array may be set to `true` in order to display certain success/failure messages in applying that status condition.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerType"</strong></mark><strong> ⇒ </strong><mark style="background-color:yellow;"><strong>Symbol or Array</strong></mark></summary>

Changes the battler's typing. If set to a symbol, you may enter the ID of a specific type to replace the battler's current typing with that new type. For example, `:WATER` would turn the battler into a Water-type. If you want to give the battler multiple new types, you can do so by entering an array of type ID's. For example, `[:FIRE, :DRAGON]` would turn the battler into a Fire/Dragon type. If you would like to reset the battler's type back to their original typing, you can set this to `:Reset` instead.

Note that this command will fail to do anything on battlers who are immune to having their type changed for some reason, such as a Pokemon the Multitype or RKS System abilities, or a battler who is currently Terastallized.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerForm"</strong></mark> => <mark style="background-color:yellow;">Integer, Symbol, or Array</mark></summary>

Changes the battler's form, if possible. If set to an integer, the battler will change to that form number, if one exists. You may also set this to `:Random` to change the battler into a random form out of all of its eligible forms, or you can set this to `:Cycle` for the battler to cycle through to its next form in order. For example, if the battler is Deoxys and `:Cycle` is set, Deoxys will shift from Normal form to Attack, Defense, then Speed, and then back to Normal again, each time its form is changed with `:Cycle`.\
\
Note however that certain forms, such as Mega and Primal forms, are not considered eligible forms with this setting, and will be ignored. So you cannot force a Charizard to become Mega Charizard X with this setting. Pretty much everything else however is fair game.\
\
You may also set this to an array if you'd like, and if you do, you may set the second item in this array as a string so that a custom message may appear when the battler changes form. If you set this second item to `true` instead, then a generic transform message will appear instead. Otherwise, no message will display.\
\
Note that a battler cannot have its species changed if it's currently under the effects of a special form or state, such as Mega Evolution, Ultra Burst, Dynamax, or Terastallization. It also cannot change species if it's currently in a semi-invulnerable state due to moves like Fly or Dig, or lifted up in the air due to Sky Drop.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerSpecies"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes a battler's species. Set this to a species ID such as `:PIKACHU` to change the species of that battler. Note that this is a permanent change, so the battler will not revert once switched out. In the case of the player's Pokemon, this means that their Pokemon will be permanently changed as well even once they leave battle, so be careful in how you apply this. NPC's Pokemon are re-generated from their PBS data whenever battle is initiated, so these effects won't persist out of battle for them.\
\
If you set this as an array, you can include a string as the second argument of the array to display a custom battle message that occurs when the battler changes species. You can use `{1}` in this string to refer to the specific battler's name, `{2}` to refer to the new species name, and `{3}` to refer to the name of the trainer who owns that battler.\
\
Note that a battler cannot have its species changed if it's currently under the effects of a special form or state, such as Mega Evolution, Ultra Burst, Dynamax, or Terastallization. It also cannot change species if it's currently in a semi-invulnerable state due to moves like Fly or Dig, or lifted up in the air due to Sky Drop.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerEvolve"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Forces a battler to evolve during battle. Unlike normal evolution, battle evolutions cannot be cancelled and do not require any sort of evolution methods or criteria to be met; you can evolve any species at any point in battle. So for example, you can force Pikachu to evolve into Raichu without a Thunder Stone requirement.\
\
You can set this to `:Next` to force the battler to evolve into the next evolutionary stage listed in that species' PBS data. If the species has multiple branches it can evolve into, such as Eevee, you can set this to `:Random` to choose a random evolution out of all possible branches. If the battler is already fully evolved and has no evolution data, nothing will happen when these symbols are set.\
\
If you'd like to set a specific species for the battler to evolve into, you can set a specific species ID such as `:PIKACHU`, instead. Note that you can force a battler to evolve into *any* species if you set a specific species ID in this way, even if it's a species that would otherwise be impossible for that battler to evolve into. For example, if you set this to `:MEWTWO`, you can make the battler evolve into Mewtwo even though that would be impossible normally. However, if you set the species ID to the same species that the battler already is, then nothing will happen.\
\
If you set this as an array, you can include a number as the second item in the array to set the form of the battler prior to evolution. This can be used to force a battler to evolve directly into a specific form of a species. For example, if set as `[:RAICHU, 1]`, this will force the battler to evolve specifically into Alolan Raichu.\
\
When a battler owned by the player evolves into a species that learns new moves upon evolving, it will be prompted to learn those moves like it normally would. However, if the battler is wild or owned by an NPC trainer, it will automatically have those evolution moves added to its moveset silently, without any prompts. A battler that evolves during battle will be considered a "new" battler once evolution is complete, meaning any effects the battler suffered from before evolution will be removed, similarly to how they would be they had been switched out of battle. However, any effects that would be carried over with the effects of Baton Pass (such as stat stages) will still be retained by the evolved battler.\
\
Note that a battler cannot be forced to evolve if it's currently under the effects of a special form or state, such as Mega Evolution, Ultra Burst, Dynamax, or Terastallization. It also cannot evolve if it's currently in a semi-invulnerable state due to moves like Fly or Dig, or lifted up in the air due to Sky Drop.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerAbility"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes the battler's ability. If set to an ability ID symbol, the battler's ability will be changed to that ability. This won't work however if the battler currently has an ability that cannot be removed, or if the ability you're attempting to give it is an ability that can only be utilized by a specific species. If you want to reset the battler's ability back to its original ability, you can use the symbol `:Reset`, instead. \
\
If you want to assign a random ability to the battler out of a list, you can simply enter this as an array of ability ID's, and a random one will be chosen out of that array. If you want to alert the player of this ability change, you may enter this as an array where the first item in the array is the ability ID (or array of ability ID's), and the second item of this array may be set as either `true`, or a string containing a custom message. If neither are included, then the battler's ability will be changed silently, without alerting the player.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerItem"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes the battler's held item. If set to an item ID symbol, the battler's held item will be changed to that item. This won't work however if the battler is currently holding an item that cannot be removed. If you want to remove a battler's held item without replacing it with another, you can use the symbol `:Remove`, instead. \
\
If you want to assign a random held item to the battler out of a list, you can simply enter this as an array of item ID's, and a random one will be chosen out of that array. If you want to alert the player of this item change, you may enter this as an array where the first item in the array is the item ID (or array of item ID's), and the second item of this array may be set as either `true`, or a string containing a custom message. If neither are included, then the battler's item will be changed silently, without alerting the player.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerMoves"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes the battler's moves. If set to a move ID, the battler will have that move added to their moveset. If their moveset is already full, their first move will be deleted and their moveset will shift up by one to make room for the new move. If you want to reset the battler's moveset back to the normal moves it would typically have at that level, you can use the symbol `:Reset` instead. \
\
If you want to change multiple moves in a battler's moveset, you may instead enter this as an array of move IDs, and each move ID will replace the existing move located at that index in the battler's current moveset. If you want to simply delete a move in a battler's moveset instead of replacing it with anything, you can just enter `nil` at that index.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerStats"</strong></mark> => <mark style="background-color:yellow;">Array or Symbol</mark></summary>

Changes the battler's stat stages. Set this to an array containing the ID of the stat you want to change, followed by the number of stages you want to change it by. For example, entering `[:ATTACK, 2]` would increase the battler's Attack stat by 2 stages. You can enter as many stats as you want in this array, as long as it follows this pattern of symbols and numbers. If you want to decrease the stage of a particular stat, then you would just enter a negative number instead. For example, `[:DEFENSE, -3]` would lower the battler's Defense by 3 stages. \
\
If you would like a random stat to be altered, then you can use `:Random` in place of a stat ID. This randomized stat will never be a stat that already appears in the array, however. So for example, if your stat array looks like `[:SPEED, 1, :Random, -1]`, the random stat will never be Speed, since that stat is already going to be altered.\
\
If you would like to reset all of a battler's stat stages back to zero, you may do so by entering the symbol `:Reset`, instead of an array. If you only want to reset a battler's increased stat stages to zero, then you would use the symbol `:ResetRaised`. Alternatively, if you only want to reset a battler's negative stat stages to zero, then you would use the symbol `:ResetLowered`.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerEffects"</strong></mark> => <mark style="background-color:yellow;">Array</mark></summary>

Changes the effects that are applied to the battler. This is entered as an array that must contain at least two items; the first item in the array must be the symbol of the specific effect you'd like to alter or apply, and the second item in the array must be the value you want to set this effect to. Optionally, you may enter a string as the third item in this array, which will display a custom message when applying this effect. For example, you may enter this as `[:Endure, true]` to silently apply the Endure effect on a battler, or you could set something like `[:FocusEnergy, 2, "{1} is getting pumped!"]` to set the battler's Focus Energy effect to 2 and announce it to the player.\
\
You may even enter multiple different effects to be applied all at once if you want, by making an array of arrays, like this:\
`[[:Rage, true],` \
&#x20;`[:NoRetreat, true],`\
&#x20;`[:PerishSong, 3, "{1} will faint in three turns!"]]`

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"battlerWish"</strong></mark><strong> =>  </strong><mark style="background-color:yellow;"><strong>Boolean, Integer, or Array</strong></mark></summary>

Sets the Wish effect on the battler's position. When set to `true`, this sets the Wish effect which will trigger in 2 turns. After which, any battler occupying that position will be healed by up to 50% of the original Wish-maker's total HP.

If this is instead set as an integer, you can manually set the number of turns before the Wish effect will trigger, instead of it defaulting to the normal 2 turns. If this is instead set as an array, you can enter two integers; the first dictates the number of turns before the Wish triggers, while the second specifies the amount of HP that will be restored once the Wish triggers.

Note: The Wish effect cannot be set with the normal <mark style="background-color:blue;">"battlerEffect"</mark> command because the Wish effect is not placed on a specific battler, but instead on a specific battler *position* on the field.

</details>
# Commands: Battlefield Conditions

These are keys which trigger something to happen to the battlefield, such as changing weather or terrain, the effects that are in play, or even changing the backdrop.

<details>

<summary><mark style="background-color:blue;"><strong>"teamEffects"</strong></mark> => <mark style="background-color:yellow;">Array</mark></summary>

Changes the effects that are applied to one side of the field. This is entered as an array that must contain at least two items; the first item in the array must be the symbol of the specific effect you'd like to alter or apply, and the second item in the array must be the value you want to set this effect to. Optionally, you may enter a string as the third item in this array, which will display a custom message when applying this effect. For example, you may enter this as `[:StickyWeb, true]` to silently apply the Sticky Web effect to a team's side, or you could set something like `[:Tailwind, 3, "A strong wind suddenly blew behind {1}!"]` to set the Tailwind effect to 3 on a team's side and announce it to the player.\
\
You may even enter multiple different effects to be applied all at once if you want, by making an array of arrays, like this:\
`[[:StealthRock, true],` \
&#x20;`[:Spikes, 3],`\
&#x20;`[:ToxicSpikes, 2, "{1} fell into a thorny trap!"]]`

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"fieldEffects"</strong></mark> => <mark style="background-color:yellow;">Array</mark></summary>

Changes the effects that are applied to the entire battlefield. This is entered as an array that must contain at least two items; the first item in the array must be the symbol of the specific effect you'd like to alter or apply, and the second item in the array must be the value you want to set this effect to. Optionally, you may enter a string as the third item in this array, which will display a custom message when applying this effect. For example, you may enter this as `[:Gravity, 5]` to silently apply the Gravity effect to the battlefield for 5 turns, or you could set something like `[:PayDay, 1000, "Coins scattered everywhere!"]` to set the Pay Day effect on the field, allowing the player to pick up an additional $1,000 at the end of the battle.\
\
You may even enter multiple different effects to be applied all at once if you want, by making an array of arrays, like this:\
`[[:MagicRoom, 5],` \
&#x20;`[:WonderRoom, 5],`\
&#x20;`[:TrickRoom, 5, "The battlefield became topsy-turvy!"]]`

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeWeather"</strong></mark> => <mark style="background-color:yellow;">Symbol</mark></summary>

Changes the current battle weather. Set to a weather ID to change the weather to that weather type. If set to `:Random`, a random weather will be set. If set to `:None`, any currently active weather will be cleared. Note that while Primal weather can be set, those weather conditions are hardcoded to immediately end if a Pokemon with the corresponding Primal weather ability isn't on the field.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeTerrain"</strong></mark> => <mark style="background-color:yellow;">Symbol</mark></summary>

Changes the current battle terrain. Set to a terrain ID to change the terrain to that terrain type. If set to `:Random`, a random terrain will be set. If set to `:None`, any currently active terrain will be cleared.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeEnvironment"</strong></mark> => <mark style="background-color:yellow;">Symbol</mark></summary>

Changes the current battle environment. Set to an environment ID to change the environment to that environment type. If set to `:Random`, a random environment will be set. If set to `:None`, the current environment will be set to neutral (usually associated with indoor buildings or urban environments).

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeBackdrop"</strong></mark> => <mark style="background-color:yellow;">String or Array</mark></summary>

Changes the battlefield background and/or bases. Set to a string to change the background and bases used in battle to match the one you entered. You may enter this as an array containing two different strings if you want to mix and match different backgrounds and bases. The first element of the array refers to the background, and the second refers to the bases. The strings you enter for either one only need to contain the root name of the file. For example, you may use `"elite1"` or `"grass_night"`. You must omit the `_bg` or `_base` parts of the file name.\
\
It's also worth noting that changing the bases in battle may also automatically change the battle environment as well, depending on the type of base you have set. This happens independently of the <mark style="background-color:blue;">"changeEnvironment"</mark> key, so this may override that key if you entered this one after it.

</details>

<details>

<summary><mark style="background-color:blue;"><strong>"changeDataboxes"</strong></mark> => <mark style="background-color:yellow;">Symbol or Array</mark></summary>

Changes the active databox style. Refer to the <mark style="background-color:green;">"databoxStyle"</mark> Battle Rule if you're unfamiliar with databox styles. Set to a databox style ID to change to that databox style during battle. This plugin only has two possible databox styles to select from by default; the `:Basic` and `:Long` styles.

If there is a databox style already active and you would like to remove this style so that battler databoxes return to normal, you can simply set this to `nil` instead.

For wild battles only, you can also set this as an array where the first item in the array is the databox style ID, and any additional items in the array are strings that will act as display titles to appear in each wild battler's databox. This can be used to update a wild Pokemon's title midbattle to indicate different boss phases, for example.

</details>
# Commands: Extensions

You cannot have more than one key in a single hash with the same name. If you do, the last instance of that key will overwrite all of the others, effectively making the duplicate keys meaningless. Because of this, you cannot have duplicate Command Keys in a single hash at the same time. This poses a problem, however, if you wish to use the effects of a Command Key multiple times in a single hash to do different things.

For example, say you want to use the <mark style="background-color:purple;">"UserDealtCriticalHit\_player"</mark> Trigger Key so that some text is displayed when the player's Pokemon scores a critical hit in battle.

```
"UserDealtCriticalHit_player" => {
  "speech" => [:Opposing, "No fair! Lucky hit...", "C'mon, {1}!"],
  "text"   => [:Opposing, "{1} is raring to go!"]
}
```

In this example, the opponent will comment on the player's lucky hit. But what if you wanted the player to respond to this with their own line of dialogue? Using the <mark style="background-color:blue;">"speech"</mark> Command Key is no longer possible, since it has already been used once, right? Well normally, yes. However, you can bypass this limitation by using Command Key extensions.

This is very simple, and much more straightforward than Trigger Key extensions. For Command Keys, all you need to do is include an underscore and then add any other character you want to the key to make it unique. For simplicity's sake, I tend to just use letters in alphabetical order to keep things neat and tidy. However, you can use whatever you want, in reality. Letters, numbers, symbols, or entire words - pretty much anything that can be used in a string can be used here, just as long as it appears after an underscore.

```
"UserDealtCriticalHit_player" => {
  "speech_A" => [:Opposing, "No fair! Lucky hit...", "C'mon, {1}!"],
  "text"     => [:Opposing, "{1} is raring to go!"],
  "speech_B" => "Hmph, looks like they aren't giving up so easily!"
}
```

Building off of the previous example, we now added dialogue for the player in response to the opponent's text. Because <mark style="background-color:blue;">"speech\_A"</mark> and <mark style="background-color:blue;">"speech\_B"</mark> are different names, the key limitation is bypassed, allowing you to use as many of the same Command Keys as you'd like in a single hash.

Here's a much more elaborate example, building off of the previous example even further:

```
"UserDealtCriticalHit_player" => {
    "speech_A"       => [:Opposing, "No fair! Lucky hit...", "C'mon, {1}!"],
    "text_A"         => [:Opposing, "{1} is raring to go!"],
    "speech_B"       => "Hmph, looks like they aren't giving up so easily!",
    "setBattler_A"   => 1,
    "battlerStats_A" => [:ATTACK, 1, :SPEED, 1],
    "speech_C"       => "Hah! Looks like my {1} will stop at nothing to win!",
    "setBattler_B"   => 0,
    "speech_D"       => "Two can play at that game! Let's go, {1}!",
    "battlerStats_B" => [:SPECIAL_ATTACK, 1, :SPEED, 1]
  }
```
# Advanced Scripting

The pages in this subsection will go over some advanced ways of setting up your custom midbattle scripts.&#x20;

* In the subsection "Speech Utilities", I will go over everything related to setting up speech and dialogue in much more thorough detail.
* In the subsection "Variable Utilities", I will introduce the midbattle variable, how to edit it's value, and how you can make something happen in response to its value changing.
* In the subsection "Storing Scripts", I will go over how to store entire midbattle hashes in the plugin scripts themselves so that you may call upon them when you need them. This not only allows you to save space in your event scripts themselves, but makes your midbattle scripts more accessible and easily re-usable for multiple battle calls.
* In the subsection "Hardcoding", I will go over an entirely different method of setting up midbattle scripts where you may simply hardcode entire battle scenarios freehand, rather than relying on the pre-made hash system where you input certain values for certain outcomes. This method requires you to be fairly competent at coding, so I recommend sticking with the hash system if you aren't confident in your abilities.
* In the subsection "Global Scripts", I will go over a way to implement midbattle scripts that can apply globally to any battle, without having to set a battle rule for a specific battle.
# Advanced: Speech Utilities

Triggering speech through midbattle scripts is probably the most complex and robust part of the entire kit, mainly because this is primarily what people will typically be using midbattle scripts for. Simply making a trainer say lines of dialogue may seem like the simplest thing this plugin can do, but in reality, it's the part of the kit that the most time and work has been devoted to.

There's so many different ways to utilize speech that I thought it deserved it's own section in this tutorial. In the following subsections, I will go over just some of the ways you may set up mid-battle trainer speech.
# Speech: General

This subsection details the basics in setting speech and offers general tips and advice on how to get the most out of your speech events.

***

<mark style="background-color:orange;">**Speech as a String**</mark>

This is the simplest way to set up speech. This is done by setting the <mark style="background-color:blue;">"speech"</mark> Command Key to a string, and whichever trainer's Pokemon has triggered the associated Trigger Key will speak that line of text. For example:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FPQnFyo3elIyj7ntbO78f%2Fdemo1.gif?alt=media&#x26;token=8e2326c4-9154-4f93-8aa6-0b56b6b25d83" alt="" width="381"><figcaption></figcaption></figure>

```
"BeforeMove_TRICKROOM_foe" => {
  "speech" => "Time to flip things upside-down!"
}
```

This will trigger before the  opponent's Pokemon uses the move Trick Room. If so, the they will slide on screen and speak the line of dialogue entered. Pretty simple.&#x20;

But what if I told you there's a way to make this even simpler? If speech is all you want to happen when this Trigger Key is triggered, then you don't even have to bother setting up a hash and using the <mark style="background-color:blue;">"speech"</mark> Command Key. Instead, you can simply set the Trigger Key itself as the desired line of speech, like so:

```
"BeforeMove_TRICKROOM_foe" => "Time to flip things upside-down!"
```

This will produce exactly the same results as the previous example. When Trigger Keys are given strings as values like shown here, they will automatically assume that the string is meant as speech, and act as if the <mark style="background-color:blue;">"speech"</mark> Command Key is being called. This shortcut can *only* be used for speech. No other function may be set up in this manner.

***

<mark style="background-color:orange;">**Speech as an Array**</mark>

In some scenarios, you may want multiple lines of dialogue to be spoken, and don't want to cram it all in a single string. To accomplish this, setting <mark style="background-color:blue;">"speech"</mark> as an array will also work, like in the example below:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2Ff6XiKA645XZZxFtSpaAV%2Fdemo2.gif?alt=media&#x26;token=42847d4d-b879-4859-9363-227b642a0ed8" alt="" width="381"><figcaption></figcaption></figure>

```
"BattlerFainted_CHARIZARD_foe" => {
  "speech" => ["N-no! Charizard!",
               "Argh, do you think this is over because you've beaten my ace?",
               "No...not by a long shot!"]
}
```

In this example, the opponent will slide on screen and say three different consecutive lines of speech after their Charizard faints. However, this can also be simplified in exactly the same way as outlined in the "String" section above, like so:

```
"BattlerFainted_CHARIZARD_foe" => ["N-no! Charizard!",
                                   "Argh, do you think this is over because you've beaten my ace?",
                                   "No...not by a long shot!"]
```

You may set the value of the Trigger Key itself to the array of strings to have these lines be spoken without having to set up an entire hash.

***

&#x20;<mark style="background-color:orange;">**Speech with Multiple Speakers**</mark>

There may be some scenarios where you don't want just a single speaker saying lines, but instead want multiple speakers with back and forth dialogue. There are a multitude of ways to accomplish this, and I'll outline them below.

***

<mark style="background-color:yellow;">**Adding Indexes to Arrays**</mark>

One of the more simple ways of accomplishing this is to set up the entire dialogue exchange in an array with a single "speech" Command Key, except you can indicate which lines of speech should be spoken by each speaker by entering an index prior to the lines you want that speaker to say. For example:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2F8EwWVdGg82gPvpyYr35m%2Fdemo3.gif?alt=media&#x26;token=f5cf4a82-110d-4c0c-b3dd-f8677eb29153" alt="" width="381"><figcaption></figcaption></figure>

```
"AfterLastSwitchIn_player" => {
  "speech" => [1, "Pathetic. Give up, already.",
               0, "Never! {1} and I can still win!",
               1, "Win? You can hardly stand! Haha!",
               0, "We'll show you!"]
}
```

In this example, we have an array of speech which is triggered after the player sends out their final remaining Pokemon. However, you'll notice that within this array, there are numbers included along with the strings of text. These numbers indicate which trainer actually speaks the following line of dialogue. The numbers represent battler indexes. "0" refers to the first battler on the player's side, and "1" refers to the first battler on the opponent's side. The speaker is whichever trainer owns the Pokemon that appears at that index.

So in this example, "1" sets the speaker as the opponent, so the opposing trainer will slide in to speak the first line of dialogue. Then, since "0" appears next in the array, the active speaker is hidden and the next line of dialogue is then spoken by the player. Note that you can still use the shortcut described in the "Speech as an Array" section to set this speech directly to the Trigger Key instead of creating a hash.

***

<mark style="background-color:yellow;">**Adding Symbols to Arrays**</mark>

What if you don't want to keep track of index numbers for speakers? Perhaps you find it too confusing, or perhaps you're just setting up a scenario where you can't be sure exactly which speaker index will be available to use. In situations like this, you may set certain symbols in place of an index. Here's an example:

```
"BattlerEffectEnded_SlowStart" => {
  "speech" => [:Self, "Now you're in trouble! Get'em, {1}!",
               :Opposing, "Oh no...how could I let this happen?"]
}
```

Here, we have an array of speech which is triggered when the turn counter for the Slow Start ability ends, and Regigigas's stats are at full power. Because no Trigger Extension is used on this Trigger Key to indicate if this should trigger for the player or opponent's Pokemon, this will simply trigger when *any* battler meets these conditions. In this scenario, this becomes impossible to tell which indexes should be used to indicate the speakers of each line, since you have no way of knowing which trainer's Pokemon will be the one who's Slow Start turns end first.

To resolve this, we can simply use generic symbols to indicate who should speak each line, instead of specific indexes. Here are all of the available symbols that may be used, and who they refer to:

* <mark style="background-color:yellow;">:Self</mark>  \
  This indicates that the speaker should be set to the index of whichever battler triggered the associated Trigger Key.
* <mark style="background-color:yellow;">:Ally</mark> \
  This indicates that the speaker should be set to the index of the first available *ally* of whichever battler triggered the associated Trigger Key. Defaults to `:Self` if no ally exists.
* <mark style="background-color:yellow;">:Ally2</mark> \
  This indicates that the speaker should be set to the index of the second available ally (if any) of whichever battler triggered the associated Trigger Key. Defaults to `:Ally` if no secondary ally exists. Defaults to `:Self` if neither exist.
* <mark style="background-color:yellow;">:Opposing</mark> \
  This indicates that the speaker should be set to the index of the closest available *opponent* of whichever battler triggered the associated Trigger Key. Defaults to `:Self` if no opponent exists.
* <mark style="background-color:yellow;">:OpposingAlly</mark> \
  This indicates that the speaker should be set to the index of the first available ally (if any) of the closest available opponent to whichever battler triggered the associated Trigger Key. Defaults to `:Opponent` if no opposing ally exists. Defaults to `:Self` if neither exist.
* <mark style="background-color:yellow;">:OpposingAlly2</mark> \
  This indicates that the speaker should be set to the index of the second available ally (if any) of the closest available opponent to whichever battler triggered the associated Trigger Key. Defaults to `:OpposingAlly` if no secondary opposing ally exists. Defaults to `:Opposing` if no opposing allies exist. Defaults to `:Self` if no opponents exist.

So following this, it's easy to see how the speech would flow in the example provided. The first line of speech is indicated to be spoken by whichever trainer owns the Pokemon found at whichever index `:Self` refers to, which would be whichever battler initially triggered the Trigger Key. The second line of speech is indicated to be spoken by whichever trainer owns the Pokemon found at whichever index `:Opposes` refers to, which would be whichever battler directly opposes the battler which `:Self` refers to.

So for example, if the scenario played out in a way where the player's Regigigas was the one who triggered <mark style="background-color:purple;">"BattlerEffectEnded\_SlowStart"</mark>, then the player would speak the line that follows `:Self`, and the opponent would speak the line that follows `:Opposing`.&#x20;

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FnKAzjqs2KtXpIcqytyEt%2Fdemo4.gif?alt=media&#x26;token=7c353c18-579c-4fcd-b576-2f4778671c14" alt="" width="381"><figcaption><p>Triggered from the player's perspective.</p></figcaption></figure>

However, if it was the *opponent's* Regigigas who was the one who triggered <mark style="background-color:purple;">"BattlerEffectEnded\_SlowStart"</mark>, then it would be the *opponent* that would speak the line that follows `:Self`, and the *player* would be the one who spoke the line that follows `:Opposing`. This is because from the opponent's perspective, the player is the one who `:Opposing` points to, since they are the one who activated the Trigger Key.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FSDR0WZR6oFFdNYkvJMkK%2Fdemo5.gif?alt=media&#x26;token=87a4784a-43d2-4b88-bc43-cc24199d273d" alt="" width="381"><figcaption><p>Triggered from the opponent's perspective.</p></figcaption></figure>
# Speech: Choices

This subsection details setting up speech with branching dialogue paths that can be selected by the player. This can be simple Yes/No questions, or entire dialogue trees without any right or wrong answers.

***

<mark style="background-color:orange;">**Setting Up Choices**</mark>

The simplest way to set up speech with choice selections is to present the player with a list of choices where there can only be one right answer. Here's an example of such a set up:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FUQwudpXpE01vUq7TTKd1%2F%5B2024-01-11%5D%2020_42_49.721.png?alt=media&#x26;token=dea74c5e-2110-46b0-8900-39db660f08f0" alt="" width="384"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, "Yes", "No"],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
}
```

When this is triggered, a set of choices are set up. This is entered as an array which contains an ID for this specific set of choices, an index for what the correct choice should be, followed by a series of strings which act as the possible choices the player must pick from. These choices must be set up *before* the <mark style="background-color:blue;">"speech"</mark> or <mark style="background-color:blue;">"text"</mark> Command Keys which present these choices are called. Then, the text which presents these choices must be entered as an array, where `:Choices` is placed within this array, wherever it is that you want those choices to appear during the speaker's speech.

In the example provided, the opponent will present the player with a question - *"Does Tuesday come after Monday?"* The player is then presented with two choices - "Yes" and "No." Because this particular set of choices does have only one correct answer ("Yes"), the index for this choice is set within <mark style="background-color:blue;">"setChoices"</mark>. Since "Yes" is the first choice in this list, the index for this is set as 1. When the player selects a choice that matches this stored index, a little chime will play to indicate that they made the correct choice. If the player selects a choice that doesn't match this stored index, a buzzer sound will play to indicate that they made an incorrect choice.

***

<mark style="background-color:orange;">**Choices With Reactions**</mark>

If you want the speaker to react to the player's selected choice, you can tweak how you enter your choices to allow for this. This is done by setting the possible choices to a hash instead of a series of strings, where each possible choice is paired with a particular line of dialogue that will be used as the speaker's reaction to that choice. Let's modify the previous example to demonstrate this:

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
}
```

Here, we've set up different responses that the speaker will have whether the player selects "Yes" or "No." This will allow your speakers to interact with the player's decision immediately upon selection, instead of abruptly leaving off screen. There may be scenarios in which there is no reason for the speaker to have any reaction to the player's choice, so which way you set up your choices depends on the scenario.

***

<mark style="background-color:orange;">**Choices With Consequences**</mark>

Ok, so now we know how to make the player select a choice, and we also know how to make the speaker react to the player's choice. But how do we make something *happen* when a choice is made? For this, we need to rely on other Trigger Keys.

***

<mark style="background-color:yellow;">**Consequences for the Right Choice**</mark>

If you want to trigger something to happen after the player selects the correct choice, this can be done by utilizing the <mark style="background-color:purple;">"ChoiceRight"</mark> Trigger Key. This key must include a trigger extension that matches the ID that was entered for this specific set of choices. For example, the ID used in the examples above was set as `:weekday`. This ID can be whatever you want, as long as it's a symbol and unique from any other ID used for a set of choices in the hash. If we combine this with our Trigger Key, we get <mark style="background-color:purple;">"ChoiceRight\_weekday"</mark>, which is the key we need to make something happen in response to the player making the right choice for this set of questions. Let's add this to our example to make something happen:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FSAFFtilGS79T2QjiXhDn%2Fdemo6.gif?alt=media&#x26;token=786d6530-4800-42c2-877b-78d76c0d9012" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
},
"ChoiceRight_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, 2]
}
```

By adding <mark style="background-color:purple;">"ChoiceRight\_weekday"</mark> to our midbattle hash, we can now set up any effects we want to trigger whenever the player selects the correct choice for the set of questions with the `:weekday` ID. For this example, I've set it up so that selecting the correct choice raises the Speed stat of the player's Pokemon at index 0 by two stages.

***

<mark style="background-color:yellow;">**Consequences for the Wrong Choice**</mark>

You may also set separate consequences which trigger whenever the player makes an incorrect choice. This is handled similarly to how consequences for a correct choice is set up, the only difference is that you would use the Trigger Key <mark style="background-color:purple;">"ChoiceWrong"</mark> instead of <mark style="background-color:purple;">"ChoiceRight"</mark>. Continuing our example, let's add a consequence to the player selecting the wrong choice when presented with the `:weekday` choices, which would use the Trigger Key <mark style="background-color:purple;">"ChoiceWrong\_weekday"</mark>.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FkHhor83yrUGJgMUBB5A6%2Fdemo7.gif?alt=media&#x26;token=e526823a-9902-4f89-a82c-b0f9f60f0d9b" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
},
"ChoiceRight_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, 2]
},
"ChoiceWrong_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, -2]
}
```

With this addition, I've set it up so that selecting an incorrect choice *lowers* the Speed stat of the player's Pokemon at index 0 by two stages. So now when the player is presented with this particular question, they will be rewarded for selecting the correct choice, and punished for selecting an incorrect one.

***

<mark style="background-color:orange;">**Branching Choices**</mark>

What if you want to set up a list of choices that don't have any particular right or wrong answer, but simply result in different outcomes based on the decisions made? This can also be done in a similar fashion. However, instead of setting an index for a correct choice, we can simply set this as `nil`.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FFrcPLDkAUfV5pxYDSiZ9%2F%5B2024-01-11%5D%2020_52_12.626.png?alt=media&#x26;token=eaec5089-da27-490d-b604-e2f956341f17" alt="" width="384"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weather, nil, "Sunny!", "Rainy!", "Snowy!"],
  "speech"     => ["What's your favorite type of weather?", :Choices]
}
```

In this example, the player is asked by the speaker to select their favorite type of weather among three different choices. Because this question has no right or wrong answer, the index for the "correct" choice for this set of questions is simply set to nil.

However, if we want something to trigger based on the player's selection, we can no longer use the <mark style="background-color:purple;">"ChoiceRight"</mark> or <mark style="background-color:purple;">"ChoiceWrong"</mark> Trigger Keys. Instead, we can simply use the <mark style="background-color:purple;">"Choice"</mark> Trigger Key, which requires two extensions. The first extension needs to be the ID used for this set of choices, like before. The ID used here is set as `:weather`, so we would combine this to get <mark style="background-color:purple;">"Choice\_weather"</mark>. Secondly, we need to indicate the index of the specific choice made where we want something to trigger. For example, if you want something to trigger when the player selects "Rainy!", then the resulting Trigger Key would look like <mark style="background-color:purple;">"Choice\_weather\_2"</mark>, since "Rainy!" is the second choice in this list of choices. Here's an example which trigger different outcomes based on each possible choice the player can make:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FmcHhKKrFfScrPSf7lSHE%2Fdemo8.gif?alt=media&#x26;token=d93c1af6-9814-4da7-b889-63492c532950" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weather, nil, "Sunny!", "Rainy!", "Snowy!"],
  "speech"     => ["What's your favorite type of weather?", :Choices]
},
"Choice_weather_1" => {
  "changeWeather" => :Sun
},
"Choice_weather_2" => {
  "changeWeather" => :Rain
},
"Choice_weather_3" => {
  "changeWeather" => :Hail
}
```

In this example, the player's choice determines which weather condition is set. If they pick "Sunny!", then the weather is changed to Sun. If they pick "Rainy!", then the weather is changed to Rain. Finally, if they pick "Snowy!", then the weather is changed to Hail.
# Speech: Choices

This subsection details setting up speech with branching dialogue paths that can be selected by the player. This can be simple Yes/No questions, or entire dialogue trees without any right or wrong answers.

***

<mark style="background-color:orange;">**Setting Up Choices**</mark>

The simplest way to set up speech with choice selections is to present the player with a list of choices where there can only be one right answer. Here's an example of such a set up:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FUQwudpXpE01vUq7TTKd1%2F%5B2024-01-11%5D%2020_42_49.721.png?alt=media&#x26;token=dea74c5e-2110-46b0-8900-39db660f08f0" alt="" width="384"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, "Yes", "No"],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
}
```

When this is triggered, a set of choices are set up. This is entered as an array which contains an ID for this specific set of choices, an index for what the correct choice should be, followed by a series of strings which act as the possible choices the player must pick from. These choices must be set up *before* the <mark style="background-color:blue;">"speech"</mark> or <mark style="background-color:blue;">"text"</mark> Command Keys which present these choices are called. Then, the text which presents these choices must be entered as an array, where `:Choices` is placed within this array, wherever it is that you want those choices to appear during the speaker's speech.

In the example provided, the opponent will present the player with a question - *"Does Tuesday come after Monday?"* The player is then presented with two choices - "Yes" and "No." Because this particular set of choices does have only one correct answer ("Yes"), the index for this choice is set within <mark style="background-color:blue;">"setChoices"</mark>. Since "Yes" is the first choice in this list, the index for this is set as 1. When the player selects a choice that matches this stored index, a little chime will play to indicate that they made the correct choice. If the player selects a choice that doesn't match this stored index, a buzzer sound will play to indicate that they made an incorrect choice.

***

<mark style="background-color:orange;">**Choices With Reactions**</mark>

If you want the speaker to react to the player's selected choice, you can tweak how you enter your choices to allow for this. This is done by setting the possible choices to a hash instead of a series of strings, where each possible choice is paired with a particular line of dialogue that will be used as the speaker's reaction to that choice. Let's modify the previous example to demonstrate this:

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
}
```

Here, we've set up different responses that the speaker will have whether the player selects "Yes" or "No." This will allow your speakers to interact with the player's decision immediately upon selection, instead of abruptly leaving off screen. There may be scenarios in which there is no reason for the speaker to have any reaction to the player's choice, so which way you set up your choices depends on the scenario.

***

<mark style="background-color:orange;">**Choices With Consequences**</mark>

Ok, so now we know how to make the player select a choice, and we also know how to make the speaker react to the player's choice. But how do we make something *happen* when a choice is made? For this, we need to rely on other Trigger Keys.

***

<mark style="background-color:yellow;">**Consequences for the Right Choice**</mark>

If you want to trigger something to happen after the player selects the correct choice, this can be done by utilizing the <mark style="background-color:purple;">"ChoiceRight"</mark> Trigger Key. This key must include a trigger extension that matches the ID that was entered for this specific set of choices. For example, the ID used in the examples above was set as `:weekday`. This ID can be whatever you want, as long as it's a symbol and unique from any other ID used for a set of choices in the hash. If we combine this with our Trigger Key, we get <mark style="background-color:purple;">"ChoiceRight\_weekday"</mark>, which is the key we need to make something happen in response to the player making the right choice for this set of questions. Let's add this to our example to make something happen:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FSAFFtilGS79T2QjiXhDn%2Fdemo6.gif?alt=media&#x26;token=786d6530-4800-42c2-877b-78d76c0d9012" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
},
"ChoiceRight_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, 2]
}
```

By adding <mark style="background-color:purple;">"ChoiceRight\_weekday"</mark> to our midbattle hash, we can now set up any effects we want to trigger whenever the player selects the correct choice for the set of questions with the `:weekday` ID. For this example, I've set it up so that selecting the correct choice raises the Speed stat of the player's Pokemon at index 0 by two stages.

***

<mark style="background-color:yellow;">**Consequences for the Wrong Choice**</mark>

You may also set separate consequences which trigger whenever the player makes an incorrect choice. This is handled similarly to how consequences for a correct choice is set up, the only difference is that you would use the Trigger Key <mark style="background-color:purple;">"ChoiceWrong"</mark> instead of <mark style="background-color:purple;">"ChoiceRight"</mark>. Continuing our example, let's add a consequence to the player selecting the wrong choice when presented with the `:weekday` choices, which would use the Trigger Key <mark style="background-color:purple;">"ChoiceWrong\_weekday"</mark>.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FkHhor83yrUGJgMUBB5A6%2Fdemo7.gif?alt=media&#x26;token=e526823a-9902-4f89-a82c-b0f9f60f0d9b" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weekday, 1, {
                   "Yes" => "You're right, of course it does!", 
                   "No"  => "I'm sorry, that's incorrect!"}],
  "speech"     => ["Does Tuesday come after Monday?", :Choices]
},
"ChoiceRight_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, 2]
},
"ChoiceWrong_weekday" => {
  "setBattler"   => 0,
  "battlerStats" => [:SPEED, -2]
}
```

With this addition, I've set it up so that selecting an incorrect choice *lowers* the Speed stat of the player's Pokemon at index 0 by two stages. So now when the player is presented with this particular question, they will be rewarded for selecting the correct choice, and punished for selecting an incorrect one.

***

<mark style="background-color:orange;">**Branching Choices**</mark>

What if you want to set up a list of choices that don't have any particular right or wrong answer, but simply result in different outcomes based on the decisions made? This can also be done in a similar fashion. However, instead of setting an index for a correct choice, we can simply set this as `nil`.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FFrcPLDkAUfV5pxYDSiZ9%2F%5B2024-01-11%5D%2020_52_12.626.png?alt=media&#x26;token=eaec5089-da27-490d-b604-e2f956341f17" alt="" width="384"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weather, nil, "Sunny!", "Rainy!", "Snowy!"],
  "speech"     => ["What's your favorite type of weather?", :Choices]
}
```

In this example, the player is asked by the speaker to select their favorite type of weather among three different choices. Because this question has no right or wrong answer, the index for the "correct" choice for this set of questions is simply set to nil.

However, if we want something to trigger based on the player's selection, we can no longer use the <mark style="background-color:purple;">"ChoiceRight"</mark> or <mark style="background-color:purple;">"ChoiceWrong"</mark> Trigger Keys. Instead, we can simply use the <mark style="background-color:purple;">"Choice"</mark> Trigger Key, which requires two extensions. The first extension needs to be the ID used for this set of choices, like before. The ID used here is set as `:weather`, so we would combine this to get <mark style="background-color:purple;">"Choice\_weather"</mark>. Secondly, we need to indicate the index of the specific choice made where we want something to trigger. For example, if you want something to trigger when the player selects "Rainy!", then the resulting Trigger Key would look like <mark style="background-color:purple;">"Choice\_weather\_2"</mark>, since "Rainy!" is the second choice in this list of choices. Here's an example which trigger different outcomes based on each possible choice the player can make:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FmcHhKKrFfScrPSf7lSHE%2Fdemo8.gif?alt=media&#x26;token=d93c1af6-9814-4da7-b889-63492c532950" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setChoices" => [:weather, nil, "Sunny!", "Rainy!", "Snowy!"],
  "speech"     => ["What's your favorite type of weather?", :Choices]
},
"Choice_weather_1" => {
  "changeWeather" => :Sun
},
"Choice_weather_2" => {
  "changeWeather" => :Rain
},
"Choice_weather_3" => {
  "changeWeather" => :Hail
}
```

In this example, the player's choice determines which weather condition is set. If they pick "Sunny!", then the weather is changed to Sun. If they pick "Rainy!", then the weather is changed to Rain. Finally, if they pick "Snowy!", then the weather is changed to Hail.
# Speech: Speakers

This subsection details methods of setting how your speakers and their text windows are displayed, the different ways in which you may edit and customize them, and examples of how these utilities may be used.

***

<mark style="background-color:orange;">**Manually Setting a Speaker**</mark>

Sometimes you may want to force certain speakers to tag in during dialogue without assigning any lines of speech to them yet. This may be because you want something to happen while they are on screen, but *before* they actually speak any lines. To do this, you would use the <mark style="background-color:blue;">"setSpeaker"</mark> Command Key.

For example, perhaps you want to set a scenario where the opposing trainer slides on screen to begin speaking, but before they actually say any lines, the battle music changes to indicate that now things are getting "serious." This may look something like this:

```
"AfterLastSwitchIn_foe" => {
  "setSpeaker" => :Self,
  "changeBGM"  => ["Battle Elite", 1],
  "speech"     => "No more playing around!"
}
```

In this scenario, after the opponent sends out their final Pokemon, they will slide on screen and begin a cinematic speech event. However, the text entered with the <mark style="background-color:blue;">"speech"</mark> Command Key will only be displayed *after* the battle music fades out and changes. It's a small thing, but little flourishes like this can be accomplished by utilizing the <mark style="background-color:blue;">"setSpeaker"</mark> key.

If you ever want to hide the sprite of the current speaker, but don't want to exit entirely from the speech event, you can accomplish this by setting this key to `:Hide`, instead.

***

<mark style="background-color:yellow;">**Bystander Speakers**</mark>

However, this is by no means the extent of the usefulness of this Command Key. This can also be used to manually set entirely custom speakers who aren't even participating in this battle. For example, let's say you're battling some Team Rocket grunts, and you want the Rocket Boss to slide in to speak as if he's watching this battle unfold in the background. Typically, this wouldn't be possible since you can only set speakers with indexes of existing battlers. However, with the <mark style="background-color:blue;">"setSpeaker"</mark> rule you aren't limited to battler indexes. You can manually set any trainer sprite to appear on screen that you desire. To accomplish this, all you need to do is set the ID of the specific trainer type you want to use as a speaker, like so:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2F3DmUciExIN6ruP3gZZAc%2Fdemo9.gif?alt=media&#x26;token=044df525-463a-4a43-95a7-39a24969b807" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setSpeaker" => :ROCKETBOSS,
  "speech"     => ["Go, minions!", "Teach this child some manners!"]
}
```

In this scenario, the sprite used for the `:ROCKETBOSS` trainer type will appear on screen to speak. This can be done with any trainer type. You'll notice however, that the display name for this speaker will be the generic name for the trainer class itself, rather than an individual trainer. What if you wanted to set a specific name for a character, rather than using this generic class name? This can be done by using the <mark style="background-color:blue;">"editWindow"</mark> Command Key. I'll go into more detail about this in the "Editing Speaker Windows" section further down.

***

<mark style="background-color:yellow;">**Pokemon Speakers**</mark>

As explained above, it's entirely possible to have bystanders slide on screen to speak who aren't even participating in battle. However, this isn't only limited to trainers. You can also set any Pokemon species you want to be a speaker as well. This has more niche uses, since Pokemon typically don't speak, but there may be situations where you may want to utilize this feature. The way you set this is identical to how you set trainers. All that you have to do is set the species ID for the Pokemon you'd like to set as a speaker, like so:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FPUcmoCp8Y8BdIj3SXaV5%2Fdemo13.gif?alt=media&#x26;token=1e1dfa17-20a9-48c9-811e-12a67b4a3155" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setSpeaker" => :MEWTWO,
  "speech"     => "My clone army will not fall to your inferior originals!"
}
```

This example is inspired by *Pokemon: The First Movie* where Mewtwo challenges trainers with his genetically enhanced super clones. Let's say that the player is battling a wild Charizard "super clone". In this scenario, Mewtwo will slide on screen at the start of the battle to say this line of speech, even though Mewtwo itself isn't participating in this battle.

Unlike with trainers however, individual species can often have a variety of sprites based on things like their form, gender, or shinyness. Because of this, you may enter these attributes in an array in this same order to customize the specific sprite of the species that should appear. For example:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2F8EeIhezVuxP4zuGOzri5%2Fdemo14.gif?alt=media&#x26;token=1d342cb6-2456-4b0c-b4d3-4d6c6b61ef8f" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setSpeaker" => [:CHERRIM, 1, 1, true],
  "speech"     => "Cherr!"
}
```

In this example, Cherrim is set as the speaker. However, several of its attributes have been set to customize the specific sprite that should be displayed. Its form has been set to 1 (Sunshine form), as well as its gender (female). As the last entry, a boolean is set to determine whether this should be a shiny sprite or not. If no boolean is included, it is assumed to be `false` by default. Note that setting the Pokemon's gender also changes the default windowskin it uses for speech, so this is still relevant to set even if the species itself doesn't have any visual gender differences. If no gender is set, then its gender will be determined from the gender ratio of the species itself. For example, Chansey speakers will always be female, since Chansey itself is a female-only species. For species without a set gender, this is randomly determined.

If you'd like to set a custom name for this Pokemon speaker, this can be done by using the <mark style="background-color:blue;">"editWindow"</mark> Command Key. I'll go into more detail about this in the "Editing Speaker Windows" section further down.

***

<mark style="background-color:orange;">**Editing Speaker Sprites**</mark>

Sometimes you may want to edit a speaker in some way while they are in the middle of speaking, instead of setting a new speaker to be swapped in. This can be handled with the <mark style="background-color:blue;">"editSpeaker"</mark> Command Key. For example, let's say you want to change a speaker while they are on screen to reveal their true identity...

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FxOnjDdkhoEEa6rfN8086%2Fdemo11.gif?alt=media&#x26;token=004fe3b4-bd4e-4d2e-92c8-c09293190682" alt="" width="381"><figcaption></figcaption></figure>

```
"BattleEndWin" => {
  "speech_A"    => ["Alright! You got me!", "I'm actually a..."],
  "editSpeaker" => :TEAMROCKET_M,
  "speech_B"    => "..spy for Team Rocket!"
}
```

In this example, after the player wins the battle and the trainer slides on screen to say their lose text, this speech event will trigger where they reveal their true identity as a member of Team Rocket. The speaker sprite will instantly update instead of sliding off screen. You can use this to instantly update the speaker's sprite. The way this is handled functions identically to the way you would set up the arguments for the <mark style="background-color:blue;">"setSpeaker"</mark> key. The only difference here is that <mark style="background-color:blue;">"setSpeaker"</mark> sets the appearance of the *next* speaker, while <mark style="background-color:blue;">"editSpeaker"</mark> changes the appearance of the *current* speaker.

Another way which you may use this is to set different "frames" of the same speaker to display some quasi-animations. This can only be done if you have several different sprites of the same speaker. You can use this to emphasize emotions or just add a little extra flair to your speaker's speech.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FwDYpsMrg57m8u8R40rhM%2Fdemo12.gif?alt=media&#x26;token=fc2f0748-c083-4af1-8ff5-bf139fd9e8ba" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "speech_A"      => "You're going down, this time!",
  "editSpeaker_A" => :RIVAL2,
  "speech_B"      => "I'll beat you without even breaking a sweat!",
  "editSpeaker_B" => :RIVAL1,
  "speech_C"      => "Good luck! You're gonna need it!"
}
```

***

<mark style="background-color:orange;">**Editing Speaker Windows**</mark>

You may also edit a speaker's message boxes independently from the speaker themselves. For example, let's say you want to change a speaker's name or windowskin in the middle of their dialogue, without changing the current speaker at all. This can be accomplished by using the <mark style="background-color:blue;">"editWindow"</mark> Command Key. Here's an example:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FHDHBoMPtGMv1L0n9jCxa%2Fdemo3.gif?alt=media&#x26;token=ff11c6b7-752c-4bd3-8448-4518bee4e6e0" alt="" width="381"><figcaption></figcaption></figure>

```
"BattleEndWin" => {
  "speech_A"   => "I...lost. I guess I'm no longer champion...",
  "editWindow" => "Former Champion",
  "speech_B"   => "That title now belongs to you."
}
```

Here, the champion speaks upon the player defeating him and relinquishes his title. The <mark style="background-color:blue;">"editWindow"</mark> key is used to change the speaker's name to "Former Champion" to indicate they no longer hold the title. If you'd also like to edit the windowskin used, you can enter this as an array with the second item in the array being the file name of the windowskin you'd like to use.&#x20;

Note that if you simply want to change the "gender" of the windowskin used, you can input numbers instead of file names. If you want to use the blue boarder windowskin typically used for male speech, you can just input 0. For the red boarder windowskin typically used for female speech, you can just input 1. Any other number you enter will give you the windowskin used for genderless speech.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2F2uSiHihn4bkFKZYn6MRv%2Fdemo1.gif?alt=media&#x26;token=c73623db-25b6-430f-9afd-1e93c9c46956" alt="" width="381"><figcaption><p>Windowskin examples</p></figcaption></figure>

If you would ever like to hide the speaker's text boxes entirely for some reason, then this can also be accomplished by setting "editWindow" to the symbol `:Hide`. If you'd like the text boxes to reappear, then you may set this to the symbol `:Show`.

You can combine the use of the <mark style="background-color:blue;">"editWindow"</mark> and <mark style="background-color:blue;">"setSpeaker"</mark>/<mark style="background-color:blue;">"editSpeaker"</mark> Command Keys to fully customize your speakers. Lets return to a few of the earlier examples in this subsection and combine these keys to full effect.&#x20;

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FSOfYdjeolZpW8F75TLCw%2Fdemo10.gif?alt=media&#x26;token=3e09e9b9-52c6-44b1-852f-a92f1ba0a62d" alt="" width="381"><figcaption></figcaption></figure>

```
"RoundStartCommand_foe" => {
  "setSpeaker" => :ROCKETBOSS, 
  "editWindow" => ["Giovanni", "speech hgss 10"],
  "speech"     => ["Go, minions!", "Teach this child some manners!"]
}
```

Going back to this example with the Rocket Boss used earlier, we can now update this to include a custom name and windowskin for this speaker.

If you want to edit the speaker's windowskin, but you *don't* want to edit their name, then you can do this by simply setting the name entry to nil. Doing so will keep the speaker's default name while still setting a custom windowskin. Let's return to the very first example found on this page and edit its windowskin to demonstrate this:

```
"AfterLastSwitchIn_foe" => {
  "setSpeaker" => :Self,
  "editWindow" => [nil, "choice 24"],
  "changeBGM"  => ["Battle Elite", 1],
  "speech"     => "No more playing around!"
}
```

You can edit the windows of any speaker, even ones who don't appear on screen, such as the player. This can be used as a way of implying there are off-screen speakers who are supporting you during the battle by changing the player's name and/or windowskin.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FqeKLcuqehmAtI1yLdIsO%2F%5B2024-01-11%5D%2021_48_47.209.png?alt=media&#x26;token=f77aca0e-c5f8-48ab-8e43-d05950d33931" alt="" width="384"><figcaption></figcaption></figure>

```
"RoundEnd_player_1" => {
  "setSpeaker" => :Self, 
  "editWindow" => ["Prof. Oak", 0],
  "speech"     => "Quite impressive, \\PN!"
}
```

In this example, we've set the speaker as the player, but edited the window so that it appears as if Proffessor Oak is commenting on the player's performance from off screen.

# Advanced: Variable Utilities

This subsection will introduce the midbattle variable and how it can be utilized within a midbattle script. Examples are provided to give a clearer picture in how this can be applied.

***

<mark style="background-color:orange;">**Manipulating the Variable's Value**</mark>

By default, this variable is set to zero at the start of every battle. However, you can manipulate this variable's default value by manually setting it to the specific value you desire. To do this, we would use the <mark style="background-color:blue;">"setVariable"</mark> Command Key.

```
"RoundEnd_foe_every_4" => {
  "setVariable" => 0
}
```

In this example, the value of the variable is reset to zero at the end of every 4th turn. Something like this can be utilized if you want to have some sort of timer in battle that resets every four turns. This is a handy want of have some way to hard reset this variable once it has reached a value threshold that you needed it to.

If you want this variable to start counting in response to something, you may do so by utilizing the <mark style="background-color:blue;">"addVariable"</mark> key. For example, let's say you want the variable to be increased by 1 at the start of each round in a battle.

```
"RoundStartCommand_foe_repeat" => {
  "addVariable" => 1
}
```

You could use something like this to accomplish that. Now each turn, the variable's value will be increased by 1. If you want to *reduce* the variable's value instead, you would still use the <mark style="background-color:blue;">"addVariable"</mark> key, except you would set this to a negative number instead. For example, if set to -1, then the variable would be reduced by 1 each turn.&#x20;

If you want to randomize how much this variable should be changed by, you can instead set it to an array with as many different values as you want, and one of these values will randomly be selected to add to the variable's total value. For example:

```
"RoundStartCommand_foe_repeat" => {
  "addVariable" => [1, 4, -2, 0]
}
```

This would add to the value at the start of each turn, but the amount would be randomly selected amongst the values in the array.

Finally, if you want to increase the variable's value by a certain factor rather than directly adding an amount, you can accomplish this with the <mark style="background-color:blue;">"multVariable"</mark> Command Key.

```
"RoundStartCommand_foe_repeat" => {
  "multVariable" => 2
}
```

In this example, the value of the variable will now double at the start of each round. If you would like to reduce the variable by a certain factor, you would still use the <mark style="background-color:blue;">"multVariable"</mark> key, except you would set this to a float number instead. For example, if set to 0.5, then the variable would be reduced by half each turn.

{% hint style="info" %}
Note: The value of the midbattle variable may never be less than zero. If you use any of the above methods to set or reduce the variable's value to a number less than zero, the variable will just default to zero. Keep this in mind when designing scenarios where the variable's value may decrease for some reason.
{% endhint %}

By utilizing <mark style="background-color:blue;">"setVariable"</mark>, <mark style="background-color:blue;">"addVariable"</mark> and <mark style="background-color:blue;">"multVariable"</mark>, you have full control in manipulating the value of the midbattle variable. Now let's move on to how we can make something actually *happen* in response to this variable's value.

***

<mark style="background-color:orange;">**Responding to the Variable's Value**</mark>

Any time you utilize the <mark style="background-color:blue;">"addVariable"</mark> or <mark style="background-color:blue;">"multVariable"</mark> Command Keys described in the above section of this page, a series of Trigger Keys are checked for. These are the keys you want to use in order to make something happen in response to the value of the variable changing. Note that <mark style="background-color:blue;">"setVariable"</mark> does not trigger these keys.

***

<mark style="background-color:yellow;">**When the Variable Reaches a Specific Value**</mark>

Whenever the variable is changed, the <mark style="background-color:purple;">"Variable\_#"</mark> Trigger Key is checked for, where <mark style="background-color:purple;">#</mark> corresponds to the specific value of the variable. For example, if you set the Trigger Key <mark style="background-color:purple;">"Variable\_2"</mark>, this will trigger whenever the value of the variable equals exactly 2. Here's an example:

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FpL3A79ovfnl2SeGmj3jo%2Fdemo28.gif?alt=media&#x26;token=67c7b7e9-7327-4463-a0ca-474170745ddd" alt="" width="381"><figcaption></figcaption></figure>

```
"TargetDodgedMove_foe_repeat" => {
  "addVariable" => 1
},
"Variable_2" => {
  "speech" => "Man, are you battling blind-folded?"
}
```

In this example, each time the player's Pokemon misses the opponent with a move, the variable's value is increased by 1 thanks to the <mark style="background-color:blue;">"addVariable"</mark> Command Key. Once this value reaches 2, this will trigger a speech event thanks to the <mark style="background-color:purple;">"Variable\_2"</mark> Trigger Key where the opponent mocks you about your inaccuracy.

You can include as many <mark style="background-color:purple;">"Variable\_#"</mark> keys as you want in order to check for as many different variable values as you want. For example, we can expand upon the previous example so that the opponent will now say something each time the player misses, up to 3 times.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FemDLugsJfSR5wsPFqc7Y%2Fdemo29.gif?alt=media&#x26;token=71b0c0d4-cf3a-4dec-b590-f9fc224d9bae" alt="" width="381"><figcaption></figcaption></figure>

```
"TargetDodgedMove_foe_repeat" => {
  "addVariable" => 1
},
"Variable_1" => {
  "speech" => "That's strike one."
},
"Variable_2" => {
  "speech" => "That's strike two!"
},
"Variable_3" => {
  "speech" => "Three strikes! You're outta here!"
}
```

***

<mark style="background-color:yellow;">**When the Variable Changes Value**</mark>

If you want to respond to the variable changing value, but don't want to specify a particular value to check for, you may do so with the <mark style="background-color:purple;">"VariableUp"</mark> and/or <mark style="background-color:purple;">"VariableDown"</mark> Command Keys. Unlike the normal <mark style="background-color:purple;">"Variable\_#"</mark> key, these don't require any specific number value entered. Instead, these keys simply check the value of the variable to see if it has been changed by any amount since the last time it was changed. If so, the respective key will trigger depending on whether this amount has increased or decreased.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FqzpCUA595cQHdO0HQn9t%2Fdemo31.gif?alt=media&#x26;token=072c458e-6413-4fc6-93cc-be5d5ef5b9da" alt="" width="381"><figcaption></figcaption></figure>

```
"TurnEnd_player_repeat" => {
  "speech"      => [:Opposing, "Let's flip a coin!",
                    "Heads, you win!\nTails, you lose!"],
  "text"        => [:Opposing, "{2} tossed a coin in the air!"],
  "setVariable" => 1,
  "addVariable" => [-1, 1]
},
"VariableUp_repeat" => {
  "speech"       => [:Opposing, "Heads! Lucky you!"],
  "battlerStats" => [:Random, 1]
},
"VariableDown_repeat" => {
  "speech"       => [:Opposing, "Tails! Too bad!"],
  "battlerStats" => [:Random, -1]
}
```

In this example, the opponent plays a game with the player at the end of each of the player's Pokemon's turns. During each instance, the opponent will "flip a coin." If the player wins the coin flip, their Pokemon has a random stat raised by one stage. If the player loses the coin flip, then their Pokemon has a random stat lowered by one stage. This is accomplished by using <mark style="background-color:blue;">"setVariable"</mark> to reset the variable to 1 each turn. Then, <mark style="background-color:blue;">"addVariable"</mark> is used to randomly add 1 or subtract 1 from this value, simulating a coin flip. Finally, the <mark style="background-color:purple;">"VariableUp"</mark> or <mark style="background-color:purple;">"VariableDown"</mark> Trigger Key will trigger depending on this outcome.

If you want something to happen when the variable's value is changed, but only if its new value is above or below a certain value, then you may do so by using the <mark style="background-color:purple;">"VariableOver\_#"</mark> and <mark style="background-color:purple;">"VariableUnder\_#"</mark> Trigger Keys, respectively. The <mark style="background-color:purple;">#</mark> in these keys represent the number which the variable's value should be compared to.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FUnhXLNXOC3XL5peS65Ns%2Fdemo30.gif?alt=media&#x26;token=d55f4265-c0d7-45ac-8fc6-45dc92c0e90c" alt="" width="381"><figcaption></figcaption></figure>

```
"AfterItemUse_player_repeat" => {
  "addVariable" => 1
},
"VariableOver_2" => {
  "speech" => [1, "Ugh...stop spamming items!"]
}
```

In this example, the variable's value is increased by 1 each time the player uses an item from their bag. Once this variable reaches a value which is greater than 2, a speech event will trigger in which the opponent will comment on the player's repeated item use.

The same idea works in reverse when using <mark style="background-color:purple;">"VariableUnder\_#"</mark>, which will trigger only when the variable's value has been reduced, but only if this value is less than the entered number.
# Advanced: Storing Scripts

Midbattle hashes can be quite long and complex. Because of this, sometimes It's simply impractical to include the entire thing in the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule in an event. To address this, I've created a secondary way of implementing a midbattle script by simply using a symbol ID to refer to an entire hash. This is done by instead creating the entire hash in the plugin scripts themselves. This can be done by using the `MidbattleScripts` module.

In the Deluxe Battle Kit plugin scripts, create a new script file (in the `RB` format, like the rest of the plugin scripts) and name this new file whatever you want. You can install [**Notepad++**](https://notepad-plus-plus.org/) for these types of files, if you don't already have a program that recognizes this format. In here, create a module called `MidbattleScripts`. Inside this module, you can save as many midbattle hashes as you want as constants, which you can then call upon as a shortcut to that midbattle hash without having to include the entire thing in a battle rule. This allows you to make as long of a script as you want without having to worry about cramming each event with enormous scripts.\
\
For example, say your custom file contained this script:

```
module MidbattleScripts
  MIDBATTLE_EXAMPLE_SCRIPT = {
    "RoundStartCommand_1_foe" => {
      "speech" => "You're not gonna beat me this time!"
    },
    "BattleEndLose" => {
      "speech" => "See? I told you!"
    },
    "BattleEndWin" => {
      "speech" => "No! Impossible!"
    }
  }
end
```

The constant used here is named `MIDBATTLE_EXAMPLE_SCRIPT`, but you may name this whatever you wish, as long as it's unique and doesn't overlap with an existing constant within this module. Once your constant is saved, you can then call it within the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule instead of inputting the entire hash, like so:

```
setBattleRule("midbattleScript", :MIDBATTLE_EXAMPLE_SCRIPT)
```

Note that when the constant is entered in the battle rule, it needs to be entered as a symbol, meaning it requires a semi-colon in front. It shouldn't have this when entered in the module.

You can use this method to make very long and intricate midbattle hashes without having to worry about space in the event scripts. If you want more intricate examples of midbattle scripts that utilize this feature, check the plugin file `[002] Midbattle Scripting/[003] MidbattleScripts Module`.
# Advanced: Hardcoding

There is one final way of entering a midbattle script, which is to simply hardcode the entirety of the script itself, rather than relying on a hash. The advantage of using this method is that you are totally unrestricted in what you're able to do, as long as you have the know-how to code it. The downside is that this requires more technical grasp of Essentials and Ruby in general, and a lot of things that are simply configured automatically when entering data into a hash must now be set up manually. Because of this, setting up scripts in this manner should be reserved for more advanced users who are already somewhat competent at coding, so I'm not going to go into extensive detail here since I can assume these users can figure it out mostly by looking at examples.\
\
To hardcode a midbattle script, you have to use the `MidbattleHandlers` module to set up your own midbattle handler. To do so, open the Deluxe Battle Kit plugin scripts, create a new text file and name it whatever you want. In here, you may include all of your custom handlers. Here's an example of what one of these may look like:&#x20;

```
MidbattleHandlers.add(:midbattle_scripts, :midbattle_example_script,
  proc { |battle, idxBattler, idxTarget, trigger|
    scene = battle.scene
    case trigger
    when "RoundStartCommand_1_foe"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("You're not gonna beat me this time!"))
    when "BattleEndLose"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("See? I told you!"))
    when "BattleEndWin"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("No! Impossible!"))
    end
  }
)
```

I'll provide a quick breakdown of the arguments used in these handlers.

1. **Handler type**\
   This identifies whether this handler is a trigger handler, or a script handler. For your purposes, this argument should be `:midbattle_scripts`, as you are using this handler to hardcode an entire script, not a specific trigger. However, if you're designing a global midbattle script, you'd want to use `:midbattle_global` instead (more on this in the "Advanced: Global Scripts" section).\\

2. **Script ID**\
   This is the specific ID that should be used to identify this script handler. This is what is used to actually call upon this script when entered in the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule in an event. In the above example, I used the id `:midbattle_example_script`, but this can be whatever symbol you want. This should be a unique symbol not shared by any other midbattle script handler. This is what you actually enter in the battle rule to call this script. As a rule of thumb, I suggest that these ID's are always in lower case, so that you don't risk confusing them with constants entered in the `MidbattleScripts` module outlined in the previous subsection.\\

3. **Proc**\
   This is where you'll actually code the battle script you want. This proc will always contain the following arguments:

{% tabs %}
{% tab title="battle" %}
The battle class. You can use this to access pretty much anything you want related to the battle.
{% endtab %}

{% tab title="idxBattler" %}
The index of the battler who activated the Trigger Key. You can use this to obtain the battler object that appears at this index.
{% endtab %}

{% tab title="idxTarget" %}
The index of the target. This is usually only relevant for Trigger Keys related to using moves.
{% endtab %}

{% tab title="trigger" %}
The specific Trigger Key that has been activated.
{% endtab %}
{% endtabs %}

Once your handler is set up, you may then set this script by calling it with the the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule in an event, like so:

```
setBattleRule("midbattleScript", :midbattle_example_script)
```

***

<mark style="background-color:orange;">**Coding a Midbattle Handler**</mark>

How I suggest setting up these handlers is by using `case trigger`, followed by a series of `when X` statements for each specific Trigger Key that you want to check for where you want something to happen. Then you can simply code whatever it is you want to happen for each Trigger Key. Though, there may be situations where there's a more efficient way to set this up. If you want more intricate examples of midbattle scripts that utilize midbattle handlers, check the plugin file `[002] Midbattle Scripting/[004] MidbattleHandlers Scripts`.\
\
Something to note is that any variations of the <mark style="background-color:purple;">"\_repeat"</mark> or <mark style="background-color:purple;">"\_random"</mark> Trigger Key extensions have no use when hardcoding midbattle scripts. When coding scripts in this way, each key is automatically assumed to always trigger and always repeat indefinitely. So if you want something to only trigger once, or to only occur at a random, you have to specifically code it to do so.&#x20;

While I'm at it, here's a list of methods and/or properties that you might want to reference when hardcoding your scripts to help with this as well as other scenarios, since this plugin adds a lot of new custom content which you may need to call on to make certain things happen:

<details>

<summary><strong>Battle Class</strong></summary>

* `pbTriggerActivated?(*triggers)`\
  Returns true if any of the inputted Trigger Keys have activated in this battle at least once. You may use this to check for repeated keys if you only want a specific Trigger Key to trigger only once.\\

* `pbPauseAndPlayBGM(track)`\
  Pauses the current BGM playing in this battle and saves its position to be restored later before playing the new `track`, which should be an audio file or name of one.\\

* `pbResumeBattleBGM`\
  Ends the current BGM and resumes playing a previously paused BGM from the same position it was paused at. This doesn't do anything if no BGM is currently paused.

</details>

<details>

<summary><strong>Battle::Battler Class</strong></summary>

* `@damageThreshold`\
  Sets the damage cap for a battler. This works exactly as the <mark style="background-color:blue;">"battlerDamageCap"</mark> Command Key does.

- `wild_flee(fleeMsg = nil)`\
  Used to make a wild battler flee from battle. Doesn't do anything if the battler isn't a wild Pokemon. You can set `fleeMsg` to a string to set a custom message upon fleeing.

</details>

<details>

<summary><strong>Battle::Scene Class</strong></summary>

* `pbStartSpeech(speaker)`\
  Begins cinematic speech. If the entered argument is a battler index, the speaker will be set to whichever trainer owns the battler at that index. If it's a wild Pokemon, then the speaker will be set to the wild Pokemon itself. If the entered argument is a battler object, then the speaker will be set to that specific battler itself, regardless if it's owned by a trainer or not. If the speaker is set to a symbol (either a species ID or a trainer type ID), then the speaker will be set to that specific species or trainer type, even if they aren't participating in this battle. For species ID's in particular, this can be entered as an array containing the ID, form number, gender number, and a boolean to determine shininess to customize this Pokemon speaker.

- `pbGetSpeaker(speaker)`\
  If `speaker` is `nil`, this returns the object that was set as the last active speaker. This can be either an in-battle trainer or battler, a Pokemon object, or a Trainer Type object. If `speaker` is set to a battler index, this will return the object that should be assigned as the speaker for that index. For wild Pokemon, this will return the battler object itself. For non-wild Pokemon, it will return the trainer object that owns the Pokemon at that index.

* `pbHideSpeaker`\
  This will slide the sprite of the current speaker off screen (if any) during cinematic speech and close any of their message boxes which may be on screen.

- `pbShowSpeaker(speaker)`\
  This will slide in the sprite of a new speaker during cinematic speech (if any). This accepts the same arguments as `pbStartSpeech`.

* `pbUpdateSpeakerSprite(speaker)`\
  This will replace the sprite of the currently active speaker during cinematic speech (if any), without sliding the current sprite off screen first. This can be used to display different "frames" of the same speaker to convey different emotions, for example. The argument set here can either be a trainer type ID or a Pokemon species ID. For Pokemon species in particular, this can be set as an array containing the ID, form number, gender number, and a boolean to determine shininess to customize this Pokemon speaker.

- `pbShowSpeakerWindows(name, windowskin)`\
  This can be used to update and display the current speaker's and/or windowskin that is used for their dialogue. If either argument is set to `nil`, then the default name and/or windowskin will be displayed.

* `pbHideSpeakerWindows(speech)`\
  This can be used to hide the display of the current speaker's message windows. If `speech` is set to `true`, the text color will be set to white so that any displayed text can be displayed over the cinematic black bar itself, instead of within a message box.

- `pbInCinematicSpeech?`\
  Returns true if you are currently in the middle of cinematic speech.

* `pbForceEndSpeech`\
  This abruptly ends cinematic speech, hides all speaker sprites and returns the battle scene to normal.&#x20;

</details>

# Advanced: Hardcoding

There is one final way of entering a midbattle script, which is to simply hardcode the entirety of the script itself, rather than relying on a hash. The advantage of using this method is that you are totally unrestricted in what you're able to do, as long as you have the know-how to code it. The downside is that this requires more technical grasp of Essentials and Ruby in general, and a lot of things that are simply configured automatically when entering data into a hash must now be set up manually. Because of this, setting up scripts in this manner should be reserved for more advanced users who are already somewhat competent at coding, so I'm not going to go into extensive detail here since I can assume these users can figure it out mostly by looking at examples.\
\
To hardcode a midbattle script, you have to use the `MidbattleHandlers` module to set up your own midbattle handler. To do so, open the Deluxe Battle Kit plugin scripts, create a new text file and name it whatever you want. In here, you may include all of your custom handlers. Here's an example of what one of these may look like:&#x20;

```
MidbattleHandlers.add(:midbattle_scripts, :midbattle_example_script,
  proc { |battle, idxBattler, idxTarget, trigger|
    scene = battle.scene
    case trigger
    when "RoundStartCommand_1_foe"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("You're not gonna beat me this time!"))
    when "BattleEndLose"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("See? I told you!"))
    when "BattleEndWin"
      scene.pbStartSpeech(1)
      battle.pbDisplayPaused(_INTL("No! Impossible!"))
    end
  }
)
```

I'll provide a quick breakdown of the arguments used in these handlers.

1. **Handler type**\
   This identifies whether this handler is a trigger handler, or a script handler. For your purposes, this argument should be `:midbattle_scripts`, as you are using this handler to hardcode an entire script, not a specific trigger. However, if you're designing a global midbattle script, you'd want to use `:midbattle_global` instead (more on this in the "Advanced: Global Scripts" section).\\

2. **Script ID**\
   This is the specific ID that should be used to identify this script handler. This is what is used to actually call upon this script when entered in the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule in an event. In the above example, I used the id `:midbattle_example_script`, but this can be whatever symbol you want. This should be a unique symbol not shared by any other midbattle script handler. This is what you actually enter in the battle rule to call this script. As a rule of thumb, I suggest that these ID's are always in lower case, so that you don't risk confusing them with constants entered in the `MidbattleScripts` module outlined in the previous subsection.\\

3. **Proc**\
   This is where you'll actually code the battle script you want. This proc will always contain the following arguments:

{% tabs %}
{% tab title="battle" %}
The battle class. You can use this to access pretty much anything you want related to the battle.
{% endtab %}

{% tab title="idxBattler" %}
The index of the battler who activated the Trigger Key. You can use this to obtain the battler object that appears at this index.
{% endtab %}

{% tab title="idxTarget" %}
The index of the target. This is usually only relevant for Trigger Keys related to using moves.
{% endtab %}

{% tab title="trigger" %}
The specific Trigger Key that has been activated.
{% endtab %}
{% endtabs %}

Once your handler is set up, you may then set this script by calling it with the the <mark style="background-color:green;">"midbattleScript"</mark> Battle Rule in an event, like so:

```
setBattleRule("midbattleScript", :midbattle_example_script)
```

***

<mark style="background-color:orange;">**Coding a Midbattle Handler**</mark>

How I suggest setting up these handlers is by using `case trigger`, followed by a series of `when X` statements for each specific Trigger Key that you want to check for where you want something to happen. Then you can simply code whatever it is you want to happen for each Trigger Key. Though, there may be situations where there's a more efficient way to set this up. If you want more intricate examples of midbattle scripts that utilize midbattle handlers, check the plugin file `[002] Midbattle Scripting/[004] MidbattleHandlers Scripts`.\
\
Something to note is that any variations of the <mark style="background-color:purple;">"\_repeat"</mark> or <mark style="background-color:purple;">"\_random"</mark> Trigger Key extensions have no use when hardcoding midbattle scripts. When coding scripts in this way, each key is automatically assumed to always trigger and always repeat indefinitely. So if you want something to only trigger once, or to only occur at a random, you have to specifically code it to do so.&#x20;

While I'm at it, here's a list of methods and/or properties that you might want to reference when hardcoding your scripts to help with this as well as other scenarios, since this plugin adds a lot of new custom content which you may need to call on to make certain things happen:

<details>

<summary><strong>Battle Class</strong></summary>

* `pbTriggerActivated?(*triggers)`\
  Returns true if any of the inputted Trigger Keys have activated in this battle at least once. You may use this to check for repeated keys if you only want a specific Trigger Key to trigger only once.\\

* `pbPauseAndPlayBGM(track)`\
  Pauses the current BGM playing in this battle and saves its position to be restored later before playing the new `track`, which should be an audio file or name of one.\\

* `pbResumeBattleBGM`\
  Ends the current BGM and resumes playing a previously paused BGM from the same position it was paused at. This doesn't do anything if no BGM is currently paused.

</details>

<details>

<summary><strong>Battle::Battler Class</strong></summary>

* `@damageThreshold`\
  Sets the damage cap for a battler. This works exactly as the <mark style="background-color:blue;">"battlerDamageCap"</mark> Command Key does.

- `wild_flee(fleeMsg = nil)`\
  Used to make a wild battler flee from battle. Doesn't do anything if the battler isn't a wild Pokemon. You can set `fleeMsg` to a string to set a custom message upon fleeing.

</details>

<details>

<summary><strong>Battle::Scene Class</strong></summary>

* `pbStartSpeech(speaker)`\
  Begins cinematic speech. If the entered argument is a battler index, the speaker will be set to whichever trainer owns the battler at that index. If it's a wild Pokemon, then the speaker will be set to the wild Pokemon itself. If the entered argument is a battler object, then the speaker will be set to that specific battler itself, regardless if it's owned by a trainer or not. If the speaker is set to a symbol (either a species ID or a trainer type ID), then the speaker will be set to that specific species or trainer type, even if they aren't participating in this battle. For species ID's in particular, this can be entered as an array containing the ID, form number, gender number, and a boolean to determine shininess to customize this Pokemon speaker.

- `pbGetSpeaker(speaker)`\
  If `speaker` is `nil`, this returns the object that was set as the last active speaker. This can be either an in-battle trainer or battler, a Pokemon object, or a Trainer Type object. If `speaker` is set to a battler index, this will return the object that should be assigned as the speaker for that index. For wild Pokemon, this will return the battler object itself. For non-wild Pokemon, it will return the trainer object that owns the Pokemon at that index.

* `pbHideSpeaker`\
  This will slide the sprite of the current speaker off screen (if any) during cinematic speech and close any of their message boxes which may be on screen.

- `pbShowSpeaker(speaker)`\
  This will slide in the sprite of a new speaker during cinematic speech (if any). This accepts the same arguments as `pbStartSpeech`.

* `pbUpdateSpeakerSprite(speaker)`\
  This will replace the sprite of the currently active speaker during cinematic speech (if any), without sliding the current sprite off screen first. This can be used to display different "frames" of the same speaker to convey different emotions, for example. The argument set here can either be a trainer type ID or a Pokemon species ID. For Pokemon species in particular, this can be set as an array containing the ID, form number, gender number, and a boolean to determine shininess to customize this Pokemon speaker.

- `pbShowSpeakerWindows(name, windowskin)`\
  This can be used to update and display the current speaker's and/or windowskin that is used for their dialogue. If either argument is set to `nil`, then the default name and/or windowskin will be displayed.

* `pbHideSpeakerWindows(speech)`\
  This can be used to hide the display of the current speaker's message windows. If `speech` is set to `true`, the text color will be set to white so that any displayed text can be displayed over the cinematic black bar itself, instead of within a message box.

- `pbInCinematicSpeech?`\
  Returns true if you are currently in the middle of cinematic speech.

* `pbForceEndSpeech`\
  This abruptly ends cinematic speech, hides all speaker sprites and returns the battle scene to normal.&#x20;

</details>
# Examples: Wild Battles

<mark style="background-color:red;">**Wild Battle Example # 1**</mark>

The example below demonstrates a 1v1 battle against a wild Deoxys. In this battle, the following rules are set:

* <mark style="background-color:green;">"cannotRun"</mark> is used to prevent the playing from fleeing.
* <mark style="background-color:green;">"disablePokeBalls"</mark> is used to prevent the player from manually throwing Poke Balls.
* <mark style="background-color:green;">"terrain"</mark> is used to set permanent Psychic terrain.
* <mark style="background-color:green;">"environ"</mark> is used to set the battle environment to :Space.
* <mark style="background-color:green;">"backdrop"</mark> and <mark style="background-color:green;">"base"</mark> are used to customize the battle backdrop and bases, respectively.
* <mark style="background-color:green;">"alwaysCapture"</mark> is used to ensure a 100% capture rate in this battle.
* <mark style="background-color:green;">"battleBGM"</mark> is used to set custom battle music.
* <mark style="background-color:green;">"battleIntroText"</mark> is used to set custom battle intro text.
* <mark style="background-color:green;">"editWildPokemon"</mark> is used to edit the following attributes of the wild Deoxys:
  * Name is set to "????" so that it may be "revealed" in battle.
  * Obtain location is set to "Outer Space."
  * Flagged as Super Shiny.
  * Given Pokerus.
  * HP Level set to 2, multiplying its natural HP 2x.
  * Given boss immunity to OHKO effects, effects that would force it to flee, and all forms of indirect damage.
* <mark style="background-color:green;">"midbattleScript"</mark> is used to set a script to use for this battle which does the following:
  * "Reveals" Deoxy's real name at the start of the battle.
  * Sets a damage cap for Deoxys so that it will survive with 1 HP regardless of damage taken.
  * At the end of each round, Deoxys will cycle to its next form and recover its HP/Status.
  * Whenever Deoxys takes damage from an attack, it recovers back a little HP.
  * When Deoxy's HP falls to 25% or lower, it stops regenerating HP.
  * When Deoxys reaches the set damage cap (1 HP) after its regeneration has ended, the player will automatically throw a Poke Ball to capture Deoxys. This capture is guaranteed thanks to the <mark style="background-color:green;">"alwaysCapture"</mark> rule.

```ruby
setBattleRule("cannotRun")
setBattleRule("disablePokeBalls")
setBattleRule("terrain", :Psychic)
setBattleRule("environ", :Space)
setBattleRule("backdrop", "elite4")
setBattleRule("base", "distortion")
setBattleRule("alwaysCapture")
setBattleRule("battleBGM", "Battle roaming")
setBattleRule("battleIntroText", "You encountered an alien invader!")
setBattleRule("editWildPokemon", {
  :name        => "????",
  :obtain_text => "Outer Space.",
  :super_shiny => true,
  :pokerus     => true,
  :hp_level    => 2,
  :immunities  => [:OHKO, :ESCAPE, :INDIRECT]
})
setBattleRule("midbattleScript", {
  "RoundStartCommand_1_foe" => {
    "text_A"       => "You used Prof. Pluto's Roto-Dex upgrade to identify the alien species!",
    "playSE"       => "PC access",
    "battlerName"  => "Deoxys",
    "battlerHPCap" => -1,
    "text_B"       => "The alien species was identified as Deoxys!"
  },
  "RoundEnd_foe_repeat" => {
    "playSE"        => "Anim/Sound2",
    "battlerForm"   => [:Cycle, "{1} suddenly mutated!"],
    "playCry"       => :Self,
    "battlerMoves"  => :Reset,
    "ignoreAfter"   => "TargetHPLow_foe",
    "battlerStatus" => [:NONE, true],
    "battlerHP"     => [4, "{1} regenerated some HP!"]
  },
  "TargetTookDamage_foe_repeat" => {
    "ignoreAfter" => "TargetHPLow_foe",
    "text"        => "{1} started to regenerate!",
    "battlerHP"   => [8, "{1} regenerated some HP!"]
  },
  "TargetHPLow_foe" => {
    "text" => "{1} has become too weak to regenerate any more HP!"
  },
  "BattlerReachedHPCap_foe" => {
    "speech"       => [:Opposing, "It's getting weak!\nIt's now or never!", "Go, Poké Ball!"],
    "disableBalls" => false,
    "useItem"      => :POKEBALL
  },
  "AfterCapture" => [0, "Phew...it's finally over.", "The professor would be proud."]
})
WildBattle.start(:DEOXYS, 50)
```

***

<mark style="background-color:red;">**Wild Battle Example # 2**</mark>

The example below demonstrates a double battle where the player and their partner May encounter a wild Latias and Latios. In this battle, the following rules are set:

* <mark style="background-color:green;">"cannotRun"</mark> is used to prevent the playing from fleeing.
* <mark style="background-color:green;">"weather"</mark> is used to set permanent Hail.
* <mark style="background-color:green;">"backdrop"</mark> is used to customize the battle backdrop and bases.
* <mark style="background-color:green;">"editWildPokemon"</mark> is used to edit the following attributes of the wild Latias:
  * Nature is set to Modest.
  * Given Soul Dew to hold.
  * Ability is set to Healer.
  * Given the moves Life Dew, Reflect, Helping Hand, and Psychic.
* <mark style="background-color:green;">"editWildPokemon2"</mark> is used to edit the following attributes of the wild Latios:
  * Nature is set to Adamant.
  * Given Soul Dew to hold.
  * Ability is set to Friend Guard.
  * Given the moves Dragon Dance, Breaking Swipe, Zen Headbutt, and Earthquake.
* <mark style="background-color:green;">"midbattleScript"</mark> is used to set a script to use for this battle which does the following:
  * When either Latios or Latias reach 25% HP or lower, they will call upon the other to heal them.
  * When either Latios or Latias faint, the remaining one will flee, ending the battle.

```ruby
setBattleRule("cannotRun")
setBattleRule("weather", :Hail)
setBattleRule("backdrop", "champion2")
setBattleRule("editWildPokemon", {
  :nature  => :MODEST,
  :item    => :SOULDEW,
  :ability => :HEALER,
  :moves   => [:LIFEDEW, :REFLECT, :HELPINGHAND, :PSYCHIC]
})
setBattleRule("editWildPokemon2", {
  :nature  => :ADAMANT,
  :item    => :SOULDEW,
  :ability => :FRIENDGUARD,
  :moves   => [:DRAGONDANCE, :BREAKINGSWIPE, :ZENHEADBUTT, :EARTHQUAKE]
})
setBattleRule("midbattleScript", {
  "TargetHPLow_foe_repeat" => {
    "text_A"    => "{1} calls out to its partner with a whimpering cry!",
    "playCry"   => :Self,
    "text_B"    => [:Ally, "{1} comes to its partner's aid!"],
    "battlerHP" => [4, "{1} restored a little HP!"]
  },
  "BattlerFainted_foe" => {
    "setBattler" => :Ally,
    "text"       => "{1} looks upset by its partner's defeat...\nIt lost the will to fight!",
    "wildFlee"   => true
  }
})
pbRegisterPartner(:POKEMONTRAINER_May, "May")
WildBattle.start(:LATIAS, 30, :LATIOS, 30)
```
# Examples: Trainer Battles

<mark style="background-color:red;">**Trainer Battle Example # 1**</mark>

The example below demonstrates a 1v1 quiz battle vs Gym Leader Opal, as she appeared in Pokemon Sword & Shield. In this battle, the following rule is set:

* <mark style="background-color:green;">"midbattleScript"</mark> is used to set a script to use for this battle which does the following:
  * At the end of the first round, Opal quizes the player on what her nickname is. If the player guesses right, their Pokemon's Speed is increased by 2 stages. If the player guesses wrong, their Pokemon's Speed is decreased by 2 stages.
  * At the end of the third round, Opal quizes the player on her favorite color. If the player guesses right, their Pokemon's defenses are increased by 2 stages. If the player guesses wrong, their Pokemon's defenses are decreased by 2 stages.
  * At the end of the fifth round, Opal quizes the player on her age. If the player guesses the answer she wants to hear, their Pokemon's offenses are increased by 2 stages. If the player guesses wrong, their Pokemon's offenses are decreased by 2 stages.
  * Before Opal speaks a message prior to sending out her final Pokemon.

```ruby
setBattleRule("midbattleScript", {
  "RoundEnd_1_foe" => {
    "setChoices" => [:nickname, 2, {
                      "The magic-user" => "Bzzt! Too bad!",
                      "The wizard"     => "Ding ding ding! Congratulations, you're correct."
                    }],
    "speech"     => ["Question!", "You...\nDo you know my nickname?", :Choices]
  },
  "ChoiceRight_nickname" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:SPEED, 2]
  },
  "ChoiceWrong_nickname" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:SPEED, -2]
  },
  "RoundEnd_3_foe" => {
    "setChoices" => [:color, 2, {
                      "Pink"   => "That's what I like to see in other people, but it's not what I like for myself.",
                      "Purple" => "Yes, a nice, deep purple...\nTruly grand, don't you think?"
                    }],
    "speech"     => ["Question!", "What is my favorite color?", :Choices]
  },
  "ChoiceRight_color" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:DEFENSE, 2, :SPECIAL_DEFENSE, 2]
  },
  "ChoiceWrong_color" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:DEFENSE, -2, :SPECIAL_DEFENSE, -2]
  },
  "RoundEnd_5_foe" => {
    "setChoices" => [:age, 1, {
                      "16 years old" => "Hah!\nI like your answer!",
                      "88 years old" => "Well, you're not wrong. But you could've been a little more sensitive."
                    }],
    "speech"     => ["Question!", "All righty then... How old am I?", :Choices]
  },
  "ChoiceRight_age" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:ATTACK, 2, :SPECIAL_ATTACK, 2]
  },
  "ChoiceWrong_age" => {
    "setBattler"   => :Opposing,
    "battlerStats" => [:ATTACK, -2, :SPECIAL_ATTACK, -2]
  },
  "BeforeLastSwitchIn_foe" => "My morning tea is finally kicking in, and not a moment too soon!"
})
TrainerBattle.start(:LEADER_Opal, "Opal")
```

***

<mark style="background-color:red;">**Trainer Battle Example # 2**</mark>

The example below demonstrates a 1v1 battle vs a Team Rocket grunt who is blocking the exit of a collapsing cave. In this battle, the following rules are set:

* <mark style="background-color:green;">"canLose"</mark> is used to allow the player to continue even if they lose the battle.
* <mark style="background-color:green;">"victoryBGM"</mark> is used to set no victory music to play if you win this battle.
* <mark style="background-color:green;">"battleIntroText"</mark> is used to customize the intro text at the start of the battle.
* <mark style="background-color:green;">"opponentLoseText"</mark> is used to set custom lose text for this trainer when you beat them.
* <mark style="background-color:green;">"midbattleScript"</mark> is used to set a script to use for this battle which does the following:
  * Informs the player at the start of the battle that the cave is collapsing and they have a limited number of turns to win the battle.
  * Plays a sound effect and displays a message at the end of each turn to indicate the cave is in the midst of collapsing.
  * When the HP of the opponent's final Pokemon is low, they will stand their ground to recover some HP, and increase both of their defenses by two stages.
  * At the end of the second round, a falling rock falls on your Pokemon's head, dealing damage to them and causing confusion.
  * At the end of the third round, a message is displayed indicating that the player is almost out of time.
  * At the end of the fourth round, the player has run out of time and is forced to recall their Pokemon and flee the battle to escape the cave.
  * Upon the player forfeiting the match, the opponent will speak a message taunting the player.

```ruby
setBattleRule("canLose")
setBattleRule("victoryBGM", "")
setBattleRule("battleIntroText", "{1} blocks your escape!")
setBattleRule("opponentLoseText", "H-hey wait! Don't abandon me in here...")
setBattleRule("midbattleScript", {
  "RoundStartCommand_1_foe" => {
    "playSE"  => "Mining collapse",
    "text_A"  => "The cave ceiling begins to crumble down all around you!",
    "speech"  => ["I am not letting you escape!", "I don't care if this whole cave collapses down on the both of us...haha!"],
    "text_B"  => "Defeat your opponent before time runs out!"
  },
  "RoundEnd_player_repeat" => {
    "playSE" => "Mining collapse",
    "text"   => "The cave continues to collapse all around you!"
  },
  "RoundEnd_2_player" => {
    "text"          => "{1} was struck on the head by a falling rock!",
    "playAnim"      => [:ROCKSMASH, :Opposing, :Self],
    "battlerHP"     => -4,
    "battlerStatus" => :CONFUSED
  },
  "RoundEnd_3_player" => {
    "text" => ["You're running out of time!", "You need to escape immediately!"]
  },
  "RoundEnd_4_player" => {
    "text_A"    => "You failed to defeat your opponent in time!",
    "playAnim"  => ["Recall", :Self],
    "text_B"    => "You were forced to flee the battle!",
    "playSE"    => "Battle flee",
    "endBattle" => 3
  },
  "LastTargetHPLow_foe" => {
    "speech"       => "My {1} will never give up!",
    "endSpeech"    => true,
    "playAnim"     => [:BULKUP, :Self],
    "playCry"      => :Self,
    "battlerHP"    => [2, "{1} is standing its ground!"],
    "battlerStats" => [:DEFENSE, 2, :SPECIAL_DEFENSE, 2]
  },
  "BattleEndForfeit" => "Haha...you'll never make it out alive!"
})
TrainerBattle.start(:TEAMROCKET_M, "Grunt", 1)
```
# Miscellaneous Utilities

This section will briefly touch on a variety of smaller features or mechanics implemented by this plugin that don't really fit anywhere else in the guide, or aren't significant enough to warrant their own dedicated section.

***

<mark style="background-color:orange;">**Shorted Move Names**</mark>

As the Pokemon series has gone on, character limits on move names has increased, allowing for moves with much longer names than in older generations. However, the default Essentials battle UI isn't designed to handle moves with really long names, so these moves can break the UI when trying to display them. To resolve this, the Deluxe Battle Kit allows you to truncate these long names with ellipses while displayed in the fight menu.&#x20;

To toggle whether this feature applies, this can be done by simply opening the Settings file in the Deluxe Battle Kit plugin, and setting the `SHORTEN_MOVES` setting to `true` or `false` to turn the feature on or off.

![](https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2Frw8R6AWaQpvycyq8DguV%2F%5B2024-01-14%5D%2010_33_08.674.png?alt=media\&token=9e3ec234-fd4c-4fc1-aee3-a90fc32f6bc3)    ![](https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2F9jhh2H3NKyN8eiKEfbDa%2F%5B2024-01-14%5D%2010_32_15.738.png?alt=media\&token=3e51c88a-ff67-411e-9221-ce1a7391bb57)

The examples above displays a mock move which was given the apt name "Move With a Very Long Name." On the left, this is how this move would appear normally. As you can see, the name is so long that it breaks the menu UI. On the right, however, this is how this same move would appear when the `SHORTEN_MOVES` setting is turned on, truncating the move name with ellipses so that it now properly fits in the UI.

***

<mark style="background-color:orange;">**Low HP Music**</mark>

In *Pokemon Black & White*, a feature was introduced where the battle music would change whenever the HP of the player's Pokemon reached critically low levels. This plugin replicates this feature by utilizing a global midbattle script to change the battle music in these scenarios.

To toggle whether this feature applies, this can be done by simply opening the Settings file in the Deluxe Battle Kit plugin, and setting the `PLAY_LOW_HP_MUSIC` setting to `true` or `false` to turn the feature on or off.

If you'd like to disable or change the BGM that plays for specific battles, you may do so by using the <mark style="background-color:green;">"lowHealthBGM"</mark> Battle Rule.

***

<mark style="background-color:orange;">**Trainer Battle with Selection Sizes**</mark>

One feature added by this plugin is the ability to initiate trainer battles where the player may only bring a select number of Pokemon from their party into battle. For example, if you want to set up a Gym Leader battle where the player can only bring 2 party members into battle, you do so.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FHZub0FsxUtzwDnYfZX2L%2FAnimation2.gif?alt=media&#x26;token=c03bd91b-703b-4999-95a8-84ead05e09c6" alt="" width="375"><figcaption><p>Brock requires you to select only 2 party members to battle with.</p></figcaption></figure>

In order to set this up, you can use the following battle call to initiate this:

```
TrainerBattle.select_start(size, *args)
```

With this battle call, `size` can be set to the number of party members the player must select to enter battle with. While `args` should just be the normal conditions that you would normally enter in a `TrainerBattle.start` battle call (trainer type, trainer name, version, etc.).

***

<mark style="background-color:orange;">**Deluxe Plugin Settings in Debug Menu**</mark>

While playing in Debug mode, there will now be a new option in the Debug menu named "Deluxe plugin settings..." In this menu, you will find options for toggling a variety of features related to special battle mechanics. By default, this will include the ability to toggle the availability of Mega Evolution on or off.

![](https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FdvJ02j6kQ3rFyQLLAp96%2F%5B2024-02-05%5D%2012_08_24.263.png?alt=media\&token=31f35768-9dc7-447b-8eaf-3e2da44ffc16)    ![](https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FTcOidP2cxreuImaxsDgJ%2F%5B2024-01-14%5D%2010_30_47.210.png?alt=media\&token=57874400-8c96-406b-b8bb-37e1c89165cb)

Other add-on plugins for the Deluxe Battle Kit may introduce new options, such as the ability to toggle off Z-Moves, setting the maps that are capable of supporting Dynamax, or charging the player's Tera Orb, for example. Remember to check this menu option when installing a new add-on plugin for the Deluxe Battle Kit, as chances are it will introduce new Debug options here.

***

<mark style="background-color:orange;">**Held Mega Stones in the Party Menu**</mark>

Essentials is capable of displaying held item icons for specific types of items that differ from the generic icon. The Deluxe Battle Kit utilizes this code to fully implement this feature for Mega Stones, as seen below.

<figure><img src="https://2153694798-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FvzqYxbzoSOVtGkOgfRUQ%2Fuploads%2FAW1h2hnHistVEZ7oNKqT%2F%5B2024-01-12%5D%2011_12_51.003.png?alt=media&#x26;token=eba6fc9c-b06e-4c29-b52d-bb500bde7bbd" alt="" width="384"><figcaption><p>Example of a held Mega Stone icon.</p></figcaption></figure>

***

<mark style="background-color:orange;">**Primal Reversion Counter**</mark>

Essentials internally keeps track of a variety of the player's game statistics. Things such as number of Repels used, number of eggs hatches, or battles won. One of those statistics is how many times the player has used Mega Evolution, which can be called with `$stats.mega_evolution_count`.

However, the same isn't true for Primal Reversion. There is no internal counter for the number of times your Pokemon have entered Primal form through this mechanic. Which is understandable, since it's a fairly niche feature compared to Mega Evolution. However, adding a counter for this is rather trivial, so I decided to throw one in for the heck of it.

With the Deluxe Battle Kit installed, the game will now keep track of how many times the player's Pokemon have used Primal Reversion. To call this counter, you may use the following script:

`$stats.primal_reversion_count`

***

<mark style="background-color:orange;">**Wild Mega Battle Counter**</mark>

The game will now also keep count of the number of wild Mega Battles won. This counts whenever the player defeats or captures a wild Mega Pokemon that was encountered through the use of the <mark style="background-color:green;">"wildMegaEvolution"</mark> Battle Rule.&#x20;

To call this counter, you may use the following script:

`$stats.wild_mega_battles_won`

***

<mark style="background-color:orange;">**Improved HighCriticalHitRate Move Flag**</mark>

In the `moves.txt` PBS file, you can flag a move as a high critical hit ratio move by giving it the `HighCriticalHitRate` flag. This flag essentially grants a +1 critical hit stage to those moves. However, there is one example of a move that has a +2 critical hit ratio, essentially as if the Pokemon used Focus Energy. This is the Z-Move 10,000,000 Volt Thunderbolt.

Because this move has this unique property, I decided to update how this move flag works. Now, the `HighCriticalHitRate` flag can have a number attached to it in order to set the number of stages it should raise the critical hit ratio by. This is done by adding an underscore followed by the number of stages, such as `HighCriticalHitRate_2`. If this extension isn't included, then the default `HighCriticalHitRate` is always assumed to grant +1 to the move's critical hit ratio.

You can use this updated flag property to implement custom moves that grant higher critical hit ratios than your typical high-crit moves normally would. Keep in mind that anything with 4 or more stages will just be a guaranteed critical hit, so at that point you might as well just utilize the `AlwaysCriticalHit` function code.

***

<mark style="background-color:orange;">**UsesAllBattleActions Item Flag**</mark>

Some items, when used in battle, use up the player's entire turn regardless of how many Pokemon are on the player's side to issue commands to. The only types of items that behave this way by default are Poke Balls, however, many add-on plugins introduce other items which behave in this manner.

Due to this, I incorporated a new item flag to indicate the specific items that have this behavior. This is flag is called `UsesAllBattleActions`. If you're designing a custom item which you want to have this behavior, you may give your item this flag to implement it. Keep in mind, however, that this is only half of what's required. To truly implement this properly, you'll need to utilize the `firstAction` argument in the item handler for your custom item. Going into this any further would extend outside the scope of this plugin however, so I'll leave it at that.

***

<mark style="background-color:orange;">**Damage Calculation Refactor**</mark>

Essentials uses the method `pbCalcDamageMultipliers` to calculate various damage multipliers that may affect the resulting damage from an attack. This is a very long and complex method that factors in a huge range of possible effects, from weather/terrain to STAB, status effects, as wells as random effects like Charge and Helping Hand. Because of this, editing this method can be quite unruly when you're trying to implement a custom effect of some kind that can affect damage outcomes.

Because of this, I've chosen to completely recode this method in the Deluxe Battle Kit. I've refactored `pbCalcDamageMultipliers` so that it is now broken off into much smaller and more manageable chunks so that adding custom content is far easier.

If you're a more experienced user who plans on implementing new custom content that may be affected by this, you may want to take a look at this refactored code. You can find it in the plugin scripts, located in `[000] Essentials Patches/[003] Damage Calc Refactor`.

***

