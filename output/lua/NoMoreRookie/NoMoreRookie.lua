Script.Load("lua/NoMoreRookie/zsLib.lua")

local modName = "NoMoreRookie"
local build   = "b0001"

zsLib.init(modName, build)
zsLib.version()

function setRookieLevel(newRookieLevel) 
    zsLib.message("setting rookie level to " .. newRookieLevel)
    kRookieLevel = newRookieLevel
end
