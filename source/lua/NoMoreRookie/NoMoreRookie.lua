Script.Load("lua/NoMoreRookie/zsLib.lua")

NoMoreRookie = { }
NoMoreRookie.modName = "NoMoreRookie"
NoMoreRookie.build   = "b0003"

local function init()  
    if not zsLib.initialized then
        zsLib.init(NoMoreRookie.modName, NoMoreRookie.build)
        zsLib.version()
    end
end

function setRookieLevel(newRookieLevel) 
    zsLib.message("setting rookie level to " .. newRookieLevel)
    kRookieLevel = newRookieLevel
end

function NoMoreRookie.unlockServerBrowser()
    local settingsKey = "browserUnlocked"

    local previouslyUnlocked = zsLib.getSetting(settingsKey, false)
    if not previouslyUnlocked then
        Client.SetOptionString("currentGameModeFilter", "ALL")
        zsLib.message("unlocked server browser")
        zsLib.setSetting(settingsKey, true)
    end
end

init()
