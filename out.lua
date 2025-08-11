---@diagnostic disable: unused-local, missing-return, cast-local-type, return-type-mismatch
---@meta

---[[
---@class entity_id
---@class component_id
---@class unsigned_integer: integer
---@class physics_body_id
---@class gui
--]]

--[[
---@alias entity_id integer
---@alias component_id integer
---@alias unsigned_integer integer
---@alias physics_body_id integer
---@alias gui userdata
]]

--Hybrid mode types
--[[
---@class _entity_id
---@class _component_id
---@class unsigned_integer: integer
---@class _physics_body_id
---@class gui
---@alias entity_id _entity_id | 0
---@alias component_id _component_id | 0
---@alias physics_body_id _physics_body_id | 0
]]

---Use `bit` table to compare with these constants, damage type is a bit field.
---@alias damage_type_bit_field
---|> 0 NONE 0x0
---| 1 DAMAGE_MELEE 0x1
---| 2 DAMAGE_PROJECTILE 0x2
---| 4 DAMAGE_EXPLOSION 0x4
---| 8 DAMAGE_BITE 0x8
---| 16 DAMAGE_FIRE 0x10
---| 32 DAMAGE_MATERIAL 0x20
---| 64 DAMAGE_FALL 0x40
---| 128 DAMAGE_ELECTRICITY 0x80
---| 256 DAMAGE_DROWNING 0x100
---| 512 DAMAGE_PHYSICS_BODY_DAMAGED 0x200
---| 1024 DAMAGE_DRILL 0x400
---| 2048 DAMAGE_SLICE 0x800
---| 4096 DAMAGE_ICE 0x1000
---| 8192 DAMAGE_HEALING 0x2000
---| 16384 DAMAGE_PHYSIICS_HIT 0x4000
---| 32768 DAMAGE_RADIOACTIVE 0x8000
---| 65536 DAMAGE_POISON 0x10000
---| 131072 DAMAGE_MATERIAL_WITH_FLASH 0x20000
---| 262144 DAMAGE_OVEREATING 0x40000
---| 524288 DAMAGE_CURSE 0x80000
---| 1048576 DAMAGE_HOLY 0x100000

---@alias damage_message
---|> string
---| "$damage_projectile"
---| "$damage_electricity"
---| "$damage_explosion"
---| "$damage_fire"
---| "$damage_melee"
---| "$damage_drill"
---| "$damage_slice"
---| "$damage_ice"
---| "$damage_healing"
---| "$damage_physicshit"
---| "$damage_radioactive"
---| "$damage_poison"
---| "$damage_water"
---| "$damage_fall"
---| "$damage_drowning"
---| "$damage_frommaterial"
---| "$damage_kick"
---| "$damage_holy_mountains_curse"

---@alias OnPlayerSpawned fun(player_entity: entity_id)
---@alias OnPlayerDied fun(player_entity: entity_id)
---@alias OnMagicNumbersAndWorldSeedInitialized fun()
---@alias OnBiomeConfigLoaded fun()
---@alias OnWorldInitialized fun()
---@alias OnWorldPreUpdate fun()
---@alias OnWorldPostUpdate fun()
---@alias OnPausedChanged fun(is_paused: boolean, is_inventory_pause: boolean)
---@alias OnModPreInit fun()
---@alias OnModInit fun()
---@alias OnModPostInit fun()
---@alias OnModSettingsChanged fun()
---@alias OnPausePreUpdate fun()
---@alias OnCountSecrets fun(): total: integer, found: integer

---@alias script_damage_received fun(damage: number, message: damage_message, entity_thats_responsible: entity_id, is_fatal: boolean, projectile_thats_responsible: entity_id)
---@alias script_damage_about_to_be_received fun(damage: number, x: number, y: number, entity_thats_responsible: entity_id, critical_hit_chance: integer): new_damage: number, new_critical_hit_chance: integer
---@alias script_item_pickup fun(entity_item: entity_id, entity_pickupper: entity_id, item_name: string)
---@alias script_shot fun(projectile_entity_id: entity_id)
---@alias script_collision_trigger fun(colliding_entity_id: entity_id)
---@alias script_collision_trigger_timer_finished fun()
---@alias script_physics_body_modified fun(is_destroyed: boolean)
---@alias script_pressure_plate_change fun(new_state: boolean)
---@alias script_inhaled_material fun(material_name: string, count: integer)
---@alias script_death fun(damage_type_bit_field: damage_type_bit_field, damage_message: damage_message, entity_thats_responsible: entity_id, drop_items: boolean)
---@alias script_throw_item fun(from_x: number, from_y: number, to_x: number, to_y: number)
---@alias script_material_area_checker_failed fun(pos_x: integer, pos_y: integer)
---@alias script_material_area_checker_success fun(pos_x: integer, pos_y: integer)
---@alias script_electricity_receiver_switched fun(is_electrified: boolean)
---@alias script_electricity_receiver_electrified fun()
---@alias script_kick fun(entity_who_kicked: entity_id)
---@alias script_interacting fun(entity_who_interacted: entity_id, entity_interacted: entity_id, interactable_name: string)
---@alias script_audio_event_dead fun(bank_file: string, event_root: string)
---@alias script_wand_fired fun(gun_entity_id: entity_id)
---@alias script_teleported fun(from_x: number, from_y: number, to_x: number, to_y: number, portal_teleport: boolean)
---@alias script_portal_teleport_used fun(entity_that_was_teleported: entity_id, from_x: number, from_y: number, to_x: number, to_y: number)
---@alias script_polymorphing_to fun(target_polymorph_path: string)
---@alias script_biome_entered fun(biome_name: string, biome_old_name: string)

---@alias calculate_force_for_body_fn_type fun(body_entity: physics_body_id, body_mass: number, body_x: number, body_y: number, body_vel_x: number, body_vel_y: number, body_vel_angular: number): (force_world_pos_x: number, force_world_pos_y: number, force_x:number, force_y:number, force_angular:number)

---@alias component_type "AIAttackComponent" | "AIComponent" | "AbilityComponent" | "AdvancedFishAIComponent" | "AltarComponent" | "AnimalAIComponent" | "ArcComponent" | "AreaDamageComponent" | "AttachToEntityComponent" | "AudioComponent" | "AudioListenerComponent" | "AudioLoopComponent" | "BiomeTrackerComponent" | "BlackHoleComponent" | "BookComponent" | "BossDragonComponent" | "BossHealthBarComponent" | "CameraBoundComponent" | "CardinalMovementComponent" | "CellEaterComponent" | "CharacterCollisionComponent" | "CharacterDataComponent" | "CharacterPlatformingComponent" | "CharacterStatsComponent" | "CollisionTriggerComponent" | "ConsumableTeleportComponent" | "ControllerGoombaAIComponent" | "ControlsComponent" | "CrawlerAnimalComponent" | "CutThroughWorldDoneHereComponent" | "DamageModelComponent" | "DamageNearbyEntitiesComponent" | "DebugFollowMouseComponent" | "DebugLogMessagesComponent" | "DebugSpatialVisualizerComponent" | "DieIfSpeedBelowComponent" | "DroneLauncherComponent" | "DrugEffectComponent" | "DrugEffectModifierComponent" | "ElectricChargeComponent" | "ElectricityComponent" | "ElectricityReceiverComponent" | "ElectricitySourceComponent" | "EndingMcGuffinComponent" | "EnergyShieldComponent" | "ExplodeOnDamageComponent" | "ExplosionComponent" | "FishAIComponent" | "FlyingComponent" | "FogOfWarRadiusComponent" | "FogOfWarRemoverComponent" | "GameAreaEffectComponent" | "GameEffectComponent" | "GameLogComponent" | "GameStatsComponent" | "GasBubbleComponent" | "GenomeDataComponent" | "GhostComponent" | "GodInfoComponent" | "GunComponent" | "HealthBarComponent" | "HitEffectComponent" | "HitboxComponent" | "HomingComponent" | "HotspotComponent" | "IKLimbAttackerComponent" | "IKLimbComponent" | "IKLimbWalkerComponent" | "IKLimbsAnimatorComponent" | "IngestionComponent" | "InheritTransformComponent" | "InteractableComponent" | "Inventory2Component" | "InventoryComponent" | "InventoryGuiComponent" | "ItemAIKnowledgeComponent" | "ItemActionComponent" | "ItemAlchemyComponent" | "ItemChestComponent" | "ItemComponent" | "ItemCostComponent" | "ItemPickUpperComponent" | "ItemRechargeNearGroundComponent" | "ItemStashComponent" | "KickComponent" | "LaserEmitterComponent" | "LevitationComponent" | "LifetimeComponent" | "LightComponent" | "LightningComponent" | "LimbBossComponent" | "LiquidDisplacerComponent" | "LoadEntitiesComponent" | "LocationMarkerComponent" | "LooseGroundComponent" | "LuaComponent" | "MagicConvertMaterialComponent" | "MagicXRayComponent" | "ManaReloaderComponent" | "MaterialAreaCheckerComponent" | "MaterialInventoryComponent" | "MaterialSeaSpawnerComponent" | "MaterialSuckerComponent" | "MoveToSurfaceOnCreateComponent" | "MusicEnergyAffectorComponent" | "NinjaRopeComponent" | "NullDamageComponent" | "OrbComponent" | "ParticleEmitterComponent" | "PathFindingComponent" | "PathFindingGridMarkerComponent" | "PhysicsAIComponent" | "PhysicsBody2Component" | "PhysicsBodyCollisionDamageComponent" | "PhysicsBodyComponent" | "PhysicsImageShapeComponent" | "PhysicsJoint2Component" | "PhysicsJoint2MutatorComponent" | "PhysicsJointComponent" | "PhysicsKeepInWorldComponent" | "PhysicsPickUpComponent" | "PhysicsRagdollComponent" | "PhysicsShapeComponent" | "PhysicsThrowableComponent" | "PixelSceneComponent" | "PixelSpriteComponent" | "PlatformShooterPlayerComponent" | "PlayerCollisionComponent" | "PlayerStatsComponent" | "PositionSeedComponent" | "PotionComponent" | "PressurePlateComponent" | "ProjectileComponent" | "RotateTowardsComponent" | "SetLightAlphaFromVelocityComponent" | "SetStartVelocityComponent" | "ShotEffectComponent" | "SimplePhysicsComponent" | "SineWaveComponent" | "SpriteAnimatorComponent" | "SpriteComponent" | "SpriteOffsetAnimatorComponent" | "SpriteParticleEmitterComponent" | "SpriteStainsComponent" | "StatusEffectDataComponent" | "StreamingKeepAliveComponent" | "TelekinesisComponent" | "TeleportComponent" | "TeleportProjectileComponent" | "TextLogComponent" | "TorchComponent" | "UIIconComponent" | "UIInfoComponent" | "VariableStorageComponent" | "VelocityComponent" | "VerletPhysicsComponent" | "VerletWeaponComponent" | "VerletWorldJointComponent" | "WalletComponent" | "WalletValuableComponent" | "WorldStateComponent" | "WormAIComponent" | "WormAttractorComponent" | "WormComponent" | "WormPlayerComponent"
---lua_ls doesn't support dependent types properly so this includes the field types for *all* components
---@alias field_type "use_probability" | "min_distance" | "max_distance" | "angular_range_deg" | "state_duration_frames" | "frames_between" | "frames_between_global" | "animation_name" | "attack_landing_ranged_enabled" | "attack_ranged_action_frame" | "attack_ranged_offset_x" | "attack_ranged_offset_y" | "attack_ranged_root_offset_x" | "attack_ranged_root_offset_y" | "attack_ranged_use_message" | "attack_ranged_predict" | "attack_ranged_entity_file" | "attack_ranged_entity_count_min" | "attack_ranged_entity_count_max" | "attack_ranged_use_laser_sight" | "attack_ranged_aim_rotation_enabled" | "attack_ranged_aim_rotation_speed" | "attack_ranged_aim_rotation_shooting_ok_angle_deg" | "mRangedAttackCurrentAimAngle" | "mNextFrameUsable" | "TEMP_TEMP_TEMP" | "data" | "cooldown_frames" | "entity_file" | "sprite_file" | "entity_count" | "never_reload" | "reload_time_frames" | "mana" | "mana_max" | "mana_charge_speed" | "rotate_in_hand" | "rotate_in_hand_amount" | "rotate_hand_amount" | "fast_projectile" | "swim_propel_amount" | "max_charged_actions" | "charge_wait_frames" | "item_recoil_recovery_speed" | "item_recoil_max" | "item_recoil_offset_coeff" | "item_recoil_rotation_coeff" | "base_item_file" | "use_entity_file_as_projectile_info_proxy" | "click_to_use" | "stat_times_player_has_shot" | "stat_times_player_has_edited" | "shooting_reduces_amount_in_inventory" | "throw_as_item" | "simulate_throw_as_item" | "max_amount_in_inventory" | "amount_in_inventory" | "drop_as_item_on_death" | "ui_name" | "use_gun_script" | "is_petris_gun" | "gun_level" | "add_these_child_actions" | "current_slot_durability" | "slot_consumption_function" | "mNextFrameUsable" | "mCastDelayStartFrame" | "mReloadFramesLeft" | "mReloadNextFrameUsable" | "mChargeCount" | "mIsInitialized" | "mAmmoLeft" | "mNextChargeFrame" | "mItemRecoil" | "move_check_range_min" | "move_check_range_max" | "flock" | "avoid_predators" | "mHasTargetDirection" | "mTargetPos" | "mTargetVec" | "mLastFramesMovementAreaMin" | "mLastFramesMovementAreaMax" | "mNumFailedTargetSearches" | "mNextFrameCheckAreWeStuck" | "mNextFrameCheckFlockWants" | "mNextFramePredatorAvoidance" | "mScared" | "mWantsToBeInFlock" | "recognized_entity_tags" | "uses_remaining" | "good_fx_material" | "neutral_fx_material" | "evil_fx_material" | "m_recognized_entity_tags" | "m_recognized_entity_tags_count" | "m_current_entity_tags" | "ai_state" | "ai_state_timer" | "keep_state_alive_when_enabled" | "preferred_job" | "escape_if_damaged_probability" | "attack_if_damaged_probability" | "eye_offset_x" | "eye_offset_y" | "attack_only_if_attacked" | "dont_counter_attack_own_herd" | "creature_detection_range_x" | "creature_detection_range_y" | "creature_detection_angular_range_deg" | "creature_detection_check_every_x_frames" | "max_distance_to_cam_to_start_hunting" | "pathfinding_max_depth_no_target" | "pathfinding_max_depth_has_target" | "aggressiveness_min" | "aggressiveness_max" | "tries_to_ranged_attack_friends" | "attack_melee_enabled" | "attack_dash_enabled" | "attack_landing_ranged_enabled" | "attack_ranged_enabled" | "attack_knockback_multiplier" | "is_static_turret" | "attack_melee_max_distance" | "attack_melee_action_frame" | "attack_melee_frames_between" | "attack_melee_damage_min" | "attack_melee_damage_max" | "attack_melee_impulse_vector_x" | "attack_melee_impulse_vector_y" | "attack_melee_impulse_multiplier" | "attack_melee_offset_x" | "attack_melee_offset_y" | "attack_melee_finish_enabled" | "attack_melee_finish_action_frame" | "attack_dash_distance" | "attack_dash_frames_between" | "attack_dash_damage" | "attack_dash_speed" | "attack_dash_lob" | "attack_ranged_min_distance" | "attack_ranged_max_distance" | "attack_ranged_action_frame" | "attack_ranged_offset_x" | "attack_ranged_offset_y" | "attack_ranged_use_message" | "attack_ranged_predict" | "attack_ranged_entity_file" | "attack_ranged_entity_count_min" | "attack_ranged_entity_count_max" | "attack_ranged_use_laser_sight" | "attack_ranged_laser_sight_beam_kind" | "attack_ranged_aim_rotation_enabled" | "attack_ranged_aim_rotation_speed" | "attack_ranged_aim_rotation_shooting_ok_angle_deg" | "attack_ranged_state_duration_frames" | "hide_from_prey" | "hide_from_prey_target_distance" | "hide_from_prey_time" | "food_eating_create_particles" | "eating_area_radius_x" | "eating_area_radius_y" | "mouth_offset_x" | "mouth_offset_y" | "defecates_and_pees" | "butt_offset_x" | "butt_offset_y" | "pee_velocity_x" | "pee_velocity_y" | "needs_food" | "sense_creatures" | "sense_creatures_through_walls" | "can_fly" | "can_walk" | "path_distance_to_target_node_to_turn_around" | "path_cleanup_explosion_radius" | "max_distance_to_move_from_home" | "attack_ranged_frames_between" | "food_material" | "food_particle_effect_material" | "mAggression" | "mAiStateStack" | "mAiStateLastSwitchFrame" | "mAiStatePrev" | "mCreatureDetectionNextCheck" | "mGreatestThreat" | "mGreatestPrey" | "mSelectedMultiAttack" | "mHasFoundPrey" | "mHasBeenAttackedByPlayer" | "mHasStartedAttacking" | "mNearbyFoodCount" | "mEatNextFrame" | "mEatTime" | "mFrameNextGiveUp" | "mLastFramesMovementAreaMin" | "mLastFramesMovementAreaMax" | "mFoodMaterialId" | "mFoodParticleEffectMaterialId" | "mNextJumpLob" | "mNextJumpTarget" | "mNextJumpHasVelocity" | "mLastFrameJumped" | "mFramesWithoutTarget" | "mLastFrameCanDamageOwnHerd" | "mHomePosition" | "mLastFrameAttackWasDone" | "mNextFrameCanCallFriend" | "mNextFrameRespondFriend" | "mHasNoticedPlayer" | "mRangedAttackCurrentAimAngle" | "mRangedAttackNextFrame" | "mMeleeAttackNextFrame" | "mNextMeleeAttackDamage" | "mMeleeAttacking" | "mMeleeAttackDashNextFrame" | "mCurrentJob" | "lifetime" | "type" | "material" | "mArcTarget" | "circle_radius" | "damage_per_frame" | "update_every_n_frame" | "entity_responsible" | "death_cause" | "entities_with_tag" | "aabb_min" | "aabb_max" | "damage_type" | "only_position" | "target_hotspot_tag" | "target_sprite_id" | "rotate_based_on_x_scale" | "destroy_component_when_target_is_gone" | "Transform" | "target" | "mUpdateFrame" | "file" | "event_root" | "audio_physics_material" | "set_latest_event_position" | "remove_latest_event_on_destroyed" | "send_message_on_event_dead" | "play_only_if_visible" | "m_audio_physics_material" | "m_latest_source" | "z" | "file" | "event_name" | "auto_play" | "auto_play_if_enabled" | "play_on_component_enable" | "calculate_material_lowpass" | "set_speed_parameter" | "set_speed_parameter_only_based_on_x_movement" | "set_speed_parameter_only_based_on_y_movement" | "volume_autofade_speed" | "m_volume" | "m_intensity" | "m_intensity2" | "m_source" | "m_frame_created" | "limit_to_every_n_frame" | "unsafe_current_biome" | "current_biome_name" | "radius" | "particle_attractor_force" | "damage_probability" | "damage_amount" | "m_particle_attractor_id" | "TEMP_TEMPY" | "TEMP_TEMP_TEMP" | "speed" | "speed_hunt" | "acceleration" | "direction_adjust_speed" | "direction_adjust_speed_hunt" | "gravity" | "tail_gravity" | "part_distance" | "ground_check_offset" | "eat_ground_radius" | "eat_ground" | "hitbox_radius" | "bite_damage" | "target_kill_radius" | "target_kill_ragdoll_force" | "hunt_box_radius" | "random_target_box_radius" | "new_hunt_target_check_every" | "new_random_target_check_every" | "jump_cam_shake" | "jump_cam_shake_distance" | "eat_anim_wait_mult" | "projectile_1" | "projectile_1_count" | "projectile_2" | "projectile_2_count" | "ragdoll_filename" | "mTargetEntityId" | "mTargetVec" | "mGravVelocity" | "mSpeed" | "mRandomTarget" | "mLastLivingTargetPos" | "mNextTargetCheckFrame" | "mNextHuntTargetCheckFrame" | "mOnGroundPrev" | "mMaterialIdPrev" | "mPhase" | "mNextPhaseSwitchTime" | "mPartDistance" | "mIsInitialized" | "gui" | "gui_special_final_boss" | "in_world" | "gui_max_distance_visible" | "mOldSpritesDestroyed" | "enabled" | "distance" | "distance_border" | "max_count" | "freeze_on_distance_kill" | "freeze_on_max_count_kill" | "horizontal_movement" | "vertical_movement" | "intercardinal_movement" | "mPrevPos" | "radius" | "eat_probability" | "only_stain" | "eat_dynamic_physics_bodies" | "limited_materials" | "ignored_material_tag" | "ignored_material" | "materials" | "getting_crushed_threshold" | "moving_up_before_getting_crushed_threshold" | "getting_crushed_counter" | "stuck_in_ground_counter" | "mCollidedHorizontally" | "platforming_type" | "mass" | "buoyancy_check_offset_y" | "liquid_velocity_coeff" | "gravity" | "fly_recharge_spd" | "fly_recharge_spd_ground" | "flying_needs_recharge" | "flying_in_air_wait_frames" | "flying_recharge_removal_frames" | "climb_over_y" | "check_collision_max_size_x" | "check_collision_max_size_y" | "is_on_ground" | "is_on_slippery_ground" | "ground_stickyness" | "effect_hit_ground" | "eff_hg_damage_min" | "eff_hg_damage_max" | "eff_hg_position_x" | "eff_hg_position_y" | "eff_hg_size_x" | "eff_hg_size_y" | "eff_hg_velocity_min_x" | "eff_hg_velocity_max_x" | "eff_hg_velocity_min_y" | "eff_hg_velocity_max_y" | "eff_hg_offset_y" | "eff_hg_update_box2d" | "eff_hg_b2force_multiplier" | "destroy_ground" | "send_transform_update_message" | "dont_update_velocity_and_xform" | "mFlyingTimeLeft" | "collision_aabb_min_x" | "collision_aabb_max_x" | "collision_aabb_min_y" | "collision_aabb_max_y" | "fly_time_max" | "mFramesOnGround" | "mLastFrameOnGround" | "mVelocity" | "mCollidedHorizontally" | "jump_velocity_x" | "jump_velocity_y" | "jump_keydown_buffer" | "fly_speed_mult" | "fly_speed_change_spd" | "fly_model_player" | "fly_smooth_y" | "accel_x" | "accel_x_air" | "pixel_gravity" | "swim_idle_buoyancy_coeff" | "swim_down_buoyancy_coeff" | "swim_up_buoyancy_coeff" | "swim_drag" | "swim_extra_horizontal_drag" | "mouse_look" | "mouse_look_buffer" | "keyboard_look" | "turning_buffer" | "animation_to_play" | "animation_to_play_next" | "run_animation_velocity_switching_threshold" | "run_animation_velocity_switching_enabled" | "turn_animation_frames_between" | "precision_jumping_max_duration_frames" | "audio_liquid_splash_intensity" | "velocity_min_x" | "velocity_max_x" | "velocity_min_y" | "velocity_max_y" | "run_velocity" | "fly_velocity_x" | "fly_speed_max_up" | "fly_speed_max_down" | "mExAnimationPos" | "mFramesInAirCounter" | "mIsPrecisionJumping" | "mPrecisionJumpingTime" | "mPrecisionJumpingSpeedX" | "mPrecisionJumpingTimeLeft" | "mFlyThrottle" | "mSmoothedFlyingTargetY" | "mJetpackEmitting" | "mNextTurnAnimationFrame" | "mFramesNotSwimming" | "mFramesSwimming" | "mShouldCrouch" | "mShouldCrouchPrev" | "mLastPostureSwitchFrame" | "mLookOverrideLastFrame" | "mLookOverrideDirection" | "stats" | "width" | "height" | "radius" | "required_tag" | "remove_component_when_triggered" | "destroy_this_entity_when_triggered" | "timer_for_destruction" | "self_trigger" | "skip_self_frames" | "mTimer" | "create_other_end" | "is_at_home" | "collision_radius" | "target_id" | "id" | "mNextUsableFrame" | "mHasOtherEnd" | "target_location" | "auto_turn_around_enabled" | "wait_to_turn_around" | "wall_hit_wait" | "check_wall_detection" | "wall_detection_aabb_min_x" | "wall_detection_aabb_max_x" | "wall_detection_aabb_min_y" | "wall_detection_aabb_max_y" | "check_floor_detection" | "floor_detection_aabb_min_x" | "floor_detection_aabb_max_x" | "floor_detection_aabb_min_y" | "floor_detection_aabb_max_y" | "mChangingDirectionCounter" | "polymorph_hax" | "polymorph_next_attack_frame" | "enabled" | "gamepad_indirect_aiming_enabled" | "gamepad_fire_on_thumbstick_extend" | "gamepad_fire_on_thumbstick_extend_threshold" | "mButtonDownFire" | "mButtonFrameFire" | "mButtonLastFrameFire" | "mButtonDownFire2" | "mButtonFrameFire2" | "mButtonDownAction" | "mButtonFrameAction" | "mButtonDownThrow" | "mButtonFrameThrow" | "mButtonDownInteract" | "mButtonFrameInteract" | "mButtonDownLeft" | "mButtonFrameLeft" | "mButtonDownRight" | "mButtonFrameRight" | "mButtonDownUp" | "mButtonFrameUp" | "mButtonDownDown" | "mButtonFrameDown" | "mButtonDownJump" | "mButtonFrameJump" | "mButtonDownRun" | "mButtonFrameRun" | "mButtonDownFly" | "mButtonFrameFly" | "mButtonDownDig" | "mButtonFrameDig" | "mButtonDownChangeItemR" | "mButtonFrameChangeItemR" | "mButtonCountChangeItemR" | "mButtonDownChangeItemL" | "mButtonFrameChangeItemL" | "mButtonCountChangeItemL" | "mButtonDownInventory" | "mButtonFrameInventory" | "mButtonDownHolsterItem" | "mButtonFrameHolsterItem" | "mButtonDownDropItem" | "mButtonFrameDropItem" | "mButtonDownKick" | "mButtonFrameKick" | "mButtonDownEat" | "mButtonFrameEat" | "mButtonDownLeftClick" | "mButtonFrameLeftClick" | "mButtonDownRightClick" | "mButtonFrameRightClick" | "mButtonDownTransformLeft" | "mButtonFrameTransformLeft" | "mButtonDownTransformRight" | "mButtonFrameTransformRight" | "mButtonDownTransformUp" | "mButtonFrameTransformUp" | "mButtonCountTransformUp" | "mButtonDownTransformDown" | "mButtonFrameTransformDown" | "mButtonCountTransformDown" | "mFlyingTargetY" | "mAimingVector" | "mAimingVectorNormalized" | "mAimingVectorNonZeroLatest" | "mGamepadAimingVectorRaw" | "mJumpVelocity" | "mMousePosition" | "mMousePositionRaw" | "mMousePositionRawPrev" | "mMouseDelta" | "mGamepadIndirectAiming" | "mGamePadCursorInWorld" | "mButtonDownDelayLineFire" | "mButtonDownDelayLineFire2" | "mButtonDownDelayLineRight" | "mButtonDownDelayLineLeft" | "mButtonDownDelayLineUp" | "mButtonDownDelayLineDown" | "mButtonDownDelayLineKick" | "mButtonDownDelayLineThrow" | "mButtonDownDelayLineJump" | "mButtonDownDelayLineFly" | "input_latency_frames" | "ray_length" | "ray_count" | "gravity" | "terminal_velocity" | "speed" | "give_up_area_radius" | "give_up_time" | "attack_from_ceiling_check_ray_length" | "attack_from_ceiling_check_every_n_frames" | "collision_damage" | "collision_damage_radius" | "collision_damage_frames_between" | "animate" | "mDir" | "mFrameNextGiveUp" | "mFrameNextDamage" | "mFrameNextAttackFromCeilingCheck" | "mMin" | "mMax" | "mPrevNonSnappedPosition" | "mPrevCellPosition" | "mPrevCellPosition2" | "mPrevCellPosition3" | "mPrevCellPosition4" | "mPrevCellPosition5" | "mPrevCellPosition6" | "mPrevCellPosition7" | "mPrevCellPosition8" | "mLatestPosition" | "mPrevFalling" | "mIsInitialized" | "mVelocityY" | "mAngle" | "mMovementStepAccumulator" | "id_of_done_cut" | "hp" | "max_hp" | "max_hp_cap" | "max_hp_old" | "critical_damage_resistance" | "invincibility_frames" | "falling_damages" | "falling_damage_height_min" | "falling_damage_height_max" | "falling_damage_damage_min" | "falling_damage_damage_max" | "air_needed" | "air_in_lungs" | "air_in_lungs_max" | "air_lack_of_damage" | "minimum_knockback_force" | "materials_damage" | "material_damage_min_cell_count" | "materials_that_damage" | "materials_how_much_damage" | "materials_damage_proportional_to_maxhp" | "physics_objects_damage" | "materials_create_messages" | "materials_that_create_messages" | "ragdoll_filenames_file" | "ragdoll_material" | "ragdoll_offset_x" | "ragdoll_offset_y" | "blood_material" | "blood_spray_material" | "blood_spray_create_some_cosmetic" | "blood_multiplier" | "ragdoll_blood_amount_absolute" | "blood_sprite_directional" | "blood_sprite_large" | "healing_particle_effect_entity" | "create_ragdoll" | "ragdollify_child_entity_sprites" | "ragdollify_root_angular_damping" | "ragdollify_disintegrate_nonroot" | "wait_for_kill_flag_on_death" | "kill_now" | "drop_items_on_death" | "ui_report_damage" | "ui_force_report_damage" | "in_liquid_shooting_electrify_prob" | "wet_status_effect_damage" | "is_on_fire" | "fire_probability_of_ignition" | "fire_how_much_fire_generates" | "fire_damage_ignited_amount" | "fire_damage_amount" | "mLastElectricityResistanceFrame" | "mLastFrameReportedBlock" | "mLastMaxHpChangeFrame" | "ragdoll_fx_forced" | "mIsOnFire" | "mFireProbability" | "mFireFramesLeft" | "mFireDurationFrames" | "mFireTriedIgniting" | "mLastCheckX" | "mLastCheckY" | "mLastCheckTime" | "mLastMaterialDamageFrame" | "mFallIsOnGround" | "mFallHighestY" | "mFallCount" | "mAirAreWeInWater" | "mAirFramesNotInWater" | "mAirDoWeHave" | "mTotalCells" | "mLiquidCount" | "mLiquidMaterialWeAreIn" | "mDamageMaterials" | "mDamageMaterialsHowMuch" | "mCollisionMessageMaterials" | "mCollisionMessageMaterialCountsThisFrame" | "mMaterialDamageThisFrame" | "mFallDamageThisFrame" | "mElectricityDamageThisFrame" | "mPhysicsDamageThisFrame" | "mPhysicsDamageVecThisFrame" | "mPhysicsDamageLastFrame" | "mPhysicsDamageEntity" | "mPhysicsDamageTelekinesisCasterEntity" | "mLastDamageFrame" | "mHpBeforeLastDamage" | "mFireDamageBuffered" | "mFireDamageBufferedNextDeliveryFrame" | "radius" | "damage_min" | "damage_max" | "target_vec_max_len" | "knockback_multiplier" | "time_between_damaging" | "damage_description" | "target_tag" | "damage_type" | "ragdoll_fx" | "mVelocity" | "mNextDamageFrame" | "TEMP_TEMPY" | "TEMP_TEMP_TEMP" | "min_x" | "min_y" | "max_x" | "max_y" | "color" | "min_speed" | "mMinSpeedSquared" | "drone_entity_file" | "charge_time_frames" | "fx_velocity_max" | "electricity_emission_interval_frames" | "fx_emission_interval_min" | "fx_emission_interval_max" | "charge" | "energy" | "probability_to_heat" | "speed" | "splittings_min" | "splittings_max" | "splitting_energy_min" | "splitting_energy_max" | "hack_is_material_crack" | "hack_crack_ice" | "hack_is_set_fire" | "mSplittingsLeft" | "mSplittingEnergy" | "mAvgDir" | "mPrevPos" | "mPrevMaterial" | "mShouldPlaySound" | "offset_x" | "offset_y" | "radius" | "active_time_frames" | "switch_on_msg_interval_frames" | "electrified_msg_interval_frames" | "mLastFrameElectrified" | "mNextElectrifiedMsgFrame" | "mNextSwitchOnMsgFrame" | "radius" | "emission_interval_frames" | "mNextFrameEmitElectricity" | "TEMP_TEMPY" | "TEMP_TEMP_TEMP" | "radius" | "damage_multiplier" | "max_energy" | "energy_required_to_shield" | "recharge_speed" | "sector_degrees" | "energy" | "mPrevPosition" | "explode_on_death_percent" | "explode_on_damage_percent" | "physics_body_modified_death_probability" | "physics_body_destruction_required" | "mDone" | "timeout_frames" | "timeout_frames_random" | "kill_entity" | "mTimerTriggerFrame" | "trigger" | "direction" | "speed" | "aabb_min" | "aabb_max" | "velocity" | "stuck_counter" | "mLastCheckPos" | "type" | "perlin_freq" | "perlin_time_freq" | "perlin_wind_x" | "perlin_wind_y" | "radius" | "radius" | "radius" | "collide_with_tag" | "frame_length" | "game_effect_entitities" | "mEntitiesAppliedOutTo" | "mEntitiesAppliedFrame" | "custom_effect_id" | "frames" | "exclusivity_group" | "report_block_msg" | "disable_movement" | "ragdoll_effect_custom_entity_file" | "ragdoll_fx_custom_entity_apply_only_to_largest_body" | "polymorph_target" | "mSerializedData" | "mCaster" | "mCasterHerdId" | "teleportation_probability" | "teleportation_delay_min_frames" | "teleportation_radius_min" | "teleportation_radius_max" | "teleportations_num" | "no_heal_max_hp_cap" | "caused_by_ingestion_status_effect" | "caused_by_stains" | "mCharmDisabledCameraBound" | "mCharmEnabledTeleporting" | "mInvisible" | "mCounter" | "mCooldown" | "mIsExtension" | "mIsSpent" | "effect" | "ragdoll_effect" | "ragdoll_material" | "causing_status_effect" | "report_death" | "report_damage" | "report_new_biomes" | "mVisitiedBiomes" | "mNewBiomeCheckFrame" | "name" | "stats_filename" | "is_player" | "extra_death_msg" | "dont_do_logplayerkill" | "player_polymorph_count" | "acceleration" | "max_speed" | "mVelocity" | "is_predator" | "food_chain_rank" | "berserk_dont_attack_friends" | "herd_id" | "friend_thundermage" | "friend_firemage" | "speed" | "new_hunt_target_check_every" | "hunt_box_radius" | "aggressiveness" | "max_distance_from_home" | "die_if_no_home" | "target_tag" | "velocity" | "mEntityHome" | "mFramesWithoutHome" | "mTargetPosition" | "mTargetEntityId" | "mRandomTarget" | "mNextTargetCheckFrame" | "mana_current" | "mana_max" | "gold" | "god_entity" | "mLuaManager" | "value" | "value_string" | "condition_effect" | "condition_status" | "effect_hit" | "is_player" | "is_enemy" | "is_item" | "aabb_min_x" | "aabb_max_x" | "aabb_min_y" | "aabb_max_y" | "damage_multiplier" | "offset" | "dead" | "target_tag" | "target_who_shot" | "detect_distance" | "homing_velocity_multiplier" | "homing_targeting_coeff" | "just_rotate_towards_target" | "max_turn_rate" | "predefined_target" | "look_for_root_entities_only" | "transform_with_scale" | "sprite_hotspot_name" | "offset" | "radius" | "leg_velocity_coeff" | "targeting_radius" | "targeting_raytrace" | "target_entities_with_tag" | "mTarget" | "mTargetEntity" | "mState" | "mStateTimer" | "length" | "thigh_extra_lenght" | "mJointSideInterpolation" | "end_position" | "mJointWorldPos" | "mEndPrevPos" | "mPart0PrevPos" | "mPart0PrevRotation" | "mPart1PrevPos" | "mPart1PrevRotation" | "ground_attachment_min_spread" | "ground_attachment_max_tries" | "ground_attachment_max_angle" | "ground_attachment_ray_length_coeff" | "leg_velocity_coeff" | "affect_flying" | "mState" | "ray_skip_material" | "mTarget" | "mPrevTarget" | "mPrevCenterPosition" | "future_state_samples" | "ground_attachment_ray_length_coeff" | "leg_velocity_coeff" | "affect_flying" | "large_movement_penalty_coeff" | "no_ground_attachment_penalty_coeff" | "is_limp" | "ray_skip_material" | "mPrevBodyPosition" | "mLimbStates" | "mHasGroundAttachmentOnAnyLeg" | "ingestion_size" | "ingestion_capacity" | "ingestion_cooldown_delay_frames" | "ingestion_reduce_every_n_frame" | "overingestion_damage" | "blood_healing_speed" | "ingestion_satiation_material_tag" | "m_ingestion_cooldown_frames" | "m_next_overeating_msg_frame" | "m_ingestion_satiation_material_tag_cached" | "m_ingestion_satiation_material_cache" | "m_damage_effect_lifetime" | "use_root_parent" | "only_position" | "parent_hotspot_tag" | "parent_sprite_id" | "always_use_immediate_parent_rotation" | "rotate_based_on_x_scale" | "Transform" | "mUpdateFrame" | "radius" | "ui_text" | "name" | "exclusivity_group" | "quick_inventory_slots" | "full_inventory_slots_x" | "full_inventory_slots_y" | "mSavedActiveItemIndex" | "mActiveItem" | "mActualActiveItem" | "mActiveStash" | "mThrowItem" | "mItemHolstered" | "mInitialized" | "mForceRefresh" | "mDontLogNextItemEquip" | "mSmoothedItemXOffset" | "mLastItemSwitchFrame" | "mIntroEquipItemLerp" | "mSmoothedItemAngleVec" | "ui_container_type" | "ui_element_sprite" | "actions" | "ui_container_size" | "ui_element_size" | "ui_position_on_screen" | "update_listener" | "items" | "has_opened_inventory_edit" | "wallet_money_target" | "mDisplayFireRateWaitBar" | "imgui" | "mLastFrameInteracted" | "mLastFrameActionsVisible" | "mLastPurchasedAction" | "mActive" | "mAlpha" | "mBackgroundOverlayAlpha" | "mFrameShake_ReloadBar" | "mFrameShake_ManaBar" | "mFrameShake_FlyBar" | "mFrameShake_FireRateWaitBar" | "is_ranged_weapon" | "is_throwable_weapon" | "is_melee_weapon" | "is_self_healing" | "is_other_healing" | "is_self_buffing" | "is_other_buffing" | "is_weapon" | "is_known" | "is_safe" | "is_consumed" | "never_use" | "ranged_min_distance" | "action_id" | "material_make_always_cast" | "material_remove_shuffle" | "material_animate_wand" | "material_animate_wand_alt" | "material_increase_uses_remaining" | "material_sacrifice" | "item_count_min" | "item_count_max" | "level" | "enemy_drop" | "actions" | "action_uses_remaining" | "other_entities_to_spawn" | "mSeed" | "item_name" | "is_stackable" | "is_consumable" | "stats_count_as_item_pick_up" | "auto_pickup" | "permanently_attached" | "uses_remaining" | "is_identified" | "is_frozen" | "collect_nondefault_actions" | "remove_on_death" | "remove_on_death_if_empty" | "remove_default_child_actions_on_death" | "play_hover_animation" | "play_spinning_animation" | "is_equipable_forced" | "play_pick_sound" | "drinkable" | "max_child_items" | "ui_sprite" | "ui_description" | "enable_orb_hacks" | "is_all_spells_book" | "always_use_item_name_in_ui" | "custom_pickup_string" | "ui_display_description_on_pick_up_hint" | "next_frame_pickable" | "npc_next_frame_pickable" | "is_pickable" | "is_hittable_always" | "item_pickup_radius" | "camera_max_distance" | "camera_smooth_speed_multiplier" | "has_been_picked_by_player" | "mFramePickedUp" | "spawn_pos" | "preferred_inventory" | "inventory_slot" | "mItemUid" | "mIsIdentified" | "cost" | "stealable" | "mExCost" | "is_in_npc" | "pick_up_any_item_buggy" | "is_immune_to_kicks" | "only_pick_this_entity" | "drop_items_on_death" | "mLatestItemOverlapInfoBoxPosition" | "TEMP_TEMPY" | "TEMP_TEMP_TEMP" | "throw_openable_cooldown_frames" | "init_children" | "mNextFrameOpenable" | "mFrameOpened" | "can_kick" | "kick_radius" | "telekinesis_throw_speed" | "kick_entities" | "max_force" | "player_kickforce" | "kick_damage" | "kick_knockback" | "is_emitting" | "emit_until_frame" | "laser_angle_add_rad" | "radius" | "entity_force" | "box2d_force" | "effect_lifetime_frames" | "lifetime" | "fade_sprites" | "kill_parent" | "kill_all_parents" | "serialize_duration" | "kill_frame_serialized" | "creation_frame_serialized" | "randomize_lifetime" | "creation_frame" | "kill_frame" | "update_properties" | "radius" | "r" | "g" | "b" | "offset_x" | "offset_y" | "fade_out_time" | "blinking_freq" | "mAlpha" | "mSprite" | "sprite_lightning_file" | "is_projectile" | "explosion_type" | "arc_lifetime" | "mExPosition" | "mArcTarget" | "state" | "mStatePrev" | "mMoveToPositionX" | "mMoveToPositionY" | "radius" | "velocity_x" | "velocity_y" | "mPrevX" | "mPrevY" | "entity_file" | "kill_entity" | "timeout_frames" | "mTimerTriggerFrame" | "count" | "id" | "probability" | "max_durability" | "max_distance" | "max_angle" | "min_radius" | "max_radius" | "chunk_probability" | "chunk_max_angle" | "chunk_count" | "collapse_images" | "chunk_material" | "mChunkCount" | "script_source_file" | "execute_on_added" | "execute_on_removed" | "execute_every_n_frame" | "execute_times" | "limit_how_many_times_per_frame" | "limit_to_every_n_frame" | "limit_all_callbacks" | "remove_after_executed" | "enable_coroutines" | "call_init_function" | "script_enabled_changed" | "script_damage_received" | "script_damage_about_to_be_received" | "script_item_picked_up" | "script_shot" | "script_collision_trigger_hit" | "script_collision_trigger_timer_finished" | "script_physics_body_modified" | "script_pressure_plate_change" | "script_inhaled_material" | "script_death" | "script_throw_item" | "script_material_area_checker_failed" | "script_material_area_checker_success" | "script_electricity_receiver_switched" | "script_electricity_receiver_electrified" | "script_kick" | "script_interacting" | "script_audio_event_dead" | "script_wand_fired" | "script_teleported" | "script_portal_teleport_used" | "script_polymorphing_to" | "script_biome_entered" | "mLastExecutionFrame" | "mTimesExecutedThisFrame" | "mModAppendsDone" | "vm_type" | "mNextExecutionTime" | "mTimesExecuted" | "mLuaManager" | "mPersistentValues" | "radius" | "min_radius" | "is_circle" | "steps_per_frame" | "from_material_tag" | "from_any_material" | "clean_stains" | "extinguish_fire" | "fan_the_flames" | "temperature_reaction_temp" | "ignite_materials" | "loop" | "kill_when_finished" | "convert_entities" | "stain_frozen" | "reaction_audio_amount" | "convert_same_material" | "from_material_array" | "to_material_array" | "mRadius" | "from_material" | "to_material" | "mUseArrays" | "mFromMaterialArray" | "mToMaterialArray" | "radius" | "steps_per_frame" | "mStep" | "mRadius" | "update_every_x_frame" | "look_for_failure" | "count_min" | "always_check_fullness" | "kill_after_message" | "area_aabb" | "material" | "material2" | "mPosition" | "mLastFrameChecked" | "drop_as_item" | "on_death_spill" | "leak_gently" | "leak_on_damage_percent" | "leak_pressure_min" | "leak_pressure_max" | "min_damage_to_leak" | "b2_force_on_leak" | "death_throw_particle_velocity_coeff" | "kill_when_empty" | "halftime_materials" | "do_reactions" | "do_reactions_explosions" | "do_reactions_entities" | "reaction_speed" | "reactions_shaking_speeds_up" | "max_capacity" | "audio_collision_size_modifier_amount" | "last_frame_drank" | "count_per_material_type" | "is_death_handled" | "ex_position" | "ex_angle" | "speed" | "sine_wavelength" | "sine_amplitude" | "noise_scale" | "noise_threshold" | "m_position" | "frames_run" | "material" | "size" | "offset" | "material_type" | "barrel_size" | "num_cells_sucked_per_frame" | "set_projectile_to_liquid" | "last_material_id" | "suck_gold" | "suck_health" | "suck_static_materials" | "suck_tag" | "mAmountUsed" | "randomized_position" | "mGoldAccumulator" | "mLastFramePickedGold" | "lookup_radius" | "offset_from_surface" | "ray_count" | "verlet_min_joint_distance" | "type" | "energy_target" | "fade_range" | "trigger_danger_music" | "fog_of_war_threshold" | "is_enemy" | "energy_lerp_up_speed_multiplier" | "max_length" | "mLength" | "mSegments" | "null_chance" | "orb_id" | "emitted_material_name" | "create_real_particles" | "emit_real_particles" | "emit_cosmetic_particles" | "cosmetic_force_create" | "render_back" | "render_ultrabright" | "collide_with_grid" | "collide_with_gas_and_fire" | "particle_single_width" | "emit_only_if_there_is_space" | "emitter_lifetime_frames" | "fire_cells_dont_ignite_damagemodel" | "color_is_based_on_pos" | "custom_alpha" | "x_pos_offset_min" | "y_pos_offset_min" | "x_pos_offset_max" | "y_pos_offset_max" | "area_circle_sector_degrees" | "x_vel_min" | "x_vel_max" | "y_vel_min" | "y_vel_max" | "direction_random_deg" | "velocity_always_away_from_center" | "lifetime_min" | "lifetime_max" | "airflow_force" | "airflow_time" | "airflow_scale" | "friction" | "attractor_force" | "emission_interval_min_frames" | "emission_interval_max_frames" | "emission_chance" | "delay_frames" | "is_emitting" | "use_material_inventory" | "is_trail" | "trail_gap" | "render_on_grid" | "fade_based_on_lifetime" | "draw_as_long" | "b2_force" | "set_magic_creation" | "image_animation_file" | "image_animation_colors_file" | "image_animation_speed" | "image_animation_loop" | "image_animation_phase" | "image_animation_emission_probability" | "image_animation_raytrace_from_center" | "image_animation_use_entity_rotation" | "ignore_transform_updated_msg" | "color" | "offset" | "area_circle_radius" | "gravity" | "count_min" | "count_max" | "custom_style" | "mExPosition" | "mMaterialInventoryMax" | "m_material_id" | "m_next_emit_frame" | "m_has_emitted" | "m_last_emit_position" | "m_cached_image_animation" | "m_image_based_animation_time" | "m_collision_angles" | "m_particle_attractor_id" | "search_depth_max_no_goal" | "iterations_max_no_goal" | "search_depth_max_with_goal" | "iterations_max_with_goal" | "cost_of_flying" | "distance_to_reach_node_x" | "distance_to_reach_node_y" | "frames_to_get_stuck" | "frames_between_searches" | "y_walking_compensation" | "can_fly" | "can_walk" | "can_jump" | "can_dive" | "can_swim_on_surface" | "never_consider_line_of_sight" | "space_required" | "max_jump_distance_from_camera" | "jump_speed" | "initial_jump_lob" | "initial_jump_max_distance_x" | "initial_jump_max_distance_y" | "read_state" | "jump_trajectories" | "input" | "job_result_receiver" | "waiting_for" | "next_search_frame" | "path" | "path_next_node" | "path_next_node_vector_to" | "path_next_node_distance_to" | "path_previous_node" | "path_frames_stuck" | "path_is_stuck" | "path_last_frame_with_job" | "mLogic" | "mFallbackLogic" | "mSelectedLogic" | "mEnabled" | "mState" | "mTimesStuck" | "mNextClearDontApproachListFrame" | "mNodeProximityCheckCorrectionY" | "debug_path" | "jump_velocity_multiplier" | "marker_work_flag" | "marker_offset_x" | "marker_offset_y" | "player_marker_radius" | "mNode" | "target_vec_max_len" | "force_coeff" | "force_balancing_coeff" | "force_max" | "torque_coeff" | "torque_balancing_coeff" | "torque_max" | "torque_damaged_max" | "torque_jump_random" | "damage_deactivation_probability" | "damage_deactivation_time_min" | "damage_deactivation_time_max" | "die_on_remaining_mass_percentage" | "levitate" | "v0_jump_logic" | "v0_swim_logic" | "v0_body_id_logic" | "swim_check_y_min" | "swim_check_y_max" | "swim_check_side_x" | "swim_check_side_y" | "keep_inside_world" | "free_if_static" | "rotation_speed" | "mStartingMass" | "mMainBodyFound" | "mNextFrameActive" | "mRotationTarget" | "mLastPositionWhenHadPath" | "mHasLastPosition" | "mBodyId" | "linear_damping" | "angular_damping" | "allow_sleep" | "fixed_rotation" | "is_bullet" | "is_static" | "buoyancy" | "hax_fix_going_through_ground" | "hax_fix_going_through_sand" | "hax_wait_till_pixel_scenes_loaded" | "go_through_sand" | "auto_clean" | "force_add_update_areas" | "update_entity_transform" | "kill_entity_if_body_destroyed" | "kill_entity_after_initialized" | "manual_init" | "destroy_body_if_entity_destroyed" | "root_offset_x" | "root_offset_y" | "init_offset_x" | "init_offset_y" | "mActiveState" | "mPixelCountOrig" | "mLocalPosition" | "mBody" | "mInitialized" | "mPixelCount" | "mRefreshed" | "speed_threshold" | "damage_multiplier" | "is_external" | "hax_fix_going_through_ground" | "hax_fix_going_through_sand" | "hax_wait_till_pixel_scenes_loaded" | "uid" | "is_enabled" | "linear_damping" | "angular_damping" | "allow_sleep" | "fixed_rotation" | "buoyancy" | "gravity_scale_if_has_no_image_shapes" | "is_bullet" | "is_static" | "is_kinematic" | "is_character" | "go_through_sand" | "gridworld_box2d" | "auto_clean" | "on_death_leave_physics_body" | "on_death_really_leave_body" | "update_entity_transform" | "force_add_update_areas" | "kills_entity" | "projectiles_rotate_toward_velocity" | "randomize_init_velocity" | "mActiveState" | "initial_velocity" | "mBody" | "mBodyId" | "mPixelCount" | "mLocalPosition" | "mRefreshed" | "is_root" | "body_id" | "use_sprite" | "is_circle" | "centered" | "offset_x" | "offset_y" | "z" | "image_file" | "material" | "mBody" | "joint_id" | "break_force" | "break_distance" | "break_on_body_modified" | "break_on_shear_angle_deg" | "body1_id" | "body2_id" | "offset_x" | "offset_y" | "ray_x" | "ray_y" | "surface_attachment_offset_x" | "surface_attachment_offset_y" | "type" | "joint_id" | "destroy" | "motor_speed" | "motor_max_torque" | "mBox2DJointId" | "mPreviousMotorSpeed" | "mPreviousMotorMaxTorque" | "nail_to_wall" | "grid_joint" | "breakable" | "body1_id" | "body2_id" | "pos_x" | "pos_y" | "delta_x" | "delta_y" | "mMotorEnabled" | "mMotorSpeed" | "mMaxMotorTorque" | "type" | "mJoint" | "check_whole_aabb" | "predict_aabb" | "keep_at_last_valid_pos" | "mExPosition" | "mExRotation" | "pick_up_strength" | "transform" | "original_left_joint_pos" | "original_right_joint_pos" | "isBroken" | "leftJointPos" | "rightJointPos" | "leftJoint" | "rightJoint" | "filename" | "filenames" | "offset_x" | "offset_y" | "bodies" | "recreate" | "is_circle" | "is_box" | "is_capsule" | "is_based_on_sprite" | "friction" | "restitution" | "density" | "local_position_x" | "local_position_y" | "radius_x" | "radius_y" | "capsule_x_percent" | "capsule_y_percent" | "material" | "throw_force_coeff" | "max_throw_speed" | "min_torque" | "max_torque" | "tip_check_offset_min" | "tip_check_offset_max" | "tip_check_random_rotation_deg" | "attach_min_speed" | "attach_to_surfaces_knife_style" | "hp" | "mHasJoint" | "pixel_scene" | "pixel_scene_visual" | "pixel_scene_background" | "background_z_index" | "offset_x" | "offset_y" | "skip_biome_checks" | "skip_edge_textures" | "image_file" | "anchor_x" | "anchor_y" | "material" | "diggable" | "clean_overlapping_pixels" | "kill_when_sprite_dies" | "create_box2d_bodies" | "mPixelSprite" | "aiming_reticle_distance_from_character" | "camera_max_distance_from_character" | "alcohol_drunken_speed" | "blood_fungi_drunken_speed" | "blood_worm_drunken_speed" | "eating_cells_per_frame" | "eating_probability" | "eating_delay_frames" | "stoned_speed" | "center_camera_on_this_entity" | "move_camera_with_aim" | "eating_area_min" | "eating_area_max" | "mSmoothedCameraPosition" | "mSmoothedAimingVector" | "mCameraRecoil" | "mCameraRecoilTarget" | "mCrouching" | "mCameraDistanceLerped" | "mRequireTriggerPull" | "mWarpDelay" | "mItemTemporarilyHidden" | "mDesiredCameraPos" | "mHasGamepadControlsPrev" | "mForceFireOnNextUpdate" | "mFastMovementParticlesAlphaSmoothed" | "mTeleBoltFramesDuringLastSecond" | "mCamCorrectionTeleSmoothed" | "mCamCorrectionGainSmoothed" | "mCameraErrorPrev" | "mCamErrorAveraged" | "mCamMovingFastPrev" | "mCamFrameStartedMovingFast" | "mCamFrameLastMovingFastExplosion" | "mCessationDo" | "mCessationLifetime" | "getting_crushed_threshold" | "moving_up_before_getting_crushed_threshold" | "getting_crushed_counter" | "stuck_in_ground_counter" | "DEBUG_stuck_in_static_ground" | "mCollidedHorizontally" | "mPhysicsCollisionHax" | "lives" | "max_hp" | "speed" | "pos_x" | "pos_y" | "spray_velocity_coeff" | "spray_velocity_normalized_min" | "body_colored" | "throw_bunch" | "throw_how_many" | "dont_spray_static_materials" | "dont_spray_just_leak_gas_materials" | "never_color" | "custom_color_material" | "check_every_x_frames" | "state" | "material_percent" | "aabb_min" | "aabb_max" | "mNextFrame" | "lifetime" | "lifetime_randomness" | "on_lifetime_out_explode" | "collide_with_world" | "speed_min" | "speed_max" | "friction" | "direction_random_rad" | "direction_nonrandom_rad" | "lob_min" | "lob_max" | "camera_shake_when_shot" | "shoot_light_flash_radius" | "shoot_light_flash_r" | "shoot_light_flash_g" | "shoot_light_flash_b" | "create_shell_casing" | "shell_casing_material" | "muzzle_flash_file" | "bounces_left" | "bounce_energy" | "bounce_always" | "bounce_at_any_angle" | "attach_to_parent_trigger" | "bounce_fx_file" | "angular_velocity" | "velocity_sets_rotation" | "velocity_sets_scale" | "velocity_sets_scale_coeff" | "velocity_sets_y_flip" | "velocity_updates_animation" | "ground_penetration_coeff" | "ground_penetration_max_durability_to_destroy" | "go_through_this_material" | "do_moveto_update" | "on_death_duplicate_remaining" | "on_death_gfx_leave_sprite" | "on_death_explode" | "on_death_emit_particle" | "on_death_emit_particle_count" | "die_on_liquid_collision" | "die_on_low_velocity" | "die_on_low_velocity_limit" | "on_death_emit_particle_type" | "on_death_particle_check_concrete" | "ground_collision_fx" | "explosion_dont_damage_shooter" | "on_death_item_pickable_radius" | "penetrate_world" | "penetrate_world_velocity_coeff" | "penetrate_entities" | "on_collision_die" | "on_collision_remove_projectile" | "on_collision_spawn_entity" | "spawn_entity" | "spawn_entity_is_projectile" | "physics_impulse_coeff" | "damage_every_x_frames" | "damage_scaled_by_speed" | "damage_scale_max_speed" | "collide_with_entities" | "collide_with_tag" | "dont_collide_with_tag" | "collide_with_shooter_frames" | "friendly_fire" | "damage" | "knockback_force" | "ragdoll_force_multiplier" | "hit_particle_force_multiplier" | "blood_count_multiplier" | "damage_game_effect_entities" | "never_hit_player" | "collect_materials_to_shooter" | "play_damage_sounds" | "mLastFrameDamaged" | "projectile_type" | "shell_casing_offset" | "ragdoll_fx_on_collision" | "mWhoShot" | "mWhoShotEntityTypeID" | "mShooterHerdId" | "mStartingLifetime" | "mEntityThatShot" | "mTriggers" | "mDamagedEntities" | "mInitialSpeed" | "entity_with_tag" | "max_velocity" | "mPrevPosition" | "velocity" | "randomize_angle" | "randomize_speed" | "extra_modifier" | "condition_effect" | "condition_status" | "can_go_up" | "mOldPosition" | "sinewave_freq" | "sinewave_m" | "lifetime" | "target_sprite_comp_name" | "rotate_to_surface_normal" | "mStates" | "mCachedTargetSpriteTag" | "mSendOnFinishedMessageName" | "image_file" | "ui_is_parent" | "is_text_sprite" | "offset_x" | "offset_y" | "alpha" | "visible" | "emissive" | "additive" | "fog_of_war_hole" | "smooth_filtering" | "rect_animation" | "next_rect_animation" | "text" | "z_index" | "update_transform" | "update_transform_rotation" | "kill_entity_after_finished" | "has_special_scale" | "special_scale_x" | "special_scale_y" | "never_ragdollify_on_death" | "transform_offset" | "offset_animator_offset" | "mSprite" | "mRenderList" | "mRenderListHandle" | "x_amount" | "x_speed" | "y_amount" | "y_speed" | "sprite_id" | "x_phase" | "x_phase_offset" | "sprite_file" | "sprite_centered" | "sprite_random_rotation" | "render_back" | "delay" | "lifetime" | "additive" | "emissive" | "velocity_slowdown" | "rotation" | "angular_velocity" | "use_velocity_as_rotation" | "use_rotation_from_velocity_component" | "use_rotation_from_entity" | "entity_velocity_multiplier" | "z_index" | "randomize_position_inside_hitbox" | "velocity_always_away_from_center" | "camera_bound" | "camera_distance" | "is_emitting" | "count_min" | "count_max" | "emission_interval_min_frames" | "emission_interval_max_frames" | "entity_file" | "color" | "color_change" | "velocity" | "gravity" | "scale" | "scale_velocity" | "randomize_lifetime" | "randomize_position" | "randomize_velocity" | "randomize_scale" | "randomize_rotation" | "randomize_angular_velocity" | "randomize_alpha" | "randomize_animation_speed_coeff" | "expand_randomize_position" | "mNextEmitFrame" | "sprite_id" | "fade_stains_towards_srite_top" | "stain_shaken_drop_chance_multiplier" | "mData" | "mTextureHandle" | "mState" | "stain_effects" | "stain_effect_cooldowns" | "effects_previous" | "ingestion_effects" | "ingestion_effect_causes" | "ingestion_effect_causes_many" | "mLastAttackingPlayerFrame" | "mStainEffectsSmoothedForUI" | "mHasChildIconsCached" | "TEMP_TEMPY" | "TEMP_TEMP_TEMP" | "min_size" | "max_size" | "radius" | "throw_speed" | "target_distance" | "kick_to_use" | "mState" | "mBodyID" | "mStartBodyMaxExtent" | "mStartAimAngle" | "mStartBodyAngle" | "mStartBodyDistance" | "mStartTime" | "mMinBodyDistance" | "mInteract" | "target_x_is_absolute_position" | "target_y_is_absolute_position" | "source_particle_fx_file" | "target_particle_fx_file" | "load_collapse_entity" | "target" | "safety_counter" | "state" | "teleported_entities" | "source_location_camera_aabb" | "min_distance_from_wall" | "actionable_lifetime" | "reset_shooter_y_vel" | "mWhoShot" | "key" | "image_filename" | "mCachedName" | "probability_of_ignition_attempt" | "suffocation_check_offset_y" | "frames_suffocated_to_extinguish" | "extinguishable" | "fire_audio_weight" | "mFlickerOffset" | "mFramesSuffocated" | "mIsOn" | "mFireIsBurningPrev" | "icon_sprite_file" | "name" | "description" | "display_above_head" | "display_in_hud" | "is_perk" | "name" | "name" | "value_string" | "value_int" | "value_bool" | "value_float" | "gravity_x" | "gravity_y" | "mass" | "air_friction" | "terminal_velocity" | "apply_terminal_velocity" | "updates_velocity" | "displace_liquid" | "affect_physics_bodies" | "limit_to_max_velocity" | "liquid_death_threshold" | "liquid_drag" | "mVelocity" | "mPrevVelocity" | "mLatestLiquidHitCount" | "mAverageLiquidHitCount" | "mPrevPosition" | "num_points" | "num_links" | "width" | "resting_distance" | "mass_min" | "mass_max" | "stiffness" | "velocity_dampening" | "liquid_damping" | "gets_entity_velocity_coeff" | "collide_with_cells" | "simulate_gravity" | "simulate_wind" | "wind_change_speed" | "constrain_stretching" | "pixelate_sprite_transforms" | "scale_sprite_x" | "follow_entity_transform" | "animation_amount" | "animation_speed" | "animation_energy" | "cloth_sprite_z_index" | "stain_cells_probability" | "m_is_culled_previous" | "type" | "animation_target_offset" | "cloth_color_edge" | "cloth_color" | "m_position_previous" | "colors" | "materials" | "masses" | "positions" | "positions_prev" | "velocities" | "dampenings" | "freedoms" | "links" | "sprite" | "damage_radius" | "physics_force_radius" | "damage_min_step" | "damage_max" | "damage_coeff" | "impulse_coeff" | "fade_duration_frames" | "physics_impulse_coeff" | "mPlayerCooldownEnd" | "verlet_point_index" | "world_position" | "mUpdated" | "mCell" | "money" | "money_spent" | "mMoneyPrevFrame" | "mHasReachedInf" | "money_value" | "is_initialized" | "time" | "time_total" | "time_dt" | "day_count" | "rain" | "rain_target" | "fog" | "fog_target" | "intro_weather" | "wind" | "wind_speed" | "wind_speed_sin_t" | "wind_speed_sin" | "clouds_01_target" | "clouds_02_target" | "gradient_sky_alpha_target" | "sky_sunset_alpha_target" | "lightning_count" | "next_portal_id" | "session_stat_file" | "player_polymorph_count" | "player_polymorph_random_count" | "player_did_infinite_spell_count" | "player_did_damage_over_1milj" | "player_living_with_minus_hp" | "global_genome_relations_modifier" | "mods_have_been_active_during_this_run" | "twitch_has_been_active_during_this_run" | "next_cut_through_world_id" | "perk_infinite_spells" | "perk_trick_kills_blood_money" | "perk_hp_drop_chance" | "perk_gold_is_forever" | "perk_rats_player_friendly" | "EVERYTHING_TO_GOLD" | "material_everything_to_gold" | "material_everything_to_gold_static" | "INFINITE_GOLD_HAPPENING" | "ENDING_HAPPINESS_HAPPENING" | "ENDING_HAPPINESS_FRAMES" | "ENDING_HAPPINESS" | "mFlashAlpha" | "DEBUG_LOADED_FROM_AUTOSAVE" | "DEBUG_LOADED_FROM_OLD_VERSION" | "player_spawn_location" | "lua_globals" | "pending_portals" | "apparitions_per_level" | "npc_parties" | "orbs_found_thisrun" | "flags" | "changed_materials" | "cuts_through_world" | "gore_multiplier" | "trick_kill_gold_multiplier" | "damage_flash_multiplier" | "open_fog_of_war_everywhere" | "consume_actions" | "rain_target_extra" | "fog_target_extra" | "perk_rats_player_friendly_prev" | "speed" | "speed_hunt" | "direction_adjust_speed" | "direction_adjust_speed_hunt" | "random_target_box_radius" | "new_hunt_target_check_every" | "new_random_target_check_every" | "hunt_box_radius" | "cocoon_food_required" | "cocoon_entity" | "give_up_area_radius" | "give_up_time_frames" | "debug_follow_mouse" | "mRandomTarget" | "mTargetEntityId" | "mNextTargetCheckFrame" | "mNextHuntTargetCheckFrame" | "mGiveUpStarted" | "mGiveUpAreaMinX" | "mGiveUpAreaMinY" | "mGiveUpAreaMaxX" | "mGiveUpAreaMaxY" | "direction" | "radius" | "speed" | "acceleration" | "gravity" | "tail_gravity" | "part_distance" | "ground_check_offset" | "hitbox_radius" | "bite_damage" | "target_kill_radius" | "target_kill_ragdoll_force" | "jump_cam_shake" | "jump_cam_shake_distance" | "eat_anim_wait_mult" | "ragdoll_filename" | "is_water_worm" | "max_speed" | "ground_decceleration" | "mTargetVec" | "mGravVelocity" | "mSpeed" | "mTargetPosition" | "mTargetSpeed" | "mOnGroundPrev" | "mMaterialIdPrev" | "mFrameNextDamage" | "mDirectionAdjustSpeed" | "mPrevPositions" | "mPrevPosition" | "mDirection"
---lua_ls doesn't support dependent types properly so this includes the object types for *all* components
---@alias object_type "gun_config" | "gunaction_config" | "attack_melee_finish_config_explosion" | "damage_multipliers" | "drug_fx_target" | "m_drug_fx_current" | "fx_add" | "fx_multiply" | "config_explosion" | "config_explosion" | "laser" | "config_explosion" | "config" | "config_explosion" | "damage_by_type" | "damage_critical"
---@alias damage_type
---|> "NONE"
---| "DAMAGE_MELEE"
---| "DAMAGE_PROJECTILE"
---| "DAMAGE_EXPLOSION"
---| "DAMAGE_BITE"
---| "DAMAGE_FIRE"
---| "DAMAGE_MATERIAL"
---| "DAMAGE_FALL"
---| "DAMAGE_ELECTRICITY"
---| "DAMAGE_DROWNING"
---| "DAMAGE_PHYSICS_BODY_DAMAGED"
---| "DAMAGE_DRILL"
---| "DAMAGE_SLICE"
---| "DAMAGE_ICE"
---| "DAMAGE_HEALING"
---| "DAMAGE_PHYSICS_HIT"
---| "DAMAGE_RADIOACTIVE"
---| "DAMAGE_POISON"
---| "DAMAGE_MATERIAL_WITH_FLASH"
---| "DAMAGE_OVEREATING"
---| "DAMAGE_CURSE"
---| "DAMAGE_HOLY
---@alias game_effect
---|> "NONE"
---| "ELECTROCUTION"
---| "FROZEN"
---| "ON_FIRE"
---| "POISON"
---| "BERSERK"
---| "CHARM"
---| "POLYMORPH"
---| "POLYMORPH_RANDOM"
---| "BLINDNESS"
---| "TELEPATHY"
---| "TELEPORTATION"
---| "REGENERATION"
---| "LEVITATION"
---| "MOVEMENT_SLOWER"
---| "FARTS"
---| "DRUNK"
---| "BREATH_UNDERWATER"
---| "RADIOACTIVE"
---| "WET"
---| "OILED"
---| "BLOODY"
---| "SLIMY"
---| "CRITICAL_HIT_BOOST"
---| "CONFUSION"
---| "MELEE_COUNTER"
---| "WORM_ATTRACTOR"
---| "WORM_DETRACTOR"
---| "FOOD_POISONING"
---| "FRIEND_THUNDERMAGE"
---| "FRIEND_FIREMAGE"
---| "INTERNAL_FIRE"
---| "INTERNAL_ICE"
---| "JARATE"
---| "KNOCKBACK"
---| "KNOCKBACK_IMMUNITY"
---| "MOVEMENT_SLOWER_2X"
---| "MOVEMENT_FASTER"
---| "STAINS_DROP_FASTER"
---| "SAVING_GRACE"
---| "DAMAGE_MULTIPLIER"
---| "HEALING_BLOOD"
---| "RESPAWN"
---| "PROTECTION_FIRE"
---| "PROTECTION_RADIOACTIVITY"
---| "PROTECTION_EXPLOSION"
---| "PROTECTION_MELEE"
---| "PROTECTION_ELECTRICITY"
---| "TELEPORTITIS"
---| "STAINLESS_ARMOUR"
---| "GLOBAL_GORE"
---| "EDIT_WANDS_EVERYWHERE"
---| "EXPLODING_CORPSE_SHOTS"
---| "EXPLODING_CORPSE"
---| "EXTRA_MONEY"
---| "EXTRA_MONEY_TRICK_KILL"
---| "HOVER_BOOST"
---| "PROJECTILE_HOMING"
---| "ABILITY_ACTIONS_MATERIALIZED"
---| "NO_DAMAGE_FLASH"
---| "NO_SLIME_SLOWDOWN"
---| "MOVEMENT_FASTER_2X"
---| "NO_WAND_EDITING"
---| "LOW_HP_DAMAGE_BOOST"
---| "FASTER_LEVITATION"
---| "STUN_PROTECTION_ELECTRICITY"
---| "STUN_PROTECTION_FREEZE"
---| "IRON_STOMACH"
---| "PROTECTION_ALL"
---| "INVISIBILITY"
---| "REMOVE_FOG_OF_WAR"
---| "MANA_REGENERATION"
---| "PROTECTION_DURING_TELEPORT"
---| "PROTECTION_POLYMORPH"
---| "PROTECTION_FREEZE"
---| "FROZEN_SPEED_UP"
---| "UNSTABLE_TELEPORTATION"
---| "POLYMORPH_UNSTABLE"
---| "CUSTOM"
---| "ALLERGY_RADIOACTIVE"
---| "RAINBOW_FARTS"
---| "WEAKNESS"
---| "PROTECTION_FOOD_POISONING"
---| "NO_HEAL"
---| "PROTECTION_EDGES"
---| "PROTECTION_PROJECTILE"
---| "POLYMORPH_CESSATION"
---| "_LAST"
---@alias ragdoll_fx
---|> "NONE"
---| "NORMAL"
---| "BLOOD_EXPLOSION"
---| "BLOOD_SPRAY"
---| "FROZEN"
---| "CONVERT_TO_MATERIAL"
---| "CUSTOM_RAGDOLL_ENTITY"
---| "DISINTEGRATED"
---| "NO_RAGDOLL_FILE"
---| "PLAYER_RAGDOLL_CAMERA"

---@alias printable_string string | number

---Represents cached dofile results.
---@type {[string]: fun(): any}
__loaded = {}

---Represents cached dofile_once results, if a file is here dofile_once won't execute it again.
---@type {[string]: {[1]: any}}
__loadonce = {}

---Represents cached version of the current file. Only exists in lua component scripts.
---@return any
function ____cached_func() end

---Noita runs luajit, version is 5.1 though.
_VERSION = "Lua 5.1"

---@param ... printable_string
function print_error(...) end

---@param ... printable_string
function print(...) end

---Only available in data/scripts/gun/gun.lua
---@param path string
function Reflection_RegisterProjectile(path) end

---Only available in data/scripts/perks/perk_reflect.lua
---@param id string
---@param ui_name string
---@param ui_description string
---@param ui_icon string
---@param perk_icon string
function RegisterPerk(id, ui_name, ui_description, ui_icon, perk_icon) end

---Only available in data/scripts/status_effects/status_reflect.lua
---@param id string
---@param ui_name string
---@param ui_description string
---@param ui_icon string
---@param protects_from_fire boolean false
---@param remove_cells_that_cause_when_activated boolean false
---@param effect_entity string '""'
---@param min_threshold_normalized number 0.0
---@param extra_status_00 string '""'
---@param effect_permanent boolean false
---@param is_harmful boolean false
---@param ui_timer_offset_normalized number 0.0
function GameRegisterStatusEffect(id, ui_name, ui_description, ui_icon, protects_from_fire, remove_cells_that_cause_when_activated, effect_entity, min_threshold_normalized, extra_status_00, effect_permanent, is_harmful, ui_timer_offset_normalized) end

---Only available in data/scripts/streaming_integratiion/event_list.lua
---@param id string
---@param ui_name string
---@param ui_description string
---@param ui_icon_path string
---@param kind integer
---@param weight number
function RegisterStreamingEvent(id, ui_name, ui_description, ui_icon_path, kind, weight) end

---Note: works only in dev builds.
function DEBUG_GameReset() end

---Executes the code in all of the appends to a given file.
---@param filename string
function do_mod_appends(filename) end

---Does something with these values, not used in vanilla. Only available in data/scripts/gun/gun.lua
---@param action_id string '""'
---@param action_name string '""'
---@param action_description string '""'
---@param action_sprite_filename string '""'
---@param action_unidentified_sprite_filename string '"data/ui_gfx/gun_actions/unidentified.png"'
---@param action_type integer 0
---@param action_spawn_level string '""'
---@param action_spawn_probability string '""'
---@param action_spawn_requires_flag string '""'
---@param action_spawn_manual_unlock boolean false
---@param action_max_uses integer -1
---@param custom_xml_file string '""'
---@param action_mana_drain integer 10
---@param action_is_dangerous_blast boolean false
---@param action_draw_many_count integer 0
---@param action_ai_never_uses boolean false
---@param action_never_unlimited boolean false
---@param state_shuffled boolean false
---@param state_cards_drawn integer 0
---@param state_discarded_action boolean false
---@param state_destroyed_action boolean false
---@param fire_rate_wait integer 0
---@param speed_multiplier number 1.0
---@param child_speed_multiplier number 1.0
---@param dampening number 1.0
---@param explosion_radius number 0.0
---@param spread_degrees number 0.0
---@param pattern_degrees number 0.0
---@param screenshake number 0.0
---@param recoil number 0.0
---@param damage_melee_add number 0.0
---@param damage_projectile_add number 0.0
---@param damage_electricity_add number 0.0
---@param damage_fire_add number 0.0
---@param damage_explosion_add number 0.0
---@param damage_ice_add number 0.0
---@param damage_slice_add number 0.0
---@param damage_healing_add number 0.0
---@param damage_curse_add number 0.0
---@param damage_drill_add number 0.0
---@param damage_null_all number 0.0
---@param damage_critical_chance integer 0
---@param damage_critical_multiplier number 0.0
---@param explosion_damage_to_materials number 0.0
---@param knockback_force number 0.0
---@param reload_time integer 0
---@param lightning_count integer 0
---@param material string '""'
---@param material_amount integer 0
---@param trail_material string '""'
---@param trail_material_amount integer 0
---@param bounces integer 0
---@param gravity number 0.0
---@param light number 0.0
---@param blood_count_multiplier number 1.0
---@param gore_particles integer 0
---@param ragdoll_fx integer 0
---@param friendly_fire boolean false
---@param physics_impulse_coeff number 0.0
---@param lifetime_add integer 0
---@param sprite string '""'
---@param extra_entities string '""'
---@param game_effect_entities string '""'
---@param sound_loop_tag string '""'
---@param projectile_file string '""'
function _ConfigGunActionInfo_ReadToGame(action_id, action_name, action_description, action_sprite_filename, action_unidentified_sprite_filename, action_type, action_spawn_level, action_spawn_probability, action_spawn_requires_flag, action_spawn_manual_unlock, action_max_uses, custom_xml_file, action_mana_drain, action_is_dangerous_blast, action_draw_many_count, action_ai_never_uses, action_never_unlimited, state_shuffled, state_cards_drawn, state_discarded_action, state_destroyed_action, fire_rate_wait, speed_multiplier, child_speed_multiplier, dampening, explosion_radius, spread_degrees, pattern_degrees, screenshake, recoil, damage_melee_add, damage_projectile_add, damage_electricity_add, damage_fire_add, damage_explosion_add, damage_ice_add, damage_slice_add, damage_healing_add, damage_curse_add, damage_drill_add, damage_null_all, damage_critical_chance, damage_critical_multiplier, explosion_damage_to_materials, knockback_force, reload_time, lightning_count, material, material_amount, trail_material, trail_material_amount, bounces, gravity, light, blood_count_multiplier, gore_particles, ragdoll_fx, friendly_fire, physics_impulse_coeff, lifetime_add, sprite, extra_entities, game_effect_entities, sound_loop_tag, projectile_file) end

---@param filename string
---@param pos_x integer? 0
---@param pos_y integer? 0
---@return entity_id entity_id
function EntityLoad(filename, pos_x, pos_y) end

---@param filename string
---@param pos_x number? 0
---@param pos_y number? 0
---@return entity_id entity_id
function EntityLoadEndGameItem(filename, pos_x, pos_y) end

---@param filename string
---@param pos_x number? 0
---@param pos_y number? 0
function EntityLoadCameraBound(filename, pos_x, pos_y) end

---Loads components from `filename` to `entity`. Does not load tags and other stuff.
---@param filename string
---@param entity entity_id
function EntityLoadToEntity(filename, entity) end

---Note: works only in dev builds.
---@param entity_id entity_id
---@param filename string
function EntitySave(entity_id, filename) end

---@param name string? '""'
---@return entity_id entity_id
function EntityCreateNew(name) end

---@param entity_id entity_id
function EntityKill(entity_id) end

---@param entity_id entity_id
---@return boolean
---@nodiscard
function EntityGetIsAlive(entity_id) end

---Deprectated, use `EntityAddComponent2`() instead.
---@param entity_id entity_id
---@param component_type_name component_type
---@param table_of_component_values string[]? nil
---@return component_id component_id
---@deprecated
function EntityAddComponent(entity_id, component_type_name, table_of_component_values) end

---@param entity_id entity_id
---@param component_id component_id
function EntityRemoveComponent(entity_id, component_id) end

---Returns a table of component ids.
---@param entity_id entity_id
---@return component_id[] components
---@nodiscard
function EntityGetAllComponents(entity_id) end

---@param entity_id entity_id
---@param component_type_name component_type
---@param tag string? '""'
---@return component_id[]|nil
---@nodiscard
function EntityGetComponent(entity_id, component_type_name, tag) end

---@param entity_id entity_id
---@param component_type_name component_type
---@param tag string? '""'
---@return component_id|nil
---@nodiscard
function EntityGetFirstComponent(entity_id, component_type_name, tag) end

---@param entity_id entity_id
---@param component_type_name component_type
---@param tag string? '""'
---@return component_id[]|nil
---@nodiscard
function EntityGetComponentIncludingDisabled(entity_id, component_type_name, tag) end

---@param entity_id entity_id
---@param component_type_name component_type
---@param tag string? '""'
---@return component_id|nil
---@nodiscard
function EntityGetFirstComponentIncludingDisabled(entity_id, component_type_name, tag) end

---@param entity_id entity_id
---@param x number
---@param y number? 0
---@param rotation number? 0
---@param scale_x number? 1
---@param scale_y number? 1
function EntitySetTransform(entity_id, x, y, rotation, scale_x, scale_y) end

---Sets the transform and tries to immediately refresh components that calculate values based on an entity's transform.
---@param entity_id entity_id
---@param x number
---@param y number? 0
---@param rotation number? 0
---@param scale_x number? 1
---@param scale_y number? 1
function EntityApplyTransform(entity_id, x, y, rotation, scale_x, scale_y) end

---@param entity_id entity_id
---@return number x
---@return number y
---@return number rotation
---@return number scale_x
---@return number scale_y
---@nodiscard
function EntityGetTransform(entity_id) end

---@param parent_id entity_id
---@param child_id entity_id
function EntityAddChild(parent_id, child_id) end

---If passed the optional `tag` parameter, will return only child entities that have that tag (If `tag` isn't a valid tag name, will return no entities). If no entities are found returns nil, but if entities are found but the tag doesn't match an empty table is returned.
---@param entity_id entity_id
---@param tag string? '""'
---@return entity_id[]|nil
---@nodiscard
function EntityGetAllChildren(entity_id, tag) end

---@param entity_id entity_id
---@return entity_id entity_id
---@nodiscard
function EntityGetParent(entity_id) end

---Returns the given entity if it has no parent, otherwise walks up the parent hierarchy to the topmost parent and returns it.
---@param entity_id entity_id
---@return entity_id entity_id
---@nodiscard
function EntityGetRootEntity(entity_id) end

---@param entity_id entity_id
function EntityRemoveFromParent(entity_id) end

---@param entity_id entity_id
---@param tag string
---@param enabled boolean
function EntitySetComponentsWithTagEnabled(entity_id, tag, enabled) end

---@param entity_id entity_id
---@param component_id component_id
---@param is_enabled boolean
function EntitySetComponentIsEnabled(entity_id, component_id, is_enabled) end

---@param entity_id entity_id
---@return string name
---@nodiscard
function EntityGetName(entity_id) end

---@param entity_id entity_id
---@param name string
function EntitySetName(entity_id, name) end

---Returns a string where the tags are comma-separated, or nil if `entity_id` doesn't point to a valid entity.
---@param entity_id entity_id
---@return string|nil
---@nodiscard
function EntityGetTags(entity_id) end

---Returns all entities with `tag`.
---@param tag string
---@return entity_id[] entity_id
---@nodiscard
function EntityGetWithTag(tag) end

---Returns all entities in `radius` distance from `x`, `y`.
---@param pos_x number
---@param pos_y number
---@param radius number
---@return entity_id[] entity_id
---@nodiscard
function EntityGetInRadius(pos_x, pos_y, radius) end

---Returns all entities in `radius` distance from `x`, `y`.
---@param pos_x number
---@param pos_y number
---@param radius number
---@param entity_tag string
---@return entity_id[] entity_id
---@nodiscard
function EntityGetInRadiusWithTag(pos_x, pos_y, radius, entity_tag) end

---@param pos_x number
---@param pos_y number
---@return entity_id entity_id
---@nodiscard
function EntityGetClosest(pos_x, pos_y) end

---@param pos_x number
---@param pos_y number
---@param tag string
---@return entity_id entity_id
---@nodiscard
function EntityGetClosestWithTag(pos_x, pos_y, tag) end

---@param name string
---@return entity_id entity_id
---@nodiscard
function EntityGetWithName(name) end

---@param entity_id entity_id
---@param tag string
function EntityAddTag(entity_id, tag) end

---@param entity_id entity_id
---@param tag string
function EntityRemoveTag(entity_id, tag) end

---@param entity_id entity_id
---@param tag string
---@return boolean
---@nodiscard
function EntityHasTag(entity_id, tag) end

---Return value example: 'data/entities/items/flute.xml'. Incorrect value is returned if the entity has passed through the world streaming system.
---@param entity_id entity_id
---@return string full_path
---@nodiscard
function EntityGetFilename(entity_id) end

---Returns the max entity ID currently in use. Entity IDs are increased linearly.
---@return number entity_max_id
---@nodiscard
function EntitiesGetMaxID() end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return string|nil
---@deprecated
---@nodiscard
function ComponentGetValue(component_id, variable_name) end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return boolean|nil
---@deprecated
---@nodiscard
function ComponentGetValueBool(component_id, variable_name) end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return integer|nil
---@deprecated
---@nodiscard
function ComponentGetValueInt(component_id, variable_name) end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return number|nil
---@deprecated
---@nodiscard
function ComponentGetValueFloat(component_id, variable_name) end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return number x
---@return number y
---@deprecated
---@nodiscard
function ComponentGetValueVector2(component_id, variable_name) end

---Deprecated, use `ComponentSetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@param value string
---@deprecated
function ComponentSetValue(component_id, variable_name, value) end

---Deprecated, use `ComponentSetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@param x number
---@param y number
---@deprecated
function ComponentSetValueVector2(component_id, variable_name, x, y) end

---Deprecated, use `ComponentSetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@param min number
---@param max number
---@deprecated
function ComponentSetValueValueRange(component_id, variable_name, min, max) end

---Deprecated, use `ComponentSetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@param min number
---@param max number
---@deprecated
function ComponentSetValueValueRangeInt(component_id, variable_name, min, max) end

---Deprecated, use `ComponentSetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@param value string
---@deprecated
function ComponentSetMetaCustom(component_id, variable_name, value) end

---Deprecated, use `ComponentGetValue2`() instead.
---@param component_id component_id
---@param variable_name field_type
---@return string|nil
---@deprecated
---@nodiscard
function ComponentGetMetaCustom(component_id, variable_name) end

---Deprecated, use `ComponentObjectGetValue2`() instead.
---@param component_id component_id
---@param object_name object_type
---@param variable_name string
---@return string|nil
---@deprecated
---@nodiscard
function ComponentObjectGetValue(component_id, object_name, variable_name) end

---Deprecated, use `ComponentObjectSetValue2`() instead.
---@param component_id component_id
---@param object_name object_type
---@param variable_name string
---@param value string
---@deprecated
function ComponentObjectSetValue(component_id, object_name, variable_name, value) end

---@param component_id component_id
---@param tag string
function ComponentAddTag(component_id, tag) end

---@param component_id component_id
---@param tag string
function ComponentRemoveTag(component_id, tag) end

---Returns a string where the tags are comma-separated, or nil if can't find `component_id` component.
---@param component_id component_id
---@return string|nil
---@nodiscard
function ComponentGetTags(component_id) end

---@param component_id component_id
---@param tag string
---@return boolean
---@nodiscard
function ComponentHasTag(component_id, tag) end

---Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is not supported or field was not found. This is up to 7.5x faster than the old ComponentSetValue functions.
---@param component_id component_id
---@param field_name field_type
---@return any|nil
---@nodiscard
function ComponentGetValue2(component_id, field_name) end

---Sets the value of a field. Value(s) should have a type matching the field type. Reports error if the values weren't given in correct type, the field type is not supported, or the component does not exist. This is up to 20x faster than the old ComponentSetValue functions.
---@param component_id component_id
---@param field_name field_type
---@param ... any
function ComponentSetValue2(component_id, field_name, ...) end

---Returns one or many values matching the type or subtypes of the requested field in a component subobject. Reports error and returns nil if the field type is not supported or `object_name` is not a metaobject.
---@param component_id component_id
---@param object_name object_type
---@param field_name string
---@return any|nil
---@nodiscard
function ComponentObjectGetValue2(component_id, object_name, field_name) end

---Sets the value of a field in a component subobject. Value(s) should have a type matching the field type. Reports error if the values weren't given in correct type, the field type is not supported or `object_name` is not a metaobject.
---@param component_id component_id
---@param object_name object_type
---@param field_name string
---@param ... any
function ComponentObjectSetValue2(component_id, object_name, field_name, ...) end

---@param entity_id entity_id
---@param component_type_name component_type
---@param table_of_component_values {[string]:any}? nil
---@return component_id
function EntityAddComponent2(entity_id, component_type_name, table_of_component_values) end

---`type_stored_in_vector` should be "int", "float" or "string".
---@param component_id component_id
---@param array_member_name string
---@param type_stored_in_vector string
---@return integer
---@nodiscard
function ComponentGetVectorSize(component_id, array_member_name, type_stored_in_vector) end

---`type_stored_in_vector` should be "int", "float" or "string".
---@param component_id component_id
---@param array_name string
---@param type_stored_in_vector string
---@param index integer
---@return integer|number|string|nil
---@nodiscard
function ComponentGetVectorValue(component_id, array_name, type_stored_in_vector, index) end

---`type_stored_in_vector` should be "int", "float" or "string".
---@param component_id component_id
---@param array_name string
---@param type_stored_in_vector string
---@return integer[]|number[]|string[]|nil
---@nodiscard
function ComponentGetVector(component_id, array_name, type_stored_in_vector) end

---Returns true if the given component exists and is enabled, else false.
---@param component_id component_id
---@return boolean
---@nodiscard
function ComponentGetIsEnabled(component_id) end

---Returns the id of the entity that owns a component, or 0.
---@param component_id component_id
---@return entity_id entity_id
---@nodiscard
function ComponentGetEntity(component_id) end

---Returns a string-indexed table of string.
---@param component_id component_id
---@return {[string]:string}|nil
---@nodiscard
function ComponentGetMembers(component_id) end

---Returns a string-indexed table of string or nil.
---@param component_id component_id
---@param object_name object_type
---@return {[string]:string}|nil
---@nodiscard
function ComponentObjectGetMembers(component_id, object_name) end

---@param component_id component_id
---@return string
---@nodiscard
function ComponentGetTypeName(component_id) end

---@return entity_id entity_id
---@nodiscard
function GetUpdatedEntityID() end

---@return component_id component_id
---@nodiscard
function GetUpdatedComponentID() end

---@param time_to_execute number
---@param file_to_execute string
---@param function_to_call string? nil
function SetTimeOut(time_to_execute, file_to_execute, function_to_call) end

---@param color integer
---@param function_name string
function RegisterSpawnFunction(color, function_name) end

---@param x number
---@param y number
---@param level integer
function SpawnActionItem(x, y, level) end

---@param x number
---@param y number
---@param level integer
---@param action_count integer
---@return entity_id entity_id
function SpawnStash(x, y, level, action_count) end

---@param x number
---@param y number
---@param level integer
---@param spawn_now boolean? false
---@return integer spawn_state_id
---@return entity_id entity_id
function SpawnApparition(x, y, level, spawn_now) end

---@param entity_file string
---@param stash_entity_id entity_id
function LoadEntityToStash(entity_file, stash_entity_id) end

---This function actually sets the amount in the inventory rather than adding.
---@param entity_id entity_id
---@param material_name string
---@param count integer
function AddMaterialInventoryMaterial(entity_id, material_name, count) end

---If material_name is empty, all materials will be removed.
---@param entity_id entity_id
---@param material_name string? '""'
function RemoveMaterialInventoryMaterial(entity_id, material_name) end

---Returns the id of the material taking the largest part of the first MaterialInventoryComponent in `entity_id`, or 0 if nothing is found.
---@param entity_id entity_id
---@param ignore_box2d_materials boolean? true
---@return integer material_type
---@nodiscard
function GetMaterialInventoryMainMaterial(entity_id, ignore_box2d_materials) end

---@param strength number
---@param x number? camera_x
---@param y number? camera_y
function GameScreenshake(strength, x, y) end

---Grants the victory steam achievement, to get a victory screen use: 
---```lua 
---GameAddFlagRun("ending_game_completed") 
---```
function GameOnCompleted() end

---@param id string
function GameGiveAchievement(id) end

function GameDoEnding2() end

---x = 0 normal world, -1 is first west world, +1 is first east world, if y < 0 it is sky, if y > 0 it is hell
---@param world_pos_x number
---@param world_pos_y number
---@return number x
---@return number y
---@nodiscard
function GetParallelWorldPosition(world_pos_x, world_pos_y) end

---@param filename string
---@param pixel_scenes string? '"data/biome/_pixel_scenes.xml"'
function BiomeMapLoad_KeepPlayer(filename, pixel_scenes) end

---Deprecated. Might trigger various bugs. Use `BiomeMapLoad_KeepPlayer`() instead.
---@param filename string
---@deprecated
function BiomeMapLoad(filename) end

---Can be used to edit biome configs during initialization. See the nightmare mod for an usage example.
---@param filename string
---@param field_name field_type
---@param value any
function BiomeSetValue(filename, field_name, value) end

---Can be used to read biome configs. Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is not supported or field was not found.
---@param filename string
---@param field_name field_type
---@return any|nil
---@nodiscard
function BiomeGetValue(filename, field_name) end

---Can be used to edit biome configs during initialization. See biome_modifiers.lua for an usage example.
---@param filename string
---@param meta_object_name object_type
---@param field_name string
---@param value any
function BiomeObjectSetValue(filename, meta_object_name, field_name, value) end

---Can be used to edit biome config MaterialComponents during initialization. Sets the given value in all found VegetationComponent with matching tree_material. See biome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name field_type
---@param value any
function BiomeVegetationSetValue(filename, material_name, field_name, value) end

---Can be used to edit biome config MaterialComponents during initialization. Sets the given value in the first found MaterialComponent with matching material_name. See biome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name field_type
---@param value any
function BiomeMaterialSetValue(filename, material_name, field_name, value) end

---Can be used to read biome config MaterialComponents during initialization. Returns the given value in the first found MaterialComponent with matching material_name. See biome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name field_type
---@return any|nil
---@nodiscard
function BiomeMaterialGetValue(filename, material_name, field_name) end

---@return boolean
---@nodiscard
function GameIsIntroPlaying() end

---@return boolean
---@nodiscard
function GameGetIsGamepadConnected() end

---@return entity_id entity_id
---@nodiscard
function GameGetWorldStateEntity() end

---@return entity_id entity_id
---@nodiscard
function GameGetPlayerStatsEntity() end

---@return integer
---@nodiscard
function GameGetOrbCountAllTime() end

---@return integer
---@nodiscard
function GameGetOrbCountThisRun() end

---@param orb_id_zero_based integer
---@return boolean
---@nodiscard
function GameGetOrbCollectedThisRun(orb_id_zero_based) end

---@param orb_id_zero_based integer
---@return boolean
---@nodiscard
function GameGetOrbCollectedAllTime(orb_id_zero_based) end

function GameClearOrbsFoundThisRun() end

---Returns the number of orbs, picked or not.
---@return integer
---@nodiscard
function GameGetOrbCountTotal() end

---Converts a numeric material id to the material's strings id.
---@param material_id integer
---@return string
---@nodiscard
function CellFactory_GetName(material_id) end

---Returns the id of a material.
---@param material_name string
---@return integer
---@nodiscard
function CellFactory_GetType(material_name) end

---Returns the displayed name of a material, or an empty string if `material_id` is not valid. Might return a text key.
---@param material_id integer
---@return string
---@nodiscard
function CellFactory_GetUIName(material_id) end

---@param include_statics boolean? true
---@param include_particle_fx_materials boolean? false
---@return string[]
---@nodiscard
function CellFactory_GetAllLiquids(include_statics, include_particle_fx_materials) end

---@param include_statics boolean? true
---@param include_particle_fx_materials boolean? false
---@return string[]
---@nodiscard
function CellFactory_GetAllSands(include_statics, include_particle_fx_materials) end

---@param include_statics boolean? true
---@param include_particle_fx_materials boolean? false
---@return string[]
---@nodiscard
function CellFactory_GetAllGases(include_statics, include_particle_fx_materials) end

---@param include_statics boolean? true
---@param include_particle_fx_materials boolean? false
---@return string[]
---@nodiscard
function CellFactory_GetAllFires(include_statics, include_particle_fx_materials) end

---@param include_statics boolean? true
---@param include_particle_fx_materials boolean? false
---@return string[]
---@nodiscard
function CellFactory_GetAllSolids(include_statics, include_particle_fx_materials) end

---@param material_id integer
---@return string[]
---@nodiscard
function CellFactory_GetTags(material_id) end

---@param material_id integer
---@param tag string
---@return boolean[]
---@nodiscard
function CellFactory_HasTag(material_id, tag) end

---@return number x
---@return number y
---@nodiscard
function GameGetCameraPos() end

---@param x number
---@param y number
function GameSetCameraPos(x, y) end

---@param is_free boolean
function GameSetCameraFree(is_free) end

---Returns the camera rectangle. This may not be 100% pixel perfect with regards to what you see on the screen. `x`, `y` = top left corner of the rectangle.
---@return number x
---@return number y
---@return number w
---@return number h
---@nodiscard
function GameGetCameraBounds() end

---@param entity_id entity_id
function GameRegenItemAction(entity_id) end

---@param entity_id entity_id
function GameRegenItemActionsInContainer(entity_id) end

---@param entity_id entity_id
function GameRegenItemActionsInPlayer(entity_id) end

---@param inventory_owner_entity_id entity_id
---@param item_entity_id entity_id
function GameKillInventoryItem(inventory_owner_entity_id, item_entity_id) end

---@param who_picks_up_entity_id entity_id
---@param item_entity_id entity_id
---@param do_pick_up_effects boolean? true
function GamePickUpInventoryItem(who_picks_up_entity_id, item_entity_id, do_pick_up_effects) end

---Returns all the inventory items that entity_id has.
---@param entity_id entity_id
---@return entity_id[]|nil
---@nodiscard
function GameGetAllInventoryItems(entity_id) end

---@param entity_id entity_id
function GameDropAllItems(entity_id) end

---@param entity_id entity_id
function GameDropPlayerInventoryItems(entity_id) end

---@param entity_id entity_id
function GameDestroyInventoryItems(entity_id) end

---@return boolean
---@nodiscard
function GameIsInventoryOpen() end

function GameTriggerGameOver() end

---@param materials_filename string
---@param colors_filename string
---@param x number
---@param y number
---@param background_file string? '""'
---@param skip_biome_checks boolean? false
---@param skip_edge_textures boolean? false
---@param color_to_material_table {[string]:string}? {}
---@param background_z_index integer? 50
---@param load_even_if_duplicate boolean? false
function LoadPixelScene(materials_filename, colors_filename, x, y, background_file, skip_biome_checks, skip_edge_textures, color_to_material_table, background_z_index, load_even_if_duplicate) end

---@param background_file string
---@param x number
---@param y number
---@param background_z_index number? 40.0
---@param check_biome_corners boolean? false
function LoadBackgroundSprite(background_file, x, y, background_z_index, check_biome_corners) end

---NOTE! Removes the pixel scene sprite if the name and position match. Will return true if manages the find and destroy the background sprite
---@param background_file string
---@param x number
---@param y number
---@return boolean
function RemovePixelSceneBackgroundSprite(background_file, x, y) end

---NOTE! Removes pixel scene background sprites inside the given area.
---@param x_min number
---@param y_min number
---@param x_max number
---@param y_max number
function RemovePixelSceneBackgroundSprites(x_min, y_min, x_max, y_max) end

---@param material_name string
---@param x number
---@param y number
---@param how_many integer
---@param xvel number
---@param yvel number
---@param color unsigned_integer? 0
---@param lifetime_min number? 5.0
---@param lifetime_max number? 10
---@param force_create boolean? true
---@param draw_front boolean? false
---@param collide_with_grid boolean? true
---@param randomize_velocity boolean? true
---@param gravity_x number? 0
---@param gravity_y number? 100.0
function GameCreateCosmeticParticle(material_name, x, y, how_many, xvel, yvel, color, lifetime_min, lifetime_max, force_create, draw_front, collide_with_grid, randomize_velocity, gravity_x, gravity_y) end

---@param material_name string
---@param x number
---@param y number
---@param how_many integer
---@param xvel number
---@param yvel number
---@param just_visual boolean
---@param draw_as_long boolean? false
---@param randomize_velocity boolean? true
function GameCreateParticle(material_name, x, y, how_many, xvel, yvel, just_visual, draw_as_long, randomize_velocity) end

---@param filename string
---@param x number
---@param y number
---@param centered boolean? true
---@param sprite_offset_x number? 0
---@param sprite_offset_y number? 0
---@param frames integer? 1
---@param emissive boolean? false
function GameCreateSpriteForXFrames(filename, x, y, centered, sprite_offset_x, sprite_offset_y, frames, emissive) end

---`shooter_entity` can be 0. Warning: If `projectile_entity` has PhysicsBodyComponent and ItemComponent, components without the "enabled_in_world" tag will be disabled, as if the entity was thrown by player.
---@param shooter_entity entity_id
---@param x number
---@param y number
---@param target_x number
---@param target_y number
---@param projectile_entity entity_id
---@param send_message boolean? true
---@param verlet_parent_entity entity_id? 0
function GameShootProjectile(shooter_entity, x, y, target_x, target_y, projectile_entity, send_message, verlet_parent_entity) end

---@param entity entity_id
---@param amount number
---@param damage_type damage_type
---@param description string
---@param ragdoll_fx ragdoll_fx
---@param impulse_x number
---@param impulse_y number
---@param entity_who_is_responsible entity_id? 0
---@param world_pos_x number? entity_x
---@param world_pos_y number? entity_y
---@param knockback_force number? 0
function EntityInflictDamage(entity, amount, damage_type, description, ragdoll_fx, impulse_x, impulse_y, entity_who_is_responsible, world_pos_x, world_pos_y, knockback_force) end

---Has the same effects that would occur if `entity` eats `amount` number of cells of `material_type` from the game world. Use this instead of directly modifying IngestionComponent values, if possible. Might not work with non-player entities. Use `CellFactory_GetType`() to convert a material name to material type.
---@param entity entity_id
---@param material_type integer
---@param amount number
function EntityIngestMaterial(entity, material_type, amount) end

---@param entity entity_id
---@param status_type_id string
function EntityRemoveIngestionStatusEffect(entity, status_type_id) end

---@param entity entity_id
---@param status_type_id string
---@param status_cooldown integer? 0
function EntityRemoveStainStatusEffect(entity, status_type_id, status_cooldown) end

---Adds random visible stains of `material_type` to entity. `amount` controls the number of stain cells added. Does nothing if `entity` doesn't have a SpriteStainsComponent. Use `CellFactory_GetType`() to convert a material name to material type.
---@param entity entity_id
---@param material_type integer
---@param amount number
function EntityAddRandomStains(entity, material_type, amount) end

---Modifies DamageModelComponents materials_that_damage and materials_how_much_damage variables (and their parsed out data structures)
---@param entity entity_id
---@param material_name string
---@param damage number
function EntitySetDamageFromMaterial(entity, material_name, damage) end

---Immediately refreshes the given SpriteComponent. Might be useful with text sprites if you want them to update more often than once a second.
---@param entity entity_id
---@param sprite_component component_id
function EntityRefreshSprite(entity, sprite_component) end

---Returns the capacity of a wand entity, or 0 if `entity` doesnt exist.
---@param entity entity_id
---@return integer
---@nodiscard
function EntityGetWandCapacity(entity) end

---Returns the position of a hot spot defined by a HotspotComponent. If `transformed` is true, will return the position in world coordinates, transformed using the entity's transform.
---@param entity entity_id
---@param hotspot_tag string
---@param transformed boolean
---@param include_disabled_components boolean? false
---@return number x
---@return number y
---@nodiscard
function EntityGetHotspot(entity, hotspot_tag, transformed, include_disabled_components) end

---Plays animation. Follow up animation (`followup_name`) is applied only if `followup_priority` is given.
---@param entity_id entity_id
---@param name string
---@param priority integer
---@param followup_name string? '""'
---@param followup_priority integer? 0
function GamePlayAnimation(entity_id, name, priority, followup_name, followup_priority) end

---@param entity_id entity_id
---@return number x
---@return number y
---@nodiscard
function GameGetVelocityCompVelocity(entity_id) end

---returns 0 on failure
---@param entity_id entity_id
---@param game_effect_name game_effect
---@return component_id component_id
---@nodiscard
function GameGetGameEffect(entity_id, game_effect_name) end

---@param entity_id entity_id
---@param game_effect_name game_effect
---@return integer
---@nodiscard
function GameGetGameEffectCount(entity_id, game_effect_name) end

---@param entity_id entity_id
---@param game_effect_entity_file string
---@return entity_id effect_entity_id
function LoadGameEffectEntityTo(entity_id, game_effect_entity_file) end

---@param entity_id entity_id
---@param game_effect_name game_effect
---@param always_load_new boolean
---@return component_id effect_component_id
---@return entity_id effect_entity_id
function GetGameEffectLoadTo(entity_id, game_effect_name, always_load_new) end

---Adds the entity to the polymorph random table
---@param entity_xml string
---@param is_rare boolean? false
---@param add_only_one_copy boolean? true
function PolymorphTableAddEntity(entity_xml, is_rare, add_only_one_copy) end

---Removes the entity from the polymorph random table
---@param entity_xml string
---@param from_common_table boolean? true
---@param from_rare_table boolean? true
function PolymorphTableRemoveEntity(entity_xml, from_common_table, from_rare_table) end

---Returns a list of all the entities in the polymorph random table
---@param rare_table boolean? false
---@return string[]
---@nodiscard
function PolymorphTableGet(rare_table) end

---Set a list of all entities sas the polymorph random table
---@param table_of_xml_entities string[]
---@param rare_table boolean? false
function PolymorphTableSet(table_of_xml_entities, rare_table) end

---@param x number
---@param y number
function SetPlayerSpawnLocation(x, y) end

---@param action_id string
function UnlockItem(action_id) end

---@param entity_id entity_id
---@return unsigned_integer
---@nodiscard
function GameGetPotionColorUint(entity_id) end

---Returns the centroid of first enabled HitboxComponent found in entity, the position of the entity if no hitbox is found, or nil if the entity does not exist. All returned positions are in world coordinates.
---@param entity_id entity_id
---@return number x
---@return number y
---@overload fun(entity_id: entity_id): nil
---@nodiscard
function EntityGetFirstHitboxCenter(entity_id) end

---Does a raytrace that stops on any cell it hits.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
---@nodiscard
function Raytrace(x1, y1, x2, y2) end

---Does a raytrace that stops on any cell that is not fluid, gas (yes, technically gas is a fluid), or fire.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
---@nodiscard
function RaytraceSurfaces(x1, y1, x2, y2) end

---Does a raytrace that stops on any cell that is not gas or fire.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
---@nodiscard
function RaytraceSurfacesAndLiquiform(x1, y1, x2, y2) end

---Does a raytrace that stops on any cell a character can stand on.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
---@nodiscard
function RaytracePlatforms(x1, y1, x2, y2) end

---@param ideal_pos_x number
---@param idea_pos_y number
---@param velocity_x number
---@param velocity_y number
---@param body_radius number
---@return number x
---@return number y
---@nodiscard
function FindFreePositionForBody(ideal_pos_x, idea_pos_y, velocity_x, velocity_y, body_radius) end

---@param pos_x number
---@param pos_y number
---@param ray_length number
---@param ray_count integer
---@return boolean found_normal
---@return number normal_x
---@return number normal_y
---@return number approximate_distance_from_surface
---@nodiscard
function GetSurfaceNormal(pos_x, pos_y, ray_length, ray_count) end

---Returns the approximate sky visibility (sky ambient level) at a point as a number between 0 and 1. The value is not affected by weather or time of day. This value is used by the post fx shader after some temporal and spatial smoothing.
---@param pos_x number
---@param pos_y number
---@return number sky
---@nodiscard
function GameGetSkyVisibility(pos_x, pos_y) end

---Returns an integer between 0 and 255. Larger value means more coverage. Returns -1 if query is outside the bounds of the fog of war grid. For performance reasons consider using the components that manipulate fog of war.
---@param pos_x number
---@param pos_y number
---@return integer fog_of_war
---@nodiscard
function GameGetFogOfWar(pos_x, pos_y) end

---Returns an integer between 0 and 255. Larger value means more coverage. Returns -1 if query is outside the bounds of the fog of war grid. The value is bilinearly filtered using four samples around `pos`. For performance reasons consider using the components that manipulate fog of war.
---@param pos_x number
---@param pos_y number
---@return integer fog_of_war
---@nodiscard
function GameGetFogOfWarBilinear(pos_x, pos_y) end

---`fog_of_war` should be between 0 and 255 (but will be clamped to the correct range with a int32->uint8 cast). Larger value means more coverage. Returns a boolean indicating whether or not the position was inside the bounds of the fog of war grid. For performance reasons consider using the components that manipulate fog of war.
---@param pos_x number
---@param pos_y number
---@param fog_of_war integer
---@return boolean pos_valid
function GameSetFogOfWar(pos_x, pos_y, fog_of_war) end

---Returns true if the area inside the bounding box has been streamed in and no pixel scenes are loading in the area (pixel scenes may not be loaded).
---@param min_x integer
---@param min_y integer
---@param max_x integer
---@param max_y integer
---@return boolean
function DoesWorldExistAt(min_x, min_y, max_x, max_y) end

---@param herd_name string
---@return integer
---@nodiscard
function StringToHerdId(herd_name) end

---@param herd_id integer
---@return string
---@nodiscard
function HerdIdToString(herd_id) end

---@param herd_id_a integer
---@param herd_id_b integer
---@return number
---@nodiscard
function GetHerdRelation(herd_id_a, herd_id_b) end

---Deprecated, use `EntityGetHerdRelationSafe`() instead.
---@param entity_a entity_id
---@param entity_b entity_id
---@return number
---@deprecated
---@nodiscard
function EntityGetHerdRelation(entity_a, entity_b) end

---does not spam errors, but returns 0 if anything fails
---@param entity_a entity_id
---@param entity_b entity_id
---@return number
---@nodiscard
function EntityGetHerdRelationSafe(entity_a, entity_b) end

---Deprecated, use `StringToHerdID`() and `ComponentSetValue2`() instead.
---@param entity_id entity_id
---@param new_herd_id string
---@deprecated
function GenomeSetHerdId(entity_id, new_herd_id) end

---NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid.
---@param pos_x number
---@param pos_y number
---@return entity_id entity_id
---@return number pos_x
---@return number pos_y
---@nodiscard
function EntityGetClosestWormAttractor(pos_x, pos_y) end

---NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid
---@param pos_x number
---@param pos_y number
---@return entity_id entity_id
---@return number pos_x
---@return number pos_y
---@return number radius
---@nodiscard
function EntityGetClosestWormDetractor(pos_x, pos_y) end

---@param log_line string
function GamePrint(log_line) end

---@param title string
---@param description string? '""'
---@param ui_custom_decoration_file string? '""'
function GamePrintImportant(title, description, ui_custom_decoration_file) end

---@return number x
---@return number y
---@nodiscard
function DEBUG_GetMouseWorld() end

---@param x number
---@param y number
---@param message string? '""'
---@param color_r number? 1
---@param color_g number? 0
---@param color_b number? 0
function DEBUG_MARK(x, y, message, color_r, color_g, color_b) end

---@return integer
---@nodiscard
function GameGetFrameNum() end

---Returns time in seconds to a high precision
---@return number
---@nodiscard
function GameGetRealWorldTimeSinceStarted() end

---Debugish function - returns if a key is down, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants
---@param key_code integer
---@return boolean
---@nodiscard
function InputIsKeyDown(key_code) end

---Debugish function - returns if a key is down this frame, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants
---@param key_code integer
---@return boolean
---@nodiscard
function InputIsKeyJustDown(key_code) end

---Debugish function - returns if a key is up this frame, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants
---@param key_code integer
---@return boolean
---@nodiscard
function InputIsKeyJustUp(key_code) end

---Debugish function - returns raw x, y coordinates of the mouse on screen
---@return number x
---@return number y
---@nodiscard
function InputGetMousePosOnScreen() end

---Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param mouse_button integer
---@return boolean
---@nodiscard
function InputIsMouseButtonDown(mouse_button) end

---Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param mouse_button integer
---@return boolean
---@nodiscard
function InputIsMouseButtonJustDown(mouse_button) end

---Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param mouse_button integer
---@return boolean
---@nodiscard
function InputIsMouseButtonJustUp(mouse_button) end

---Debugish function - returns if `joystick` button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param joystick_index integer
---@param joystick_button integer
---@return boolean
---@nodiscard
function InputIsJoystickButtonDown(joystick_index, joystick_button) end

---Debugish function - returns if `joystick` button is just down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param joystick_index integer
---@param joystick_button integer
---@return boolean
---@nodiscard
function InputIsJoystickButtonJustDown(joystick_index, joystick_button) end

---Debugish function - returns analog `joystick` button value 0-1. analog_button_index 0 = left trigger, 1 = right trigger Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param joystick_index integer
---@param analog_button_index integer
---@return number
---@nodiscard
function InputGetJoystickAnalogButton(joystick_index, analog_button_index) end

---Debugish function - returns true if `joystick` at that index is connected. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param joystick_index integer
---@return boolean
---@nodiscard
function InputIsJoystickConnected(joystick_index) end

---Debugish function - returns analog stick positions -1, +1. stick_id 0 = left, 1 = right, Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants
---@param joystick_index integer
---@param stick_id integer? 0
---@return number x
---@return number y
---@nodiscard
function InputGetJoystickAnalogStick(joystick_index, stick_id) end

---@param entity_id entity_id
---@return boolean
---@nodiscard
function IsPlayer(entity_id) end

---@param entity_id entity_id
---@return boolean
---@nodiscard
function IsInvisible(entity_id) end

---@return boolean
function GameIsDailyRun() end

---@return boolean
---@nodiscard
function GameIsDailyRunOrDailyPracticeRun() end

---@return boolean
---@nodiscard
function GameIsModeFullyDeterministic() end

---@param key string
---@param value string
function GlobalsSetValue(key, value) end

---@param key string
---@param default_value string? '""'
---@return any|nil global
---@nodiscard
function GlobalsGetValue(key, default_value) end

---@param key string
---@return string
---@nodiscard
function MagicNumbersGetValue(key) end

---@param new_seed integer
function SetWorldSeed(new_seed) end

---@param key string
---@return string
---@nodiscard
function SessionNumbersGetValue(key) end

---@param key string
---@param value string
function SessionNumbersSetValue(key, value) end

function SessionNumbersSave() end

function AutosaveDisable() end

---@param key string
---@return string|nil
---@nodiscard
function StatsGetValue(key) end

---@param key string
---@return string
---@nodiscard
function StatsGlobalGetValue(key) end

---@param key string
---@return string
---@nodiscard
function StatsBiomeGetValue(key) end

function StatsBiomeReset() end

---@param killed_entity_id entity_id? 0
function StatsLogPlayerKill(killed_entity_id) end

---@param action_id string
---@param x number? 0
---@param y number? 0
---@return entity_id entity_id
function CreateItemActionEntity(action_id, x, y) end

---@param x number
---@param y number
---@param max_level integer
---@param type integer
---@param i integer? 0
---@return string
---@nodiscard
function GetRandomActionWithType(x, y, max_level, type, i) end

---@param x number
---@param y number
---@param max_level number
---@param i integer? 0
---@return string
---@nodiscard
function GetRandomAction(x, y, max_level, i) end

---@return integer year
---@return integer month
---@return integer day
---@return integer hour
---@return integer minute
---@return integer second
---@nodiscard
function GameGetDateAndTimeUTC() end

---@return integer year
---@return integer month
---@return integer day
---@return integer hour
---@return integer minute
---@return integer second
---@return boolean jussi
---@return boolean mammi
---@nodiscard
function GameGetDateAndTimeLocal() end

---@param num_particles integer
---@param width_outside_camera number
---@param material_name string
---@param velocity_min number
---@param velocity_max number
---@param gravity number
---@param droplets_bounce boolean
---@param draw_as_long boolean
function GameEmitRainParticles(num_particles, width_outside_camera, material_name, velocity_min, velocity_max, gravity, droplets_bounce, draw_as_long) end

---Each beam adds a little overhead to things like chunk creation, so please call this sparingly.
---@param x integer
---@param y_min integer
---@param y_max integer
---@param radius number
---@param edge_darkening_width number
function GameCutThroughWorldVertical(x, y_min, y_max, radius, edge_darkening_width) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param width integer
---@param height integer
function BiomeMapSetSize(width, height) end

---if BIOME_MAP in magic_numbers.xml points to a lua file returns that context, if not will return the biome_map size
---@return integer width
---@return integer height
---@nodiscard
function BiomeMapGetSize() end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param color_int integer
function BiomeMapSetPixel(x, y, color_int) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@return integer color
---@nodiscard
function BiomeMapGetPixel(x, y) end

---Swaps red and blue channels of `color`. This can be used make sense of the `BiomeMapGetPixel`() return values. E.g. if( BiomeMapGetPixel( x, y ) == BiomeMapConvertPixelFromUintToInt( 0xFF36D517 ) ) then print(`hills`) end
---@param color integer
---@return integer
function BiomeMapConvertPixelFromUintToInt(color) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param image_filename string
function BiomeMapLoadImage(x, y, image_filename) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param image_filename string
---@param image_x integer
---@param image_y integer
---@param image_w integer
---@param image_h integer
function BiomeMapLoadImageCropped(x, y, image_filename, image_x, image_y, image_w, image_h) end

---@param x number
---@param y number
---@return number
---@nodiscard
function BiomeMapGetVerticalPositionInsideBiome(x, y) end

---@param x number? camera_x
---@param y number? camera_y
---@return string name
---@nodiscard
function BiomeMapGetName(x, y) end

---@param x number
---@param y number
function SetRandomSeed(x, y) end

---This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns int between 0 and `a`. If given 2 arguments returns int between `a` and `b`.
---@param a integer? optional
---@param b integer? optional
---@return number|integer
function Random(a, b) end

---This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns number between 0.0 and `a`. If given 2 arguments returns number between `a` and `b`.
---@param min number? optional
---@param max number? optional
---@return number
function Randomf(min, max) end

---@param min integer
---@param max integer
---@param mean integer
---@param sharpness number? 1
---@param baseline number? 0.005
---@return integer
function RandomDistribution(min, max, mean, sharpness, baseline) end

---@param min number
---@param max number
---@param mean number
---@param sharpness number? 1
---@param baseline number? 0.005
---@return number
function RandomDistributionf(min, max, mean, sharpness, baseline) end

---This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns int between 0 and `a`. If given 4 arguments returns number between `a` and `b`.
---@param x number
---@param y number
---@param a integer|number? optional
---@param b integer|number? optional
---@return integer|number
function ProceduralRandom(x, y, a, b) end

---This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns a number between 0 and `a`. If given 4 arguments returns a number between `a` and `b`.
---@param x number
---@param y number
---@param a number? optional
---@param b number? optional
---@return number
function ProceduralRandomf(x, y, a, b) end

---This is kinda messy. If given 2 arguments, returns 0 or 1. If given 3 arguments, returns an int between 0 and `a`. If given 4 arguments returns an int between `a` and `b`.
---@param x number
---@param y number
---@param a integer? optional
---@param b integer? optional
---@return number
function ProceduralRandomi(x, y, a, b) end

---Does not work with PhysicsBody2Component. Returns the id of the created physics body.
---@param entity_id entity_id
---@param image_file string
---@param material string? '""'
---@param offset_x number? 0
---@param offset_y number? 0
---@param centered boolean? false
---@param is_circle boolean? false
---@param material_image_file string? '""'
---@param use_image_as_colors boolean? true
---@return physics_body_id
function PhysicsAddBodyImage(entity_id, image_file, material, offset_x, offset_y, centered, is_circle, material_image_file, use_image_as_colors) end

---Does not work with PhysicsBody2Component. Returns the id of the created physics body.
---@param entity_id entity_id
---@param material string
---@param offset_x number
---@param offset_y number
---@param width integer
---@param height integer
---@param centered boolean? false
---@return integer|nil
function PhysicsAddBodyCreateBox(entity_id, material, offset_x, offset_y, width, height, centered) end

---Note: this function has a hidden 7th boolean parameter which does something and also can have as few as 3 arguments of unknown types. 
---Does not work with PhysicsBody2Component. Returns the id of the created joint.
---@param entity_id entity_id
---@param body_id0 integer
---@param body_id1 integer
---@param offset_x number
---@param offset_y number
---@param joint_type string
---@return integer|nil
function PhysicsAddJoint(entity_id, body_id0, body_id1, offset_x, offset_y, joint_type) end

---@param entity_id entity_id
---@param force_x number
---@param force_y number
function PhysicsApplyForce(entity_id, force_x, force_y) end

---@param entity_id entity_id
---@param torque number
function PhysicsApplyTorque(entity_id, torque) end

---@param entity_id entity_id
---@param component_id component_id
---@param torque number
function PhysicsApplyTorqueToComponent(entity_id, component_id, torque) end

---Applies a force calculated by `calculate_force_for_body_fn` to all bodies in an area.
---@param calculate_force_for_body_fn calculate_force_for_body_fn_type
---@param ignore_this_entity entity_id
---@param area_min_x number
---@param area_min_y number
---@param area_max_x number
---@param area_max_y number
function PhysicsApplyForceOnArea(calculate_force_for_body_fn, ignore_this_entity, area_min_x, area_min_y, area_max_x, area_max_y) end

---@param world_pos_min_x number
---@param world_pos_min_y number
---@param world_pos_max_x number
---@param world_pos_max_y number
function PhysicsRemoveJoints(world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y) end

---@param entity_id entity_id
---@param is_static boolean
function PhysicsSetStatic(entity_id, is_static) end

---@param entity_id entity_id
---@param component_id component_id
---@return number vel_x
---@return number vel_y
---@nodiscard
function PhysicsGetComponentVelocity(entity_id, component_id) end

---@param entity_id entity_id
---@param component_id component_id
---@return number vel
---@nodiscard
function PhysicsGetComponentAngularVelocity(entity_id, component_id) end

---NOTE! results are Box2D units. Velocities need to converted with PhysicsVecToGameVec.
---@param component_id component_id
---@return number x
---@return number y
---@return number angle
---@return number vel_x
---@return number vel_y
---@return number angular_vel
---@nodiscard
function PhysicsComponentGetTransform(component_id) end

---@param component_id component_id
---@param x number
---@param y number
---@param angle number
---@param vel_x number
---@param vel_y number
---@param angular_vel number
function PhysicsComponentSetTransform(component_id, x, y, angle, vel_x, vel_y, angular_vel) end

---NOTE! If component_id is given, will return all the bodies linked to that component. If component_id is not given, will return all the bodies linked to the entity (with joints or through components).
---@param entity_id entity_id
---@param component_id component_id? 0
---@return physics_body_id[]
---@nodiscard
function PhysicsBodyIDGetFromEntity(entity_id, component_id) end

---NOTE! returns an array of physics_body_id(s) of all the box2d bodies in the given area. The default coordinates are in game world space. If passing a sixth argument with true, we will assume the coordinates are in box2d units.
---@param world_pos_min_x number
---@param world_pos_min_y number
---@param world_pos_max_x number
---@param world_pos_max_y number
---@param include_static_bodies boolean? false
---@param are_these_box2d_units boolean? false
---@return physics_body_id[]
function PhysicsBodyIDQueryBodies(world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y, include_static_bodies, are_these_box2d_units) end

---NOTE! returns nil, if body was not found. Results are Box2D units. Velocities need to converted with PhysicsVecToGameVec.
---@param physics_body_id physics_body_id
---@return number x
---@return number y
---@return number angle
---@return number vel_x
---@return number vel_y
---@return number angular_vel
---@overload fun(physics_body_id: physics_body_id): nil
---@nodiscard
function PhysicsBodyIDGetTransform(physics_body_id) end

---Requires min 3 first parameters.
---@param physics_body_id physics_body_id
---@param x number
---@param y number
---@param angle number
---@param vel_x number
---@param vel_y number
---@param angular_vel number
function PhysicsBodyIDSetTransform(physics_body_id, x, y, angle, vel_x, vel_y, angular_vel) end

---NOTE! force is in box2d units. world_pos_ is game world coordinates. If world_pos is not given will use the objects center as the position of where the force will be applied.
---@param physics_body_id physics_body_id
---@param force_x number
---@param force_y number
---@param world_pos_x number? nil
---@param world_pos_y number? nil
function PhysicsBodyIDApplyForce(physics_body_id, force_x, force_y, world_pos_x, world_pos_y) end

---NOTE! impulse is in box2d units. world_pos_ is game world coordinates. If world_pos is not given will use the objects center as the position of where the force will be applied.
---@param physics_body_id physics_body_id
---@param force_x number
---@param force_y number
---@param world_pos_x number? nil
---@param world_pos_y number? nil
function PhysicsBodyIDApplyLinearImpulse(physics_body_id, force_x, force_y, world_pos_x, world_pos_y) end

---@param physics_body_id physics_body_id
---@param torque number
function PhysicsBodyIDApplyTorque(physics_body_id, torque) end

---NOTE! returns nil, if body was not found. Results are Box2D units.
---@param physics_body_id physics_body_id
---@return number x
---@return number y
---@nodiscard
function PhysicsBodyIDGetWorldCenter(physics_body_id) end

---NOTE! returns nil, if body was not found. Results are 0-1.
---@param physics_body_id physics_body_id
---@return number linear_damping
---@return number angular_damping
---@nodiscard
function PhysicsBodyIDGetDamping(physics_body_id) end

---NOTE! if angular_damping is given will set it as well.
---@param physics_body_id physics_body_id
---@param linear_damping number
---@param angular_damping number? nil
function PhysicsBodyIDSetDamping(physics_body_id, linear_damping, angular_damping) end

---NOTE! returns nil, if body was not found.
---@param physics_body_id physics_body_id
---@return number gravity_scale
---@nodiscard
function PhysicsBodyIDGetGravityScale(physics_body_id) end

---@param physics_body_id physics_body_id
---@param gravity_scale number
function PhysicsBodyIDSetGravityScale(physics_body_id, gravity_scale) end

---@param physics_body_id physics_body_id
---@return nil
---@nodiscard
function PhysicsBodyIDGetBodyAABB(physics_body_id) end

---@param entity_id entity_id
function PhysicsBody2InitFromComponents(entity_id) end

---@param x number
---@param y number? 0
---@return number x
---@return number y
---@nodiscard
function PhysicsPosToGamePos(x, y) end

---@param x number
---@param y number? 0
---@return number x
---@return number y
---@nodiscard
function GamePosToPhysicsPos(x, y) end

---@param x number
---@param y number? 0
---@return number x
---@return number y
---@nodiscard
function PhysicsVecToGameVec(x, y) end

---@param x number
---@param y number? 0
---@return number x
---@return number y
---@nodiscard
function GameVecToPhysicsVec(x, y) end

---@param world_pos_x number
---@param world_pos_y number
---@param image_filename string
---@param max_durability integer? 2147483647
function LooseChunk(world_pos_x, world_pos_y, image_filename, max_durability) end

---@param world_pos_x number
---@param world_pos_y number
---@param radius number
---@param force number
function VerletApplyCircularForce(world_pos_x, world_pos_y, radius, force) end

---@param world_pos_x number
---@param world_pos_y number
---@param radius number
---@param force_x number
---@param force_y number
function VerletApplyDirectionalForce(world_pos_x, world_pos_y, radius, force_x, force_y) end

---@param key string
---@return boolean is_new
function AddFlagPersistent(key) end

---@param key string
function RemoveFlagPersistent(key) end

---@param key string
---@return boolean
---@nodiscard
function HasFlagPersistent(key) end

---@param flag string
function GameAddFlagRun(flag) end

---@param flag string
function GameRemoveFlagRun(flag) end

---@param flag string
---@return boolean
---@nodiscard
function GameHasFlagRun(flag) end

---@param event_path string
---@param can_be_faded boolean
---@param x number
---@param y number
function GameTriggerMusicEvent(event_path, can_be_faded, x, y) end

---@param name string
function GameTriggerMusicCue(name) end

---@param relative_fade_speed number? 1
function GameTriggerMusicFadeOutAndDequeueAll(relative_fade_speed) end

---@param bank_filename string
---@param event_path string
---@param x number
---@param y number
function GamePlaySound(bank_filename, event_path, x, y) end

---Plays a sound through all AudioComponents with matching sound in `entity_id`.
---@param entity_id entity_id
---@param event_name string
function GameEntityPlaySound(entity_id, event_name) end

---Plays a sound loop through an AudioLoopComponent tagged with `component_tag` in `entity`. `intensity` & `intensity2` affect the intensity parameters passed to the audio event. Must be called every frame when the sound should play.
---@param entity entity_id
---@param component_tag string
---@param intensity number
---@param intensity2 number? 0
function GameEntityPlaySoundLoop(entity, component_tag, intensity, intensity2) end

---Can be used to pass custom parameters to the post_final shader, or override values set by the game code. The shader uniform called `parameter_name` will be set to the latest given values on this and following frames.
---@param parameter_name string
---@param x number
---@param y number
---@param z number
---@param w number
function GameSetPostFxParameter(parameter_name, x, y, z, w) end

---Will remove a post_final shader parameter value binding set via game `GameSetPostFxParameter`().
---@param parameter_name string
function GameUnsetPostFxParameter(parameter_name) end

---Can be used to pass 2D textures to the post_final shader. The shader uniform called `parameter_name` will be set to the latest given value on this and following frames. `texture_filename` can either point to a file, or a virtual file created using the ModImage API. 
---If `update_texture` is true, the texture will be re-uploaded to the GPU (could be useful with dynamic textures, but will incur a heavy performance hit with textures that are loaded from the disk). 
---Accepted values for `filtering_mode` and `wrapping_mode` can be found in 'data/libs/utilities.lua'. Each call with a unique `parameter_name` will create a separate texture while the parameter is in use, so this should be used with some care. While it's possible to change `texture_filename` on the fly, if texture size changed, this causes destruction of the old texture and allocating a new one, which can be quite slow.
---@param parameter_name string
---@param texture_filename string
---@param filtering_mode integer
---@param wrapping_mode integer
---@param update_texture boolean? false
function GameSetPostFxTextureParameter(parameter_name, texture_filename, filtering_mode, wrapping_mode, update_texture) end

---Will remove a post_final shader parameter value binding set via game `GameSetPostFxTextureParameter`().
---@param name string
function GameUnsetPostFxTextureParameter(name) end

---@param text_or_key string
---@return string
---@nodiscard
function GameTextGetTranslatedOrNot(text_or_key) end

---@param key string
---@param param0 string? '""'
---@param param1 string? '""'
---@param param2 string? '""'
---@return string
---@nodiscard
function GameTextGet(key, param0, param1, param2) end

---@return gui gui
function GuiCreate() end

---@param gui gui
function GuiDestroy(gui) end

---@param gui gui
function GuiStartFrame(gui) end

---Sets the options that apply to widgets during this frame. For `option` use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutive calls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. The options will be cleared on next call to `GuiStartFrame`().
---@param gui gui
---@param option integer
function GuiOptionsAdd(gui, option) end

---Sets the options that apply to widgets during this frame. For `option` use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutive calls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. The options will be cleared on next call to `GuiStartFrame`().
---@param gui gui
---@param option integer
function GuiOptionsRemove(gui, option) end

---Clears the options that apply to widgets during this frame.
---@param gui gui
function GuiOptionsClear(gui) end

---@param gui gui
---@param option integer
function GuiOptionsAddForNextWidget(gui, option) end

---Sets the color of the next widget during this frame. Color components should be in the 0-1 range.
---@param gui gui
---@param red number
---@param green number
---@param blue number
---@param alpha number
function GuiColorSetForNextWidget(gui, red, green, blue, alpha) end

---Sets the rendering depth (`z`) of the widgets following this call. Larger z = deeper. The z will be set to 0 on the next call to `GuiStartFrame`().
---@param gui gui
---@param z number
function GuiZSet(gui, z) end

---@param gui gui
---@param z number
function GuiZSetForNextWidget(gui, z) end

---Can be used to solve ID conflicts. All ids given to Gui* functions will be hashed with the ids stacked (and hashed together) using `GuiIdPush`() and `GuiIdPop`(). The id stack has a max size of 1024, and calls to the function will do nothing if the size is exceeded.
---@param gui gui
---@param id integer
function GuiIdPush(gui, id) end

---Pushes the hash of `str` as a gui id. See `GuiIdPush`().
---@param gui gui
---@param str string
function GuiIdPushString(gui, str) end

---See `GuiIdPush`().
---@param gui gui
function GuiIdPop(gui) end

---Starts a scope where animations initiated using `GuiAnimateAlphaFadeIn`() etc. will be applied to all widgets.
---@param gui gui
function GuiAnimateBegin(gui) end

---Ends a scope where animations initiated using `GuiAnimateAlphaFadeIn`() etc. will be applied to all widgets.
---@param gui gui
function GuiAnimateEnd(gui) end

---Does an alpha tween animation for all widgets inside a scope set using `GuiAnimateBegin`() and `GuiAnimateEnd`().
---@param gui gui
---@param id integer
---@param speed number
---@param step number
---@param reset boolean
function GuiAnimateAlphaFadeIn(gui, id, speed, step, reset) end

---Does a scale tween animation for all widgets inside a scope set using `GuiAnimateBegin`() and `GuiAnimateEnd`().
---@param gui gui
---@param id integer
---@param acceleration number
---@param reset boolean
function GuiAnimateScaleIn(gui, id, acceleration, reset) end

---@param gui gui
---@param x number
---@param y number
---@param text string
---@param scale number? 1
---@param font string? '""'
---@param font_is_pixel_font boolean? true
function GuiText(gui, x, y, text, scale, font, font_is_pixel_font) end

---Deprecated. Use `GuiOptionsAdd`() or `GuiOptionsAddForNextWidget`() with GUI_OPTION.Align_HorizontalCenter and `GuiText`() instead.
---@param gui gui
---@param x number
---@param y number
---@param text string
---@deprecated
function GuiTextCentered(gui, x, y, text) end

---`scale` will be used for `scale_y` if `scale_y` equals 0. 
---Due to a bug the function will sometimes stop working unless alpha, scale, scale_y are passed. For this reason it is recommended to fill in the default parameters.
---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param sprite_filename string
---@param alpha number? 1
---@param scale number? 1
---@param scale_y number? 0
---@param rotation number? 0
---@param rect_animation_playback_type integer? GUI_RECT_ANIMATION_PLAYBACK.PlayToEndAndHide
---@param rect_animation_name string? '""'
function GuiImage(gui, id, x, y, sprite_filename, alpha, scale, scale_y, rotation, rect_animation_playback_type, rect_animation_name) end

---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param alpha number? 1
---@param sprite_filename string? '"data/ui_gfx/decorations/9piece0_gray.png"'
---@param sprite_highlight_filename string? '"data/ui_gfx/decorations/9piece0_gray.png"'
function GuiImageNinePiece(gui, id, x, y, width, height, alpha, sprite_filename, sprite_highlight_filename) end

---The old parameter order where `id` is the last parameter is still supported. The function dynamically picks the correct order based on the type of the 4th parameter.
---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param text string
---@param scale number? 1
---@param font string? '""'
---@param font_is_pixel_font boolean? true
---@return boolean clicked
---@return boolean right_clicked
---@overload fun(gui: gui, x: number, y: number, text: string, id: integer): clicked: boolean, right_clicked: boolean
function GuiButton(gui, id, x, y, text, scale, font, font_is_pixel_font) end

---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param text string
---@param sprite_filename string
---@return boolean clicked
---@return boolean right_clicked
function GuiImageButton(gui, id, x, y, text, sprite_filename) end

---This is not intended to be outside mod settings menu, and might bug elsewhere.
---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param text string
---@param value number
---@param value_min number
---@param value_max number
---@param value_default number
---@param value_display_multiplier number
---@param value_formatting string
---@param width number
---@return number new_value
function GuiSlider(gui, id, x, y, text, value, value_min, value_max, value_default, value_display_multiplier, value_formatting, width) end

---`allowed_characters` should consist only of ASCII characters. This is not intended to be outside mod settings menu, and might bug elsewhere.
---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param text string
---@param width number
---@param max_length integer
---@param allowed_characters string? '""'
---@return string new_text
---@nodiscard
function GuiTextInput(gui, id, x, y, text, width, max_length, allowed_characters) end

---@param gui gui
function GuiBeginAutoBox(gui) end

---@param gui gui
---@param margin number? 5
---@param size_min_x number? 0
---@param size_min_y number? 0
---@param mirrorize_over_x_axis boolean? false
---@param x_axis number? 0
---@param sprite_filename string? '"data/ui_gfx/decorations/9piece0_gray.png"'
---@param sprite_highlight_filename string? '"data/ui_gfx/decorations/9piece0_gray.png"'
function GuiEndAutoBoxNinePiece(gui, margin, size_min_x, size_min_y, mirrorize_over_x_axis, x_axis, sprite_filename, sprite_highlight_filename) end

---@param gui gui
---@param text string
---@param description string
function GuiTooltip(gui, text, description) end

---This can be used to create a container with a vertical scroll bar. Widgets between `GuiBeginScrollContainer`() and `GuiEndScrollContainer`() will be positioned relative to the container.
---@param gui gui
---@param id integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param scrollbar_gamepad_focusable boolean? true
---@param margin_x number? 2
---@param margin_y number? 2
function GuiBeginScrollContainer(gui, id, x, y, width, height, scrollbar_gamepad_focusable, margin_x, margin_y) end

---@param gui gui
function GuiEndScrollContainer(gui) end

---If `position_in_ui_scale` is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
---@param gui gui
---@param x number
---@param y number
---@param position_in_ui_scale boolean? false
---@param margin_x number? 2
---@param margin_y number? 2
function GuiLayoutBeginHorizontal(gui, x, y, position_in_ui_scale, margin_x, margin_y) end

---If `position_in_ui_scale` is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
---@param gui gui
---@param x number
---@param y number
---@param position_in_ui_scale boolean? false
---@param margin_x number? 0
---@param margin_y number? 0
function GuiLayoutBeginVertical(gui, x, y, position_in_ui_scale, margin_x, margin_y) end

---Will use the horizontal margin from current layout if amount is not set.
---@param gui gui
---@param amount number? optional
function GuiLayoutAddHorizontalSpacing(gui, amount) end

---Will use the vertical margin from current layout if amount is not set.
---@param gui gui
---@param amount number? optional
function GuiLayoutAddVerticalSpacing(gui, amount) end

---@param gui gui
function GuiLayoutEnd(gui) end

---Puts following things to a new layout layer. Can be used to create non-layouted widgets inside a layout.
---@param gui gui
function GuiLayoutBeginLayer(gui) end

---@param gui gui
function GuiLayoutEndLayer(gui) end

---Returns dimensions of viewport in the gui coordinate system (which is equal to the coordinates of the screen bottom right corner in gui coordinates). The values returned may change depending on the game resolution because the UI is scaled for pixel-perfect text rendering.
---@param gui gui
---@return number width
---@return number height
---@nodiscard
function GuiGetScreenDimensions(gui) end

---Returns size of the given text in the gui coordinate system.
---@param gui gui
---@param text string
---@param scale number? 1
---@param line_spacing number? 2
---@param font string? '""'
---@param font_is_pixel_font boolean? true
---@return number width
---@return number height
---@nodiscard
function GuiGetTextDimensions(gui, text, scale, line_spacing, font, font_is_pixel_font) end

---Returns size of the given image in the gui coordinate system.
---@param gui gui
---@param image_filename string
---@param scale number? 1
---@return number width
---@return number height
---@nodiscard
function GuiGetImageDimensions(gui, image_filename, scale) end

---Returns the final position, size etc calculated for a widget. Some values aren't supported by all widgets.
---@param gui gui
---@return boolean clicked
---@return boolean right_clicked
---@return boolean hovered
---@return number x
---@return number y
---@return number width
---@return number height
---@return number draw_x
---@return number draw_y
---@return number draw_width
---@return number draw_height
---@nodiscard
function GuiGetPreviousWidgetInfo(gui) end

---@return boolean
---@nodiscard
function GameIsBetaBuild() end

---@return boolean
---@nodiscard
function DebugGetIsDevBuild() end

function DebugEnableTrailerMode() end

---@return boolean
---@nodiscard
function GameGetIsTrailerModeEnabled() end

---This doesn't do anything at the moment.
function Debug_SaveTestPlayer() end

---@param x number? camera_x
---@param y number? camera_y
---@return string
---@nodiscard
function DebugBiomeMapGetFilename(x, y) end

---@param entity_id entity_id
---@param material string
---@param use_material_colors boolean? true
function EntityConvertToMaterial(entity_id, material, use_material_colors) end

---@param material_dynamic string? '""'
---@param material_static string? '""'
function ConvertEverythingToGold(material_dynamic, material_static) end

---Converts `material_from` to `material_to` everwhere in the game world, replaces `material_from_type` to `material_to_type` in the material (CellData) global table, and marks `material_from` as a "Transformed" material. Every call will add a new entry to WorldStateComponent which serializes these changes, so please call sparingly. The material conversion will be spread over multiple frames. `material_from` will still retain the original name id and wang color. Use `CellFactory_GetType`() to convert a material name to material type.
---@param material_from_type integer
---@param material_to_type integer
function ConvertMaterialEverywhere(material_from_type, material_to_type) end

---Converts cells of `material_from_type` to `material_to_type` in the given area. If `box2d_trim` is true, will attempt to trim the created cells where they might otherwise cause physics glitching. `update_edge_graphics_dummy` is not yet supported.
---@param area_x integer
---@param area_y integer
---@param area_w integer
---@param area_h integer
---@param material_from_type integer
---@param material_to_type integer
---@param trim_box2d boolean
---@param update_edge_graphics_dummy boolean
function ConvertMaterialOnAreaInstantly(area_x, area_y, area_w, area_h, material_from_type, material_to_type, trim_box2d, update_edge_graphics_dummy) end

---Loads a given .txt file as a ragdoll into the game, made of the material given in material.
---@param filename string
---@param pos_x number
---@param pos_y number
---@param material string? '"meat"'
---@param scale_x number? 1
---@param impulse_x number? 0
---@param impulse_y number? 0
function LoadRagdoll(filename, pos_x, pos_y, material, scale_x, impulse_x, impulse_y) end

---@return integer
---@nodiscard
function GetDailyPracticeRunSeed() end

---Returns true if a mod with the id `mod_id` is currently active. For example mod_id = "nightmare".
---@param mod_id string
---@return boolean
---@nodiscard
function ModIsEnabled(mod_id) end

---Returns a table filled with the IDs of currently active mods.
---@return string[]
---@nodiscard
function ModGetActiveModIDs() end

---@return integer
---@nodiscard
function ModGetAPIVersion() end

---Returns true if the file exists.
---@param filename string
---@return boolean
function ModDoesFileExist(filename) end

---Returns a list of filenames from which materials were loaded. Only works in `OnModInit`() and later
---@return string[]
---@nodiscard
function ModMaterialFilesGet() end

---Returns the value of a mod setting. `id` should normally be in the format 'mod_name.setting_id'. Cache the returned value in your lua context if possible.
---@param id string
---@return boolean|number|string|nil
---@nodiscard
function ModSettingGet(id) end

---@param id string
---@param value boolean|number|string
function ModSettingSet(id, value) end

---Returns the latest value set by the user, which might not be equal to the value that is used in the game (depending on the `scope` value selected for the setting).
---@param id string
---@return boolean|number|string|nil
---@nodiscard
function ModSettingGetNextValue(id) end

---Sets the latest value set by the user, which might not be equal to the value that is displayed to the game (depending on the `scope` value selected for the setting).
---@param id string
---@param value boolean|number|string
---@param is_default boolean
function ModSettingSetNextValue(id, value, is_default) end

---@param id string
---@return boolean was_removed
function ModSettingRemove(id) end

---Returns the number of mod settings defined. Use ModSettingGetAtIndex to enumerate the settings.
---@return integer
---@nodiscard
function ModSettingGetCount() end

---`index` should be 0-based index. Returns nil if `index` is invalid.
---@param index integer
---@return string name
---@return boolean|number|string|nil value
---@return boolean|number|string|nil value_next
---@overload fun(index: integer): nil
---@nodiscard
function ModSettingGetAtIndex(index) end

---@return boolean
---@nodiscard
function StreamingGetIsConnected() end

---@return string
---@nodiscard
function StreamingGetConnectedChannelName() end

---@return integer
---@nodiscard
function StreamingGetVotingCycleDurationFrames() end

---@return string
---@nodiscard
function StreamingGetRandomViewerName() end

---@return boolean
---@nodiscard
function StreamingGetSettingsGhostsNamedAfterViewers() end

---Sets the duration of the next wait and voting phases. Use -1 for default duration.
---@param time_between_votes_seconds number
---@param time_voting_seconds number
function StreamingSetCustomPhaseDurations(time_between_votes_seconds, time_voting_seconds) end

---Cancels whatever is currently going on, and starts a new voting. `_streaming_on_vote_start`() and `_streaming_get_event_for_vote`() will be called as usually.
function StreamingForceNewVoting() end

---Turns the voting UI on or off.
---@param enabled boolean
function StreamingSetVotingEnabled(enabled) end

---Basically calls dofile(from_filename) at the end of `to_filename`. Available only in init.lua. Should not be called after OnMostPostInit(should be avoided after that because changes might not propagate, or could work in non-deterministic manner).
---@param to_filename string
---@param from_filename string
function ModLuaFileAppend(to_filename, from_filename) end

---Returns the paths of files that have been appended to `filename` using `ModLuaFileAppend`(). Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return string[]
---@nodiscard
function ModLuaFileGetAppends(filename) end

---Replaces the appends list (see ModLuaFileAppend) of a file with the given table. Available only in init.lua. Should not be called after OnMostPostInit(should be avoided after that because changes might not propagate, or could work in non-deterministic manner).
---@param filename string
---@param appends string[]
function ModLuaFileSetAppends(filename, appends) end

---Returns the current (modded or not) content of the data file `filename`. Allows access only to data files and files from enabled mods. "mods/mod/data/file.xml" and "data/file.xml" point to the same file. Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return string
---@nodiscard
function ModTextFileGetContent(filename) end

---Sets the content the game sees for the file `filename`. Allows access only to mod and data files. "mods/mod/data/file.xml" and "data/file.xml" point to the same file. Available only in init.lua. Should not be called after OnMostPostInit (should be avoided after that because changes might not propagate, or could work in non-deterministic manner). ModTextFileWhoSetContent might also return incorrect values if this is used after OnMostPostInit.
---@param filename string
---@param new_content string
function ModTextFileSetContent(filename, new_content) end

---Returns the id of the last mod that called ModTextFileSetContent with `filename`, or "". Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return string
function ModTextFileWhoSetContent(filename) end

---Makes an image available for in-memory editing through `ModImageGetPixel`() and `ModImageSetPixel`().  
---Returns an id that can be used to access the image, and the dimensions of the image.  
---If an image file with the name wasn't found, an in-memory image of the given size will be created, filled with empty pixels (0x0), and added to the virtual filesystem under `filename`.  
---If an image with the given name has been previously created through ModImageMakeEditable, the id of that image will be returned. In case memory allocation failed, or if this is called outside mod init using a filename that wasn't succesfully used with this function during the init, 0 will be returned as the id.  
---The game will apply further processing to some images, so the final binary data might end up different. For example, R and B channels are sometimes swapped, and on some textures the colors will be extended by one pixel outside areas where A>0.  
---If game code has already loaded the image (for example this could be the case with some UI textures), the changes will probably not be applied.  
---The changes done using the ModImage* API will need to be done again on each game restart/new game. It's possible that some images will be cached over restarts, and changes will not be visible in the game until a full executable restart - you will have to figure out where that applies.  
---Allows access to data files and files from enabled mods. "mods/mod/data/file.png" and "data/file.png" point to the same file. Available only in init.lua during mod init.
---@param filename string
---@param width integer
---@param height integer
---@return integer id
---@return integer w
---@return integer h
function ModImageMakeEditable(filename, width, height) end

---Returns an id that can be used with ModImageGetPixel and ModImageSetPixel, and the dimensions of the image.  
--- If a previous successful call to ModImageMakeEditable hasn't been made with the given filename, 0 will be returned as `id`, `w` and `h`.  
---Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return integer id
---@return integer w
---@return integer h
function ModImageIdFromFilename(filename) end

---Returns the color of a pixel in ABGR format (0xABGR). `x` and `y` are zero-based.  
---Use ModImageMakeEditable to create an id that can be used with this function.  
--- While it's possible to edit images after mod init, it's not guaranteed that game systems will see the changes, as the system might already have loaded the image at that point.  
---The function will silently fail nad return 0 if `id` isn't valid.  
---Unlike most Mod* functions, this one is available everywhere.
---@param id integer
---@param x integer
---@param y integer
---@return unsigned_integer
---@nodiscard
function ModImageGetPixel(id, x, y) end

---Sets the color of a pixel in ABGR format (0xABGR). `x` and `y` are zero-based.  
---Use ModImageMakeEditable to create an id that can be used with this function.  
--- The function will silently fail if `id` isn't valid.  
---Unlike most Mod* functions, this one is available everywhere.
---@param id integer
---@param x integer
---@param y integer
---@param color unsigned_integer
function ModImageSetPixel(id, x, y, color) end

---Returns the id of the last mod that called ModImageMakeEditable with `filename`, or "". Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return string
function ModImageWhoSetContent(filename) end

---Returns true if a file or virtual image exists for the given filename. Unlike most Mod* functions, this one is available everywhere.
---@param filename string
---@return boolean
function ModImageDoesExist(filename) end

---Available only during mod initialization in init.lua.
---@param filename string
function ModMagicNumbersFileAdd(filename) end

---Available only during mod initialization in init.lua.
---@param filename string
function ModMaterialsFileAdd(filename) end

---Registers custom fmod events. Needs to be called to make the game find events in mods' audio banks. Event mapping (GUID) files can be generated using FMOD Studio. Available only during mod initialization in init.lua.
---@param filename string
function ModRegisterAudioEventMappings(filename) end

---Registers a custom bank in the music system. After that the tracks can be configured to play through Biome xml, or using GameTriggerMusicEvent. ModRegisterAudioEventMappings also needs to be called to make the game recognize the events in the bank. Available only during mod initialization in init.lua.
---@param filename string
function ModRegisterMusicBank(filename) end

---Please supply a path starting with "mods/YOUR_MOD_HERE/" or "data/". If override_existing is true, will always generate new maps, overriding existing files. UV maps are generated when you start or continue a game with your mod enabled. Available only during mod initialization in init.lua via noita_dev.exe
---@param directory_path string
---@param override_existing boolean? false
function ModDevGenerateSpriteUVsForDirectory(directory_path, override_existing) end

---@param entity_filename string
function RegisterProjectile(entity_filename) end

---@param action_id string
---@param action_name string
---@param action_description string
---@param action_sprite_filename string
---@param action_unidentified_sprite_filename string
---@param action_type number
---@param action_spawn_level string
---@param action_spawn_probability string
---@param action_spawn_requires_flag string
---@param action_spawn_manual_unlock boolean
---@param action_max_uses number
---@param custom_xml_file string
---@param action_mana_drain number
---@param action_is_dangerous_blast boolean
---@param action_draw_many_count number
---@param action_ai_never_uses boolean
---@param action_never_unlimited boolean
---@param state_shuffled boolean
---@param state_cards_drawn number
---@param state_discarded_action boolean
---@param state_destroyed_action boolean
---@param fire_rate_wait number
---@param speed_multiplier number
---@param child_speed_multiplier number
---@param dampening number
---@param explosion_radius number
---@param spread_degrees number
---@param pattern_degrees number
---@param screenshake number
---@param recoil number
---@param damage_melee_add number
---@param damage_projectile_add number
---@param damage_electricity_add number
---@param damage_fire_add number
---@param damage_explosion_add number
---@param damage_ice_add number
---@param damage_slice_add number
---@param damage_healing_add number
---@param damage_curse_add number
---@param damage_drill_add number
---@param damage_null_all number
---@param damage_critical_chance number
---@param damage_critical_multiplier number
---@param explosion_damage_to_materials number
---@param knockback_force number
---@param reload_time number
---@param lightning_count number
---@param material string
---@param material_amount number
---@param trail_material string
---@param trail_material_amount number
---@param bounces number
---@param gravity number
---@param light number
---@param blood_count_multiplier number
---@param gore_particles number
---@param ragdoll_fx number
---@param friendly_fire boolean
---@param physics_impulse_coeff number
---@param lifetime_add number
---@param sprite string
---@param extra_entities string
---@param game_effect_entities string
---@param sound_loop_tag string
---@param projectile_file string
function RegisterGunAction(action_id, action_name, action_description, action_sprite_filename, action_unidentified_sprite_filename, action_type, action_spawn_level, action_spawn_probability, action_spawn_requires_flag, action_spawn_manual_unlock, action_max_uses, custom_xml_file, action_mana_drain, action_is_dangerous_blast, action_draw_many_count, action_ai_never_uses, action_never_unlimited, state_shuffled, state_cards_drawn, state_discarded_action, state_destroyed_action, fire_rate_wait, speed_multiplier, child_speed_multiplier, dampening, explosion_radius, spread_degrees, pattern_degrees, screenshake, recoil, damage_melee_add, damage_projectile_add, damage_electricity_add, damage_fire_add, damage_explosion_add, damage_ice_add, damage_slice_add, damage_healing_add, damage_curse_add, damage_drill_add, damage_null_all, damage_critical_chance, damage_critical_multiplier, explosion_damage_to_materials, knockback_force, reload_time, lightning_count, material, material_amount, trail_material, trail_material_amount, bounces, gravity, light, blood_count_multiplier, gore_particles, ragdoll_fx, friendly_fire, physics_impulse_coeff, lifetime_add, sprite, extra_entities, game_effect_entities, sound_loop_tag, projectile_file) end

function RegisterGunShotEffects() end

---@param entity_filename string
function BeginProjectile(entity_filename) end

function EndProjectile() end

---@param timeout_frames integer
function BeginTriggerTimer(timeout_frames) end

function BeginTriggerHitWorld() end

function BeginTriggerDeath() end

function EndTrigger() end

function SetProjectileConfigs() end

---@param reload_time integer
function StartReload(reload_time) end

---@param inventoryitem_id entity_id
---@param uses_remaining integer
---@return boolean uses_remaining_reduced
function ActionUsesRemainingChanged(inventoryitem_id, uses_remaining) end

---@param inventoryitem_id entity_id
function ActionUsed(inventoryitem_id) end

---@param action_name string
function LogAction(action_name) end

---@param action_id string
function OnActionPlayed(action_id) end

function OnNotEnoughManaForAction() end

---@param name string
function BaabInstruction(name) end

---@param key string
---@param value number
function SetValueNumber(key, value) end

---@param key string
---@param default_value number
---@return number
---@nodiscard
function GetValueNumber(key, default_value) end

---@param key string
---@param value integer
function SetValueInteger(key, value) end

---@param key string
---@param default_value integer
---@return integer
---@nodiscard
function GetValueInteger(key, default_value) end

---@param key string
---@param value boolean
function SetValueBool(key, value) end

---@param key string
---@param default_value boolean
---@return boolean
---@nodiscard
function GetValueBool(key, default_value) end

---Returns the script's return value, if any. Returns nil, `error_string` if the script had errors. For performance reasons it is recommended scripts use `dofile_once`(), unless the standard `dofile`() behaviour is required.
---@param filename string
---@return any script_return_type
---@overload fun(filename: string): (nil, error_string: string)
function dofile(filename)
	local impl = __loaded[filename]
	if impl == nil then
		impl, error_message = loadfile(filename)
		if impl == nil then
			return impl, error_message
		end
		__loaded[filename] = impl
	end
	local result = impl()
	do_mod_appends(filename)
	return result
end

---Runs the script only once per lua context, returns the script's return value, if any. Returns nil, `error_string` if the script had errors. For performance reasons it is recommended scripts use `dofile_once`(), unless the standard `dofile`() behaviour is required.
---@param filename string
---@return any script_return_type
---@overload fun(filename: string): (nil, error_string: string)
function dofile_once(filename)
	local result = nil
	local cached = __loadonce[filename]
	if cached ~= nil then
		result = cached[1]
	else
		local impl, error_message = loadfile(filename)
		if impl == nil then
			return impl, error_message
		end
		result = impl()
		__loadonce[filename] = { result }
		do_mod_appends(filename)
	end
	return result
end

