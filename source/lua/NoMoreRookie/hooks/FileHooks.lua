Script.Load("lua/NoMoreRookie/NoMoreRookie.lua")

local allFilterHooked = ModLoader.SetupFileHook( "lua/Globals.lua", "lua/NoMoreRookie/hooks/lua/Globals.lua", "post" )

if not allFilterHooked then
    AllFilter.message("Failed to hook '" .. "lua/Globals.lua" .. "'")
end
