from bs4 import BeautifulSoup
DEBUG = True


def maybe_entity(name):
	return name.find("entity") != -1 or name.find("item") != -1 or name.find("parent") != -1 or name.find("child") != -1


def do_int(src, name):
	if "integer" not in src:
		src = src.replace("int", "integer")
	if src.find("uinteger32") != -1:
		return src.replace("uinteger32", "unsigned_integer")
	if src.find("uinteger") != -1:
		return src.replace("uinteger", "unsigned_integer")
	if name.find("component") != -1:
		return src.replace("integer", "component_id")
	if maybe_entity(name):
		return src.replace("integer", "entity_id")
	return src


def type_alias(src, name):
	if src.find("{") != -1:
		if src.find("-") != -1:
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
	if src.find("boolean") == -1:
		src = src.replace("bool", "boolean")
	if src.find("int") != -1:
		src = do_int(src, name)
	if src[-1] in ".-":
		src = src[:-1]
	return src


docpath = "D:/Steam/steamapps/common/Noita/lua_api_documentation.html" if DEBUG else input(
	"docpath: ")
with open(docpath, "r", encoding="utf-8") as f:
	html = f.read()

out = """
---@diagnostic disable: missing-return
---@diagnostic disable: unused-local 
---@diagnostic disable: lowercase-global

---@class entity_id 
---@class component_id 
---@class unsigned_integer 
---@class physics_body_id 
---@class gui 
"""

overloads = {"GetParallelWorldPosition": {"ret": "x:number,y:number"},
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
	if fn_name.find("Input") != -1:
		# hax hax hax
		ret = ret.split("(")[0]
	overloaded = False
	custom_data = ""
	deprecated = "deprecated" in comment.lower()
	overloaded_args = ""
	overloaded_ret = "" 
	if fn_name in overloads.keys():
		overload = overloads[fn_name]
		if "ret" in overload.keys():
			ret = overload["ret"]
		if "args" in overload.keys():
			fn_args = overload["args"]
		if "comment" in overload.keys():
			comment = overload["comment"]
		if "deprecated" in overload.keys():
			deprecated = overload[deprecated]
		if "overload" in overload.keys():
			overloaded = True
			extra_overload = overload["overload"]
			overloaded_ret = extra_overload["ret"]
			if "args" in extra_overload.keys():
				overloaded_args = extra_overload["args"]
			if "custom" in extra_overload.keys():
				overloaded = False
				custom_data += ("\n" if custom_data != "" else "") + extra_overload["custom"] 
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

	fn_def += custom_data

	fn_def += "\nfunction " + fn_name + fn_sig + " end"
	while fn_def.find("\n\n") != -1:
		fn_def = fn_def.replace("\n\n", "\n")
	out += fn_def + "\n\n"

with open("out.lua", "w", encoding="utf-8") as f:
	f.write(out.replace("\n\n\n", "\n\n"))
