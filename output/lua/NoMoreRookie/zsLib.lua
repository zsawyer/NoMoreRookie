zsLib = { }
zsLib.debugging = false


zsLib.initialized = false

function zsLib.init(modName, build)
    zsLib.modName = modName
    zsLib.build   = build

    zsLib.msgPrefix = "[" .. zsLib.modName .. "]"
    
    zsLib.initialized = true
end

function zsLib.message(message, tag)
    if not tag then 
        tag = ""
    end
    Shared.Message(zsLib.msgPrefix .. tag .. " " .. message)
end

function zsLib.debug(message)
    if zsLib.debugging then
        zsLib.message(message, "[DEBUG]")
    end
end

function zsLib.warning(message)
    zsLib.message(message, "[WARNING]")
end

function zsLib.error(message)
    zsLib.message(message, "[ERROR]")
end

function zsLib.version()
    if not zsLib.initialized then 
        zsLib.build   = "0001"
        zsLib.modName = "zsLib"
        zsLib.msgPrefix = "[" .. zsLib.modName .. "]"
        zsLib.error("Not initialized! Call the zsLib.init() method first!")
        return
    end

    zsLib.debug("debugging enabled")
    zsLib.message("initialized (build " .. zsLib.build .. ")")
end
