#===============================================================================
# Togekiss Hax Battle Script
#===============================================================================
# Custom midbattle script for a 2v2 battle against two Togekiss that use a
# paraflinch strategy. The Togekiss will prioritize Thunder Wave to paralyze
# targets, then use a weighted random selection between Air Slash (70%) and
# Ancient Power (30%) once all targets are paralyzed.
#
# Usage:
#   setBattleRule("size", "2v2")
#   setBattleRule("midbattleScript", TOGEKISS_HAX_SCRIPT)
#   pkmn1 = create_hax_togekiss
#   pkmn2 = create_hax_togekiss
#   trainer = NPCTrainer.new("Duo Togekiss", :BIRDKEEPER)
#   trainer.party = [pkmn1, pkmn2]
#   TrainerBattle.start(trainer)
#
# Or use the convenience function:
#   start_togekiss_hax_demo_battle
#-------------------------------------------------------------------------------

################################################################################
# Togekiss Hax Midbattle Script Handler
################################################################################

MidbattleHandlers.add(:midbattle_scripts, :togekiss_hax,
  proc { |battle, idxBattler, idxTarget, trigger|
    battler = battle.battlers[idxBattler]
    next if !battler || battler.fainted?
    logname = _INTL("{1} ({2})", battler.pbThis(true), battler.index)
    case trigger
    #---------------------------------------------------------------------------
    # Introduction speech at the start of battle.
    when "RoundStartCommand_1_foe1"
      PBDebug.log("[Midbattle Script] '#{trigger}' triggered by #{logname}...")
      battle.pbDisplayPaused(_INTL("Let's see if you can handle our combination!"))
      PBDebug.log("[Midbattle Script] '#{trigger}' effects ended")
    #---------------------------------------------------------------------------
    # Ancient Power triggers stat boosts when dealing damage.
    when "UserDealtDamage_ANCIENTPOWER_foe", "UserDealtDamage_ANCIENTPOWER_foe_repeat"
      PBDebug.log("[Midbattle Script] '#{trigger}' triggered by #{logname}...")
      battle.pbDisplay(_INTL("{1} is glowing with a mysterious power!", battler.pbThis))
      # Play stat up animation if available
      if battle.scene.pbCommonAnimationExists?("StatUp")
        battle.pbAnimation("StatUp", battler, battler)
      end
      showAnim = true
      [:ATTACK, :DEFENSE, :SPECIAL_ATTACK, :SPECIAL_DEFENSE, :SPEED].each do |stat|
        next if !battler.pbCanRaiseStatStage?(stat, battler)
        battler.pbRaiseStatStage(stat, 1, battler, showAnim)
        showAnim = false
      end
      PBDebug.log("[Midbattle Script] '#{trigger}' effects ended")
    #---------------------------------------------------------------------------
    # Togekiss 1 turn logic - prioritizes Thunder Wave unless target is immune or has status, then weighted random.
    when "TurnStart_foe1", "TurnStart_foe1_repeat"
      PBDebug.log("[Togekiss Hax] Handler triggered: #{trigger} by #{logname}")
      if battler.movedThisRound?
        PBDebug.log("[Togekiss Hax] Already moved this round, skipping")
        next
      end
      if battle.decision > 0
        PBDebug.log("[Togekiss Hax] Battle already decided, skipping")
        next
      end
      ch = battle.choices[battler.index]
      PBDebug.log("[Togekiss Hax] Choice type: #{ch[0]}")
      if ch[0] != :UseMove
        PBDebug.log("[Togekiss Hax] Not using a move, skipping")
        next
      end
      if ch[2]&.powerMove?
        PBDebug.log("[Togekiss Hax] Power move detected, skipping")
        next
      end
      move_id = nil
      chosen_target = nil
      # Gather viable opposing battlers.
      opposing_battlers = []
      battler.eachOpposing do |opp|
        next if !opp || opp.fainted?
        opposing_battlers << opp
      end
      # Log decision-making process
      PBDebug.log("[Togekiss Hax] #{battler.name} is analyzing the situation...")
      if opposing_battlers.empty?
        PBDebug.log("[Togekiss Hax] No opposing battlers found")
      else
        PBDebug.log("[Togekiss Hax] Found #{opposing_battlers.length} opponent(s) to check")
        opposing_battlers.each do |opp|
          status_name = (opp.status == :NONE) ? "no status" : opp.status.to_s
          can_paralyze = opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
          PBDebug.log("[Togekiss Hax] Target #{opp.name}: Status=#{status_name}, CanParalyze=#{can_paralyze}")
        end
      end
      # ALWAYS prioritize Thunder Wave first unless target is immune or already has a status effect.
      if opposing_battlers.any?
        thunderwave_target = opposing_battlers.find do |opp|
          # Target must have no status effect AND be able to be paralyzed
          opp.status == :NONE && opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
        end
        if thunderwave_target
          battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :THUNDERWAVE }
          if move_id
            chosen_target = thunderwave_target
            PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Thunder Wave on #{chosen_target.name}!")
            PBDebug.log("[Togekiss Hax] Reason: #{chosen_target.name} has no status and can be paralyzed")
          else
            PBDebug.log("[Togekiss Hax] ERROR: #{battler.name} doesn't know Thunder Wave!")
          end
        else
          PBDebug.log("[Togekiss Hax] No valid Thunder Wave target found")
          opposing_battlers.each do |opp|
            reason = ""
            if opp.status != :NONE
              reason = "#{opp.name} already has status: #{opp.status}"
            elsif !opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
              reason = "#{opp.name} is immune to paralysis"
            end
            PBDebug.log("[Togekiss Hax]   - Cannot use Thunder Wave on #{opp.name}: #{reason}") if reason != ""
          end
        end
      end
      # If no Thunder Wave target chosen, roll dice: 70% Air Slash, 30% Ancient Power
      if !move_id
        chosen_target ||= battler.pbDirectOpposing(true)
        # Check if both targets can't be paralyzed (all paralyzed or immune)
        all_cant_paralyze = opposing_battlers.all? do |opp|
          opp.status != :NONE || !opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
        end
        if all_cant_paralyze && opposing_battlers.length > 0
          # Roll dice: 70% Air Slash, 30% Ancient Power
          roll = battle.pbRandom(100)
          if roll < 70
            # 70% chance: Air Slash
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :AIRSLASH }
            if move_id
              PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Air Slash!")
              PBDebug.log("[Togekiss Hax] Reason: Rolled #{roll}% (70% chance for Air Slash)")
            end
          else
            # 30% chance: Ancient Power
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :ANCIENTPOWER }
            if move_id
              PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Ancient Power!")
              PBDebug.log("[Togekiss Hax] Reason: Rolled #{roll}% (30% chance for Ancient Power)")
            end
          end
        else
          # Fallback: prefer Ancient Power if available, otherwise Air Slash
          battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :ANCIENTPOWER }
          if !move_id
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :AIRSLASH }
          end
          if move_id
            move_name = battler.moves[move_id].name
            PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use #{move_name}!")
            PBDebug.log("[Togekiss Hax] Reason: Fallback move selected")
          end
        end
      end
      next if !move_id || !battler.moves[move_id]
      next if !battle.pbCanChooseMove?(battler.index, move_id, false)
      ch[1] = move_id
      ch[2] = battler.moves[move_id]
      ch[3] = chosen_target ? chosen_target.index : battler.pbDirectOpposing(true)&.index || 0
      battle.pbCalculatePriority(false, [idxBattler]) if ch[2].priority != 0
      PBDebug.log("[Togekiss Hax] Final: #{battler.name} (#{battler.index}) will use #{ch[2].name} on target #{ch[3]}")
    #---------------------------------------------------------------------------
    # Togekiss 2 turn logic - prioritizes Thunder Wave unless target is immune or has status, then weighted random.
    when "TurnStart_foe2", "TurnStart_foe2_repeat"
      PBDebug.log("[Togekiss Hax] Handler triggered: #{trigger} by #{logname}")
      if battler.movedThisRound?
        PBDebug.log("[Togekiss Hax] Already moved this round, skipping")
        next
      end
      if battle.decision > 0
        PBDebug.log("[Togekiss Hax] Battle already decided, skipping")
        next
      end
      ch = battle.choices[battler.index]
      PBDebug.log("[Togekiss Hax] Choice type: #{ch[0]}")
      if ch[0] != :UseMove
        PBDebug.log("[Togekiss Hax] Not using a move, skipping")
        next
      end
      if ch[2]&.powerMove?
        PBDebug.log("[Togekiss Hax] Power move detected, skipping")
        next
      end
      move_id = nil
      chosen_target = nil
      opposing_battlers = []
      battler.eachOpposing do |opp|
        next if !opp || opp.fainted?
        opposing_battlers << opp
      end
      # Log decision-making process
      PBDebug.log("[Togekiss Hax] #{battler.name} is analyzing the situation...")
      if opposing_battlers.empty?
        PBDebug.log("[Togekiss Hax] No opposing battlers found")
      else
        PBDebug.log("[Togekiss Hax] Found #{opposing_battlers.length} opponent(s) to check")
        opposing_battlers.each do |opp|
          status_name = (opp.status == :NONE) ? "no status" : opp.status.to_s
          can_paralyze = opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
          PBDebug.log("[Togekiss Hax] Target #{opp.name}: Status=#{status_name}, CanParalyze=#{can_paralyze}")
        end
      end
      # ALWAYS prioritize Thunder Wave first unless target is immune or already has a status effect.
      if opposing_battlers.any?
        thunderwave_target = opposing_battlers.find do |opp|
          # Target must have no status effect AND be able to be paralyzed
          opp.status == :NONE && opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
        end
        if thunderwave_target
          battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :THUNDERWAVE }
          if move_id
            chosen_target = thunderwave_target
            PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Thunder Wave on #{chosen_target.name}!")
            PBDebug.log("[Togekiss Hax] Reason: #{chosen_target.name} has no status and can be paralyzed")
          else
            PBDebug.log("[Togekiss Hax] ERROR: #{battler.name} doesn't know Thunder Wave!")
          end
        else
          PBDebug.log("[Togekiss Hax] No valid Thunder Wave target found")
          opposing_battlers.each do |opp|
            reason = ""
            if opp.status != :NONE
              reason = "#{opp.name} already has status: #{opp.status}"
            elsif !opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
              reason = "#{opp.name} is immune to paralysis"
            end
            PBDebug.log("[Togekiss Hax]   - Cannot use Thunder Wave on #{opp.name}: #{reason}") if reason != ""
          end
        end
      end
      # If no Thunder Wave target chosen, roll dice: 70% Air Slash, 30% Ancient Power
      if !move_id
        chosen_target ||= battler.pbDirectOpposing(true)
        # Check if both targets can't be paralyzed (all paralyzed or immune)
        all_cant_paralyze = opposing_battlers.all? do |opp|
          opp.status != :NONE || !opp.pbCanInflictStatus?(:PARALYSIS, battler, false)
        end
        if all_cant_paralyze && opposing_battlers.length > 0
          # Roll dice: 70% Air Slash, 30% Ancient Power
          roll = battle.pbRandom(100)
          if roll < 70
            # 70% chance: Air Slash
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :AIRSLASH }
            if move_id
              PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Air Slash!")
              PBDebug.log("[Togekiss Hax] Reason: Rolled #{roll}% (70% chance for Air Slash)")
            end
          else
            # 30% chance: Ancient Power
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :ANCIENTPOWER }
            if move_id
              PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use Ancient Power!")
              PBDebug.log("[Togekiss Hax] Reason: Rolled #{roll}% (30% chance for Ancient Power)")
            end
          end
        else
          # Fallback: prefer Ancient Power if available, otherwise Air Slash
          battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :ANCIENTPOWER }
          if !move_id
            battler.eachMoveWithIndex { |m, i| move_id = i if m.id == :AIRSLASH }
          end
          if move_id
            move_name = battler.moves[move_id].name
            PBDebug.log("[Togekiss Hax] DECISION: #{battler.name} will use #{move_name}!")
            PBDebug.log("[Togekiss Hax] Reason: Fallback move selected")
          end
        end
      end
      next if !move_id || !battler.moves[move_id]
      next if !battle.pbCanChooseMove?(battler.index, move_id, false)
      ch[1] = move_id
      ch[2] = battler.moves[move_id]
      ch[3] = chosen_target ? chosen_target.index : battler.pbDirectOpposing(true)&.index || 2
      battle.pbCalculatePriority(false, [idxBattler]) if ch[2].priority != 0
      PBDebug.log("[Togekiss Hax] Final: #{battler.name} (#{battler.index}) will use #{ch[2].name} on target #{ch[3]}")
    end
  }
)

################################################################################
# Togekiss Hax Script Constant and Helper Functions
################################################################################

TOGEKISS_HAX_SCRIPT = :togekiss_hax

#-------------------------------------------------------------------------------
# Creates a Togekiss Pokemon configured for the hax battle.
#-------------------------------------------------------------------------------
def create_hax_togekiss
  pkmn = Pokemon.new(:TOGEKISS, 50)
  pkmn.ability = :SERENEGRACE
  pkmn.moves = [
    :AIRSLASH,
    :THUNDERWAVE,
    :ANCIENTPOWER,
    :AURASPHERE
  ]
  pkmn.calc_stats
  return pkmn
end

#-------------------------------------------------------------------------------
# Convenience function to start the Togekiss hax demo battle.
#-------------------------------------------------------------------------------
def start_togekiss_hax_demo_battle
  PBDebug.log("[Togekiss Hax Demo] Function called - setting up battle...")
  setBattleRule("size", "2v2")
  PBDebug.log("[Togekiss Hax Demo] Battle size rule set: #{$game_temp.battle_rules["size"]}")
  setBattleRule("midbattleScript", TOGEKISS_HAX_SCRIPT)
  PBDebug.log("[Togekiss Hax Demo] Midbattle script rule set")
  pkmn1 = create_hax_togekiss
  pkmn2 = create_hax_togekiss
  PBDebug.log("[Togekiss Hax Demo] Created two Togekiss Pokemon")
  trainer = NPCTrainer.new("Duo Togekiss", :BIRDKEEPER)
  trainer.party = [pkmn1, pkmn2]
  PBDebug.log("[Togekiss Hax Demo] Starting battle with trainer: #{trainer.name}")
  TrainerBattle.start(trainer)
end

