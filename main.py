import re

from bs4 import BeautifulSoup

TESTING = True


def maybe_entity(name):
    return "entity" in name or "item" in name or "parent" in name or "child" in name


def do_int(src, name):
    if "integer" not in src:
        src = src.replace("int", "integer")
    if "uinteger32" in src:
        return src.replace("uinteger32", "unsigned_integer")
    if "uinteger" in src:
        return src.replace("uinteger", "unsigned_integer")
    if "component" in name:
        return src.replace("integer", "component_id")
    if "physics_body_id" in name:
        return src.replace("integer", "physics_body_id")
    if maybe_entity(name):
        return src.replace("integer", "entity_id")
    return src


def type_alias(src, name):
    if "{" in src:
        if "-" in src:
            src = src.replace("-", "]:")
            src = src.replace("{", "{[")
        else:
            src = src.replace("{", "")
            src = src.replace("}", "[]")
    src = src.replace("float", "number")
    src = src.replace("multiple_types", "any")
    src = src.replace("multipletypes", "any")
    src = src.replace("obj", "gui")
    src = src.replace("int_body_id", "physics_body_id")
    src = src.replace("item_entity_id", "entity_id")
    if "component_type" in name:
        src = src.replace("string", "component_type")
    if "damage_type" in name:
        src = src.replace("string", "damage_type")
    if "game_effect_name" in name:
        src = src.replace("string", "game_effect")
    if "material_type" in name:
        src = src.replace("number", "integer")
    if "boolean" not in src:
        src = src.replace("bool", "boolean")
    if "int" in src:
        src = do_int(src, name)
    if "ragdoll_fx" in name:
        src = src.replace("string", "ragdoll_fx")
    if src[-1] in ".-":
        src = src[:-1]
    return src


base_path = (
    "/home/nathan/.local/share/Steam/steamapps/common/Noita/tools_modding/"
    if TESTING
    else input("modding api folder path: ") + "/"
)
doc_path = base_path + "lua_api_documentation.html"
comp_path = base_path + "component_documentation.txt"
with open(doc_path, "r", encoding="utf-8") as f:
    html = f.read()

with open(comp_path, "r", encoding="utf-8") as f:
    comp_data = f.read()

components = []
for line in comp_data.split("\n"):
    if not len(line):
        continue
    if line[0] in " \t":
        continue
    components.append(line)

component_type = "---@alias component_type " + " | ".join(
    [f'"{x}"' for x in components]
)

out = f"""---@diagnostic disable: unused-local, missing-return, cast-local-type, return-type-mismatch
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
---@alias script_polymorphing_to fun(entity_we_are_about_to_polymorph_to: string)
---@alias script_biome_entered fun(biome_name: string, biome_old_name: string)

---@alias calculate_force_for_body_fn_type fun(body_entity: physics_body_id, body_mass: number, body_x: number, body_y: number, body_vel_x: number, body_vel_y: number, body_vel_angular: number): (force_world_pos_x: number, force_world_pos_y: number, force_x:number, force_y:number, force_angular:number)

{component_type}
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
---@type {{[string]: fun(): any}}
__loaded = {{}}

---Represents cached dofile_once results, if a file is here dofile_once won't execute it again.
---@type {{[string]: {{[1]: any}}}}
__loadonce = {{}}

---Represents cached version of the current file. Only exists in lua component scripts.
---@return any
function ____cached_func() end

-- Noita runs luajit, version is 5.1 though.
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
"""

overrides = {
    "GetParallelWorldPosition": {"ret": "x:number,y:number"},
    "InputGetJoystickAnalogStick": {"ret": "x:number,y:number"},
    "BiomeMapGetName": {"ret": "name:string"},
    "AddFlagPersistent": {"ret": "is_new:boolean"},
    "GuiTextInput": {"ret": "new_text:string"},
    "ComponentGetVector": {"ret": "{int}|{number}|{string}|nil"},
    "AddMaterialInventoryMaterial": {
        "comment": "This function actually sets the amount in the inventory rather than adding."
    },
    "GameGetRealWorldTimeSinceStarted": {
        "comment": "Returns time in seconds to a high precision"
    },
    "EntityAddComponent2": {
        "args": "entity_id:int, component_type_name: string, table_of_component_values:{string-multiple_types} = nil"
    },
    "GlobalsGetValue": {"ret": "global:any|nil"},
    "EntityGetAllComponents": {"ret": "components:{int}"},
    "LoadPixelScene": {
        "args": 'materials_filename:string, colors_filename:string, x:number, y:number, background_file:string = "", skip_biome_checks:bool = false, skip_edge_textures:bool = false, color_to_material_table:{string-string} = {}, background_z_index:int = 50, load_even_if_duplicate:bool = false '
    },
    "GuiButton": {
        "overload": {
            "args": "(gui: gui, x: number, y: number, text: string, id: integer)",
            "ret": "clicked: boolean, right_clicked: boolean",
        }
    },
    "GameOnCompleted": {
        "comment": 'Grants the victory steam achievement, to get a victory screen use:\n```lua\nGameAddFlagRun("ending_game_completed")\n```'
    },
    "dofile": {
        "ret": "script_return_type:any",
        "overload": {"ret": "(nil, error_string: string)"},
        "comment": "Returns the script's return value, if any. Returns nil, `error_string` if the script had errors. For performance reasons it is recommended scripts use dofile_once(), unless the standard dofile() behaviour is required.",
        "implementation": """
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
""",
    },
    "dofile_once": {
        "ret": "script_return_type:any",
        "overload": {"ret": "(nil, error_string: string)"},
        "comment": "Runs the script only once per lua context, returns the script's return value, if any. Returns nil, `error_string` if the script had errors. For performance reasons it is recommended scripts use dofile_once(), unless the standard dofile() behaviour is required.",
        "implementation": """
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
""",
    },
    "ComponentGetValueVector2": {"ret": "x:number, y:number"},
    "PhysicsAddJoint": {
        "comment": "Note: this function has a hidden 7th boolean parameter which does something and also can have as few as 3 arguments of unknown types.\nDoes not work with PhysicsBody2Component. Returns the id of the created joint."
    },
    # "GuiCreate": {"nodiscard": True},
    "EntityGetWithTag": {"ret": "entity_id: {int}"},
    "EntityGetInRadius": {"ret": "entity_id: {int}"},
    "EntityGetInRadiusWithTag": {"ret": "entity_id: {int}"},
    "GetGameEffectLoadTo": {"nodiscard": False},
    "StringToHerdId": {"nodiscard": True},
    "HerdIdToString": {"nodiscard": True},
    "PhysicsPosToGamePos": {"nodiscard": True},
    "GamePosToPhysicsPos": {"nodiscard": True},
    "PhysicsVecToGameVec": {"nodiscard": True},
    "GameVecToPhysicsVec": {"nodiscard": True},
    "EntityLoad": {"args": "filename:string, pos_x:integer = 0, pos_y:integer = 0"},
    "GameGetGameEffect": {"comment": "returns 0 on failure"},
    "GetValueBool": {"args": "key: string, default_value: bool"},
    "SetValueBool": {"args": "key: string, value: bool"},
    "EntityGetAllChildren": {
        "ret": "{entity_id}|nil",
        "comment": "If passed the optional 'tag' parameter, will return only child entities that have that tag (If 'tag' isn't a valid tag name, will return no entities). If no entities are found returns nil, but if entities are found but the tag doesn't match an empty table is returned.",
    },
    "DoesWorldExistAt": {
        "comment": "Returns true if the area inside the bounding box has been streamed in and no pixel scenes are loading in the area (pixel scenes may not be loaded)."
    },
    "GuiImage": {
        "comment": "'scale' will be used for 'scale_y' if 'scale_y' equals 0.\nDue to a bug the function will sometimes stop working unless alpha, scale, scale_y are passed. For this reason it is recommended to fill in the default parameters."
    },
    "PolymorphTableGet": {"args": "rare_table: bool = false "},
    "EntityAddComponent": {
        "comment": "Deprectated, use EntityAddComponent2() instead.",
        "deprecated": True,
    },
    "RegisterGunAction": {
        "args": "action_id:string, action_name:string, action_description:string, action_sprite_filename:string, action_unidentified_sprite_filename:string, action_type:number, action_spawn_level:string, action_spawn_probability:string, action_spawn_requires_flag:string, action_spawn_manual_unlock:boolean, action_max_uses:number, custom_xml_file:string, action_mana_drain:number, action_is_dangerous_blast:boolean, action_draw_many_count:number, action_ai_never_uses:boolean, action_never_unlimited:boolean, state_shuffled:boolean, state_cards_drawn:number, state_discarded_action:boolean, state_destroyed_action:boolean, fire_rate_wait:number, speed_multiplier:number, child_speed_multiplier:number, dampening:number, explosion_radius:number, spread_degrees:number, pattern_degrees:number, screenshake:number, recoil:number, damage_melee_add:number, damage_projectile_add:number, damage_electricity_add:number, damage_fire_add:number, damage_explosion_add:number, damage_ice_add:number, damage_slice_add:number, damage_healing_add:number, damage_curse_add:number, damage_drill_add:number, damage_null_all:number, damage_critical_chance:number, damage_critical_multiplier:number, explosion_damage_to_materials:number, knockback_force:number, reload_time:number, lightning_count:number, material:string, material_amount:number, trail_material:string, trail_material_amount:number, bounces:number, gravity:number, light:number, blood_count_multiplier:number, gore_particles:number, ragdoll_fx:number, friendly_fire:boolean, physics_impulse_coeff:number, lifetime_add:number, sprite:string, extra_entities:string, game_effect_entities:string, sound_loop_tag:string, projectile_file:string "
    },
    "ModMaterialFilesGet": {
        "comment": "Returns a list of filenames from which materials were loaded. Only works in OnModInit() and later"
    },
    "ModLuaFileSetAppends": {"args": "filename:string, appends: {string}"},
    "PhysicsBodyIDGetTransform": {
        "ret": "x: number, y: number, angle: number, vel_x: number, vel_y: number, angular_vel: number",
        "overload": {"ret": "nil"},
    },
    "GenomeSetHerdId": {
        "comment": "Deprecated, use StringToHerdID() and ComponentSetValue2() instead."
    },
    "PhysicsApplyForceOnArea": {
        "comment": "Applies a force calculated by 'calculate_force_for_body_fn' to all bodies in an area.",
        "args": "calculate_force_for_body_fn: calculate_force_for_body_fn_type, ignore_this_entity:int, area_min_x:number, area_min_y:number,area_max_x:number, area_max_y:number",
    },
    "PolymorphTableSet": {
        "args": "table_of_xml_entities: {string}, rare_table: bool = false"
    },
    "GameGetDateAndTimeLocal": {
        "ret": "year: integer, month: integer, day: integer, hour: integer, minute: integer, second: integer, jussi: bool, mammi: bool"
    },
    "EntityGetHerdRelation": {
        "comment": "Deprecated, use EntityGetHerdRelationSafe() instead.",
        "deprecated": True,
    },
    "GameIsIntroPlaying": {"nodiscard": True},
    "GameIsInventoryOpen": {"nodiscard": True},
    "IsPlayer": {"nodiscard": True},
    "IsInvisible": {"nodiscard": True},
    "GameIsDailyRunOrDailyPracticeRun": {"nodiscard": True},
    "GameIsModeFullyDeterministic": {"nodiscard": True},
    "GameIsBetaBuild": {"nodiscard": True},
    "ModIsEnabled": {"nodiscard": True},
}


tree = BeautifulSoup(html, features="html.parser")
table = tree.find("table")
for k, e in enumerate(table.children):
    if k % 2:
        continue
    parts = [x for x in e.children]
    # print(parts)
    example = parts[1]
    ret = parts[3].text
    comment = "\n".join(parts[5].strings)
    example_parts = [x for x in example.children]
    fn_name = example_parts[0].text
    if "Input" in fn_name and fn_name != "GuiTextInput":
        # hax hax hax
        d = ret.split("(")
        ret = d[0]
        comment = "".join("".join(d[1:]).split(")")[:-1])
    ret = ret.replace(" ", "")
    # print(fn_name)
    # print(comment)
    fn_args = example_parts[2].text
    overloaded = False
    custom_data = ""
    overloaded_args = ""
    overloaded_ret = ""
    deprecated = "deprecated" in comment.lower()
    fn_impl = " "
    nodiscard = (
        "Get" in fn_name
        or "Find" in fn_name
        or "Raytrace" in fn_name
        or "Input" in fn_name
        or "Has" in fn_name
    )
    if fn_name in overrides.keys():
        override = overrides[fn_name]
        if "ret" in override.keys():
            ret = override["ret"]
        if "args" in override.keys():
            fn_args = override["args"]
        if "comment" in override.keys():
            comment = override["comment"]
        if "deprecated" in override.keys():
            deprecated = override["deprecated"]
        if "overload" in override.keys():
            overloaded = True
            overload = override["overload"]
            overloaded_ret = overload["ret"]
            if "args" in overload.keys():
                overloaded_args = overload["args"]
        if "custom" in override.keys():
            custom_data += ("\n" if custom_data != "" else "") + override["custom"]
        if "nodiscard" in override.keys():
            nodiscard = override["nodiscard"]
        if "implementation" in override.keys():
            fn_impl = override["implementation"]
    if ret[-5:] == ")|nil":
        # special case where multiple thing are nil
        ret = ret[1:-5]
        overloaded = True
        overloaded_ret = "nil"
    fn_args = fn_args.replace("value_or_values", "...")
    fn_args = fn_args.replace(" ", "").split(",")
    fn_def = ""
    fn_args2 = []
    if fn_args[0] == "":
        fn_args = []
    for arg in fn_args:
        # print(arg)
        typed = arg.split(":")
        if len(typed) != 2:
            # print(fn_args)
            continue
        arg_name = typed[0]
        arg_type = typed[1]
        # print(arg_type)
        arg_default = arg_type.split("=")
        extra = ""
        if len(arg_default) == 2:
            extra = arg_default[1]
            arg_type = arg_default[0]
        if extra != "" and extra[0] == '"':
            extra = "'" + extra + "'"
        arg_type = type_alias(arg_type, arg_name)
        fn_args2.append((arg_name, arg_type + ("?" if extra != "" else ""), extra))
    rets = ret.split(",")
    rets2 = []
    if rets[0] == "":
        rets = []
    for e in rets:
        typed = e.split(":")
        # print(typed)
        if len(typed) != 2:
            # print(fn_args)
            rets2.append((type_alias(typed[0], ""),))
            continue
        ret_name = typed[0]
        ret_type = typed[1]
        # print(arg_type)
        ret_type = type_alias(ret_type, ret_name)
        rets2.append((ret_type, ret_name))

    # print(fn_name, rets2, [x for x in rets2])
    if comment != "":
        fn_def += "---"
        fn_def += re.sub(
            r",([^ ])",
            r", \1",
            re.sub(
                r"'([a-zA-Z0-9_]+)'",
                r"`\1`",
                re.sub(
                    r"([A-Za-z0-9_]+)(\(\))", r"`\1`\2", comment.replace("\n", "\n---")
                ),
            ),
        )
    fn_def += "\n" + "\n".join(["---@param " + " ".join(x) for x in fn_args2])
    fn_def += "\n" + "\n".join(["---@return " + " ".join(x) for x in rets2])
    fn_def += "\n---@deprecated" if deprecated else ""

    fn_sig = "(" + ", ".join([x[0] for x in fn_args2]) + ")"
    fn_sig_overload = (
        "(" + ", ".join([x[0] + ": " + x[1] for x in fn_args2]) + ")"
        if overloaded_args == ""
        else overloaded_args
    )

    if overloaded:
        fn_def += "\n---@overload fun" + fn_sig_overload + ": " + overloaded_ret
    if nodiscard:
        fn_def += "\n---@nodiscard"

    fn_def += custom_data

    fn_def += "\nfunction " + fn_name + fn_sig + fn_impl + "end"
    fn_def = fn_def.replace("  ", " ")
    while "\n\n" in fn_def:
        fn_def = fn_def.replace("\n\n", "\n")
    out += fn_def + "\n\n"
    # print(fn_name, fn_sig)

with open("out.lua", "w", encoding="utf-8") as f:
    f.write(out.replace("\n\n\n", "\n\n").replace(" \n", "\n"))
