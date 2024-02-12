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
	if maybe_entity(name):
		return src.replace("integer", "entity_id")
	return src


def type_alias(src, name):
	if "{" in src:
		if "-" in src:
			src = src.replace("-", ":")
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
	if src[-1] in ".-":
		src = src[:-1]
	return src


base_path = "D:/Steam/steamapps/common/Noita/" if TESTING else input(
	"modding api folder path: ") + "/"
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

component_type = "---@alias component_type " + \
	" | ".join([f'"{x}"' for x in components])

out = f"""
---@meta

---@class entity_id 
---@class component_id 
---@class unsigned_integer 
---@class physics_body_id 
---@class gui 

{component_type}
---@alias damage_type "NONE" | "DAMAGE_MELEE" | "DAMAGE_PROJECTILE" | "DAMAGE_EXPLOSION" | "DAMAGE_BITE" | "DAMAGE_FIRE" | "DAMAGE_MATERIAL" | "DAMAGE_FALL" | "DAMAGE_ELECTRICITY" | "DAMAGE_DROWNING" | "DAMAGE_PHYSICS_BODY_DAMAGED" | "DAMAGE_DRILL" | "DAMAGE_SLICE" | "DAMAGE_ICE" | "DAMAGE_HEALING" | "DAMAGE_PHYSICS_HIT" | "DAMAGE_RADIOACTIVE" | "DAMAGE_POISON" | "DAMAGE_MATERIAL_WITH_FLASH" | "DAMAGE_OVEREATING" | "DAMAGE_CURSE" | "DAMAGE_HOLY"
---@alias game_effect "NONE" | "ELECTROCUTION" | "FROZEN" | "ON_FIRE" | "POISON" | "BERSERK" | "CHARM" | "POLYMORPH" | "POLYMORPH_RANDOM" | "BLINDNESS" | "TELEPATHY" | "TELEPORTATION" | "REGENERATION" | "LEVITATION" | "MOVEMENT_SLOWER" | "FARTS" | "DRUNK" | "BREATH_UNDERWATER" | "RADIOACTIVE" | "WET" | "OILED" | "BLOODY" | "SLIMY" | "CRITICAL_HIT_BOOST" | "CONFUSION" | "MELEE_COUNTER" | "WORM_ATTRACTOR" | "WORM_DETRACTOR" | "FOOD_POISONING" | "FRIEND_THUNDERMAGE" | "FRIEND_FIREMAGE" | "INTERNAL_FIRE" | "INTERNAL_ICE" | "JARATE" | "KNOCKBACK" | "KNOCKBACK_IMMUNITY" | "MOVEMENT_SLOWER_2X" | "MOVEMENT_FASTER" | "STAINS_DROP_FASTER" | "SAVING_GRACE" | "DAMAGE_MULTIPLIER" | "HEALING_BLOOD" | "RESPAWN" | "PROTECTION_FIRE" | "PROTECTION_RADIOACTIVITY" | "PROTECTION_EXPLOSION" | "PROTECTION_MELEE" | "PROTECTION_ELECTRICITY" | "TELEPORTITIS" | "STAINLESS_ARMOUR" | "GLOBAL_GORE" | "EDIT_WANDS_EVERYWHERE" | "EXPLODING_CORPSE_SHOTS" | "EXPLODING_CORPSE" | "EXTRA_MONEY" | "EXTRA_MONEY_TRICK_KILL" | "HOVER_BOOST" | "PROJECTILE_HOMING" | "ABILITY_ACTIONS_MATERIALIZED" | "NO_DAMAGE_FLASH" | "NO_SLIME_SLOWDOWN" | "MOVEMENT_FASTER_2X" | "NO_WAND_EDITING" | "LOW_HP_DAMAGE_BOOST" | "FASTER_LEVITATION" | "STUN_PROTECTION_ELECTRICITY" | "STUN_PROTECTION_FREEZE" | "IRON_STOMACH" | "PROTECTION_ALL" | "INVISIBILITY" | "REMOVE_FOG_OF_WAR" | "MANA_REGENERATION" | "PROTECTION_DURING_TELEPORT" | "PROTECTION_POLYMORPH" | "PROTECTION_FREEZE" | "FROZEN_SPEED_UP" | "UNSTABLE_TELEPORTATION" | "POLYMORPH_UNSTABLE" | "CUSTOM" | "ALLERGY_RADIOACTIVE" | "RAINBOW_FARTS" 
"""

overrides = {
    "GetParallelWorldPosition": {"ret": "x:number,y:number"},
    "InputGetJoystickAnalogStick": {"ret": "x:number,y:number"},
    "BiomeMapGetName": {"ret": "name:string"},
    "AddFlagPersistent": {"ret": "is_new:boolean"},
    "GuiTextInput": {"ret": "new_text:string"},
    "ComponentGetVector": {"ret": "{int}|{number}|{string}|nil"},
    "AddMaterialInventoryMaterial": {"comment": "This function actually sets the amount in the inventory rather than adding."},
    "EntityAddComponent2": {"args": "entity_id:int, component_type_name: string, table_of_component_values:{string-multiple_types} = nil"},
    "GlobalsGetValue": {"ret": "global:any|nil"},
    "EntityGetAllComponents": {"ret": "components:{int}|nil"},
    "LoadPixelScene": {"args": "materials_filename:string, colors_filename:string, x:number, y:number, background_file:string = \"\", skip_biome_checks:bool = false, skip_edge_textures:bool = false, color_to_material_table:{string-string} = {}, background_z_index:int = 50, load_even_if_duplicate:bool = false "},
    "GuiButton": {"overload": {"args": "(gui: gui, x: number, y: number, text: string, id: integer)", "ret": "nil"}},
    "dofile": {"ret": "script_return_type:any", "overload": {"ret": "(nil, error_string: string)"}},
    "dofile_once": {"ret": "script_return_type:any", "overload": {"ret": "(nil, error_string: string)"}},
    "ComponentGetValueVector2": {"ret": "x:number, y:number"},
    "PhysicsAddJoint": {"comment": "Note: this function has a hidden 7th boolean parameter which does something and also can have as few as 3 arguments of unknown types.\nDoes not work with PhysicsBody2Component. Returns the id of the created joint."},
    "GuiCreate": {"nodiscard": True},
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
}


tree = BeautifulSoup(html, features="html.parser")
table = tree.find("table")
for k, e in enumerate(table.children):
	if k % 2:
		continue
	parts = [x for x in e.children]
	# print(parts)
	example = parts[1]
	ret = parts[3].text.replace(" ", "")
	comment = "\n".join(parts[5].strings)
	example_parts = [x for x in example.children]
	fn_name = example_parts[0].text
	# print(fn_name)
	# print(comment)
	fn_args = example_parts[2].text
	if "Input" in fn_name:
		# hax hax hax
		ret = ret.split("(")[0]
	overloaded = False
	custom_data = ""
	deprecated = "deprecated" in comment.lower()
	overloaded_args = ""
	overloaded_ret = ""
	nodiscard = "Get" in fn_name or "Find" in fn_name or "Raytrace" in fn_name or "Input" in fn_name or "Has" in fn_name
	if fn_name in overrides.keys():
		override = overrides[fn_name]
		if "ret" in override.keys():
			ret = override["ret"]
		if "args" in override.keys():
			fn_args = override["args"]
		if "comment" in override.keys():
			comment = override["comment"]
		if "deprecated" in override.keys():
			deprecated = override[deprecated]
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
		fn_def += "--- "
		fn_def += comment.replace("\n", "\n-- ")
	fn_def += "\n" + "\n".join(["---@param " + " ".join(x) for x in fn_args2])
	fn_def += "\n" + "\n".join(["---@return " + " ".join(x) for x in rets2])
	fn_def += "\n---@deprecated" if deprecated else ""

	fn_sig = "(" + ", ".join([x[0] for x in fn_args2]) + ")"
	fn_sig_overload = "(" + ", ".join([x[0] + ": " + x[1]
                                    for x in fn_args2]) + ")" if overloaded_args == "" else overloaded_args

	if overloaded:
		fn_def += "\n---@overload fun" + fn_sig_overload + ": " + overloaded_ret
	if nodiscard:
		fn_def += "\n---@nodiscard"

	fn_def += custom_data

	fn_def += "\nfunction " + fn_name + fn_sig + " end"
	while "\n\n" in fn_def:
		fn_def = fn_def.replace("\n\n", "\n")
	out += fn_def + "\n\n"

with open("out.lua", "w", encoding="utf-8") as f:
	f.write(out.replace("\n\n\n", "\n\n"))
