zsLib = { }
zsLib.debugging = false

zsLib.settingsFile = "config://zsLib/settings.json"
zsLib.initialized = false
zsLib.settings = { }

function zsLib.init(modName, build)
    zsLib.modName = modName
    zsLib.build   = build

    zsLib.msgPrefix = "[" .. zsLib.modName .. "]"

    zsLib.settingsFile = "config://" .. zsLib.modName .. "/settings.json"
    
    zsLib.settings = zsLib.loadSettingsFile(zsLib.settingsFile)
    
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

function zsLib.initError()
    zsLib.build   = "0001"
    zsLib.modName = "zsLib"
    zsLib.msgPrefix = "[" .. zsLib.modName .. "]"
    zsLib.error("Not initialized! Call the zsLib.init() method first!")
end

function zsLib.version()
    if not zsLib.initialized then 
        zsLib.initError()
        return
    end

    zsLib.debug("debugging enabled")
    zsLib.message("initialized (build " .. zsLib.build .. ")")
end

function zsLib.getSetting(key, defaultValue)
    if not zsLib.initialized then
        zsLib.initError()
    end
    
    local value = zsLib.settings[key]
    if value then 
        return value
    end
    
    return defaultValue
end

function zsLib.setSetting(key, value) 
    if not zsLib.initialized then
        zsLib.initError()
    end
    
    local oldValue = zsLib.getSetting(key)
    
    zsLib.settings[key] = value
    zsLib.saveSettingsFile(zsLib.settingsFile, zsLib.settings)
    
    return oldValue
end

function zsLib.loadSettingsFile(settingsFile)
    zsLib.debug("tryting to load settings from '" .. settingsFile .. "'")

    if GetFileExists(settingsFile) then
        zsLib.debug("settings file was found")
        
        local openedFile = io.open(settingsFile, "r")
        if openedFile then
            zsLib.debug("reading from settings file...")
            local fileContent = openedFile:read("*all")
            io.close(openedFile)

            zsLib.debug("file content: " .. fileContent)

            zsLib.debug("parsing settings file...")
            local parsedFile = json.decode(fileContent)

            if not parsedFile then
                zsLib.error("parsing settings file failed")
            end
            
            zsLib.debug("done loading.")
            return parsedFile or {}
        end
    else
        zsLib.message("no settings file found")
    end
    return {}
end

function zsLib.saveSettingsFile(settingsFile, settings)
    zsLib.debug("saving settings to '" .. settingsFile .. "'")

    local openedFile = io.open(settingsFile, "w+")
    if openedFile then
        local parsedContent = json.encode(settings, { indent = true })
        if parsedContent then
            zsLib.debug("writing content: " .. parsedContent)
            openedFile:write(parsedContent)
            io.close(openedFile)
            zsLib.debug("done writing.")
        else
            zsLib.error("could not parse settings " .. settings)
        end
    else
        zsLib.error("Could not open " .. settingsFile .. "for writing.")
    end
end