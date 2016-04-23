local hookTarget = "ServerTabs"
zsLib.debug("hooking into " .. hookTarget .. "...")

local originalInitialize = ServerTabs.Initialize
function ServerTabs:Initialize()
    zsLib.debug("hooked into ServerTabs.Initialize method")
    
    -- call the super method
    originalInitialize(self)
    
    NoMoreRookie.unlockServerBrowser()
end



zsLib.debug("done hooking into " .. hookTarget .. ".")
