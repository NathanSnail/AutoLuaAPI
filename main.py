from bs4 import BeautifulSoup
DEBUG = True


def do_int(src, name):
	if src.find("uint32") != -1:
		return src.replace("uint32", "unsigned_integer")
	if src.find("uint") != -1:
		return src.replace("uint", "unsigned_integer")
	if name.find("component") != -1:
		return "component_id"
	if name.find("entity") != -1:
		return "entity_id"
	if name.find("item") != -1:
		return src.replace("int", "item_entity_id")
	return src.replace("int", "integer")


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
	if src.find("boolean") == -1:
		src = src.replace("bool", "boolean")
	if src.find("int") != -1 and src.find("integer") == -1:
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

---@class entity_id 
---@class component_id 
---@class unsigned_integer 
---@class item_entity_id 
---@class physics_body_id 
---@class gui 
"""

overloads = {"GetParallelWorldPosition": {"ret": "x:number,y:number"},
             "InputGetJoystickAnalogStick": {"ret": "x:number,y:number"},
             "BiomeMapGetName": {"ret": "name:string"},
			 "AddFlagPersistent":{"ret":"is_new:boolean"},
             "GuiTextInput": {"ret": "new_text:string"},
             "ComponentGetVector": {"ret": "{int}|{number}|{string}|nil"},
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
	comment = parts[5].text
	example_parts = [x for x in example.children]
	fn_name = example_parts[0].text
	# print(fn_name)
	# print(comment)
	fn_args = example_parts[2].text
	if fn_name.find("Input") != -1:
		# hax hax hax
		ret = ret.split("(")[0]
	if fn_name in overloads.keys():
		overload = overloads[fn_name]
		if "ret" in overload.keys():
			ret = overload["ret"]
		if "param" in overload.keys():
			fn_args = overload["param"]
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
		fn_args2.append((arg_name, arg_type, extra))
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
	fn_def += "\nfunction " + fn_name + \
		"(" + ",".join([x[0] for x in fn_args2]) + ") end"
	while fn_def.find("\n\n") != -1:
		fn_def = fn_def.replace("\n\n", "\n")
	out += fn_def + "\n\n"

with open("out.lua", "w", encoding="utf-8") as f:
	f.write(out)
