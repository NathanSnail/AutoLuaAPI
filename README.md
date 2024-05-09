# What is this?
This is an alternative API definition file for Noita's modding API which aims to provide beta function support and full type safety.
# How to install
Install Evaisa's Noita API for Visual Studio Code, go to definition of any function, then replace the definition source file with this.
Alternatively for a standalone install you can just add this to your mod and include it via your method of choice, if you have NathanSnail's Noita File Autocomplete you can use
```
--dofile("mods/MODID/api_def.lua")  
```
otherwise you should add it to your Lua library path.

# Why is entity_id not integer?
I think that seperating these types makes sure that code is more correct, as most integer operations on them do not make sense.
If you would prefer for them to behave like integers edit the definition file to uncomment the integer definitions, and comment the class definitions.
