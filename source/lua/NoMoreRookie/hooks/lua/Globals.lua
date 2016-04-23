local hookTarget = "Globals"
zsLib.debug("hooking into " .. hookTarget .. "...")

-- force non-rookie mode
local newRookieLevel = 0

-- force rookie mode
--local newRookieLevel = 300

setRookieLevel(newRookieLevel)

zsLib.debug("done hooking into " .. hookTarget .. ".")
