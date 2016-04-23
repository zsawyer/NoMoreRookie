Script.Load("lua/NoMoreRookie/NoMoreRookie.lua")

local allFilterHooked = ModLoader.SetupFileHook( "lua/Globals.lua", "lua/NoMoreRookie/hooks/lua/Globals.lua", "post" )

if not allFilterHooked then
    AllFilter.message("Failed to hook '" .. "lua/Globals.lua" .. "'")
end


allFilterHooked = ModLoader.SetupFileHook( "lua/menu/ServerTabs.lua", "lua/NoMoreRookie/hooks/lua/menu/ServerTabs.lua", "post" )

if not allFilterHooked then
    AllFilter.message("Failed to hook '" .. "lua/menu/ServerTabs.lua" .. "'")
end
