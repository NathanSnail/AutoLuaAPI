# What is this?
This is an alternative API definition file for Noita's modding API which aims to provide beta function support and full type safety.
# How to install
Add out.lua to your Lua library path. 

In VSCode open the `sumneko.lua` extension settings and edit `Workspace: Library` to contain the path to the definitions.

In NVim
```lua
local servers = {
	lua_ls = {
		-- cmd = {...},
		-- filetypes { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					ignoreSubmodules = false,
					checkThirdParty = false,
					library = {
						"~/Documents/code/AutoLuaAPI/out.lua",
					},
				},
				completion = {
					callSnippet = "Replace",
					autoRequire = true,
				},
			},
		},
	},
}
for k, v in pairs(servers) do
	vim.lsp.config[k] = v
end
```

# Why is entity_id not integer?
I think that seperating these types makes sure that code is more correct, as most integer operations on them do not make sense.
If you would prefer for them to behave like integers edit the definition file to uncomment the integer definitions, and comment the class definitions.
