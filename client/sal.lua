
local sal_actor

AddEvent("OnPackageStart", function()
    local loaded = LoadPak("SaveAndLoad", "/SaveAndLoad/", "../../../OnsetModding/Plugins/SaveAndLoad/Content")
    if not loaded then
        print("[SaveAndLoad] : pak loading failed")
    else
        print("[SaveAndLoad] : pak loaded")
        sal_actor = GetWorld():SpawnActor(UClass.LoadFromAsset("/SaveAndLoad/SaveAndLoad_Bridge"), FVector(0, 0, 0), FRotator(0, 0, 0))
    end
end)

function StoreIntValue(key, value)
    if (key and value) then
        if (type(key) == "string" and type(value) == "number") then
            if math.type(value) == "integer" then
                sal_actor:ProcessEvent("StoreIntValue", key, value)
                return true
            end
        end
    end
    return false
end
AddFunctionExport("StoreIntValue", StoreIntValue)

function GetIntValue(key)
    if key then
        if type(key) == "string" then
            local value, success = sal_actor:ProcessEvent("GetIntValue", key)
            if success then
                return value
            end
        end
    end
    return false
end
AddFunctionExport("GetIntValue", GetIntValue)

function StoreStringValue(key, value)
    if (key and value) then
        if (type(key) == "string" and type(value) == "string") then
            sal_actor:ProcessEvent("StoreStringValue", key, value)
            return true
        end
    end
    return false
end
AddFunctionExport("StoreStringValue", StoreStringValue)

function GetStringValue(key)
    if key then
        if type(key) == "string" then
            local value, success = sal_actor:ProcessEvent("GetStringValue", key)
            if success then
                return value
            end
        end
    end
    return false
end
AddFunctionExport("GetStringValue", GetStringValue)

function StoreFloatValue(key, value)
    if (key and value) then
        if (type(key) == "string" and type(value) == "number") then
            if math.type(value) == "float" then
                sal_actor:ProcessEvent("StoreFloatValue", key, value)
                return true
            end
        end
    end
    return false
end
AddFunctionExport("StoreFloatValue", StoreFloatValue)

function GetFloatValue(key)
    if key then
        if type(key) == "string" then
            local value, success = sal_actor:ProcessEvent("GetFloatValue", key)
            if success then
                return value
            end
        end
    end
    return false
end
AddFunctionExport("GetFloatValue", GetFloatValue)

function StoreBoolValue(key, value)
    if (key and value ~= nil) then
        if (type(key) == "string" and type(value) == "boolean") then
            sal_actor:ProcessEvent("StoreBoolValue", key, value)
            return true
        end
    end
    return false
end
AddFunctionExport("StoreBoolValue", StoreBoolValue)

function GetBoolValue(key)
    if key then
        if type(key) == "string" then
            local value, success = sal_actor:ProcessEvent("GetBoolValue", key)
            if success then
                return value
            end
        end
    end
    return nil
end
AddFunctionExport("GetBoolValue", GetBoolValue)