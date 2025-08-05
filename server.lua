local blips = {}
local blipsCache = nil
local lastSaveTime = 0
local isLoaded = false

-- Parsear string vector3
local function ParseVector3(str)
    if type(str) ~= 'string' then return nil, nil, nil end
    local x, y, z = string.match(str, "vector3%(([^,]+),%s*([^,]+),%s*([^)]+)%)")
    return tonumber(x), tonumber(y), tonumber(z)
end

-- Crear marcador por defecto
local function CreateDefaultBlip()
    return {
        title = "Marcador por Defecto",
        vector3 = "vector3(-1144.100, 242.897, 65.140)",
        icon = 7,
        color = 13,
        areaVisible = false
    }
end

-- Validación para vector3
local function ValidateBlipData(data)
    if not data or type(data) ~= 'table' then return false end
    if not data.title or type(data.title) ~= 'string' or #data.title == 0 or #data.title > 50 then return false end
    if not data.vector3 or type(data.vector3) ~= 'string' then return false end
    local x, y, z = ParseVector3(data.vector3)
    if not x or not y or not z or x == 0 or y == 0 or z == 0 then return false end
    if type(data.icon) ~= 'number' or data.icon < 1 or data.icon > 170 or data.icon == 60 or data.icon == 61 or data.icon == 62 or data.icon == 63 or data.icon == 64 then return false end
    if type(data.color) ~= 'number' or data.color < 0 or data.color > 84 then return false end
    return true
end

-- Cargar blips 
local function LoadBlips()
    if isLoaded then return end
    local file = LoadResourceFile(GetCurrentResourceName(), 'blips_data.json')
    if file then
        local success, result = pcall(json.decode, file)
        if success and type(result) == 'table' then
            local validBlips = {}
            local invalidCount = 0
            for i = 1, #result do
                if ValidateBlipData(result[i]) then
                    validBlips[#validBlips + 1] = result[i]
                else
                    invalidCount = invalidCount + 1
                end
            end
            blips = validBlips
            if invalidCount > 0 then
                print('^3[Map Markers]^7 Cargados: ' .. #blips .. ' marcadores válidos, ' .. invalidCount .. ' ignorados')
            else
                print('^2[Map Markers]^7 Cargados: ' .. #blips .. ' marcadores')
            end
        else
            blips = {CreateDefaultBlip()}
            print('^2[Map Markers]^7 Archivo inválido, creado marcador por defecto')
        end
    else
        blips = {CreateDefaultBlip()}
        local defaultBlip = blips[1]
        local newCache = string.format(
            '[\n    {\n        "title": "%s",\n        "icon": %d,\n        "color": %d,\n        "vector3": "%s",\n        "areaVisible": %s\n    }\n]',
            defaultBlip.title, defaultBlip.icon, defaultBlip.color, defaultBlip.vector3, tostring(defaultBlip.areaVisible)
        )
        SaveResourceFile(GetCurrentResourceName(), 'blips_data.json', newCache, -1)
        blipsCache = newCache
        print('^2[Map Markers]^7 Archivo no encontrado, creado y guardado blips_data.json por defecto.')
    end
    isLoaded = true
end

-- Guardar blips (solo si hay cambios)
local function SaveBlips()
    local currentTime = GetGameTimer()
    if currentTime - lastSaveTime < 1000 then return end
    local newCache = json.encode(blips)
    if newCache ~= blipsCache then
        SaveResourceFile(GetCurrentResourceName(), 'blips_data.json', newCache, -1)
        blipsCache = newCache
    end
end

-- Sincronizar blips (optimizado para muchos jugadores)
local function SyncBlipsToAll()
    if #blips == 0 then return end
    TriggerClientEvent('map_markers:syncBlips', -1, blips)
end

-- Comando /marks optimizado con paginación y búsqueda
RegisterCommand('marks', function(source, args, rawCommand)
    if not IsPlayerAceAllowed(source, "command") then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"❌", "Sin permisos"}
        })
        return
    end
    local page = tonumber(args[1]) or 1
    local search = args[2] and string.lower(args[2])
    local pageSize = 10
    local totalPages = math.ceil(#blips / pageSize)
    if page < 1 then page = 1 end
    if page > totalPages then page = totalPages end
    local filteredBlips = {}
    if search then
        for i = 1, #blips do
            if string.find(string.lower(blips[i].title), search) then
                filteredBlips[#filteredBlips + 1] = blips[i]
            end
        end
    else
        filteredBlips = blips
    end
    local filteredPages = math.ceil(#filteredBlips / pageSize)
    if page > filteredPages then page = filteredPages end
    if page < 1 then page = 1 end
    local startIndex = (page - 1) * pageSize + 1
    local endIndex = math.min(startIndex + pageSize - 1, #filteredBlips)
    local message = "📌 Marcadores: " .. #filteredBlips .. " total"
    if search then
        message = message .. " (búsqueda: '" .. args[2] .. "')"
    end
    if filteredPages > 1 then
        message = message .. " | Página " .. page .. "/" .. filteredPages
    end
    TriggerClientEvent('chat:addMessage', source, {
        color = {0, 255, 0},
        args = {"📌", message}
    })
    if #filteredBlips > 0 then
        print('^2[Map Markers]^7 === PÁGINA ' .. page .. '/' .. filteredPages .. ' ===')
        for i = startIndex, endIndex do
            local blip = filteredBlips[i]
            local x, y, z = ParseVector3(blip.vector3)
            print('^2[Map Markers]^7 ' .. i .. '. "' .. blip.title .. '" (' .. math.floor(x or 0) .. ', ' .. math.floor(y or 0) .. ', ' .. math.floor(z or 0) .. ')')
        end
        print('^2[Map Markers]^7 =========================')
    else
        print('^3[Map Markers]^7 No se encontraron marcadores')
    end
    if filteredPages > 1 then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 255, 0},
            args = {"💡", "Uso: /marks [página] [búsqueda] | Ej: /marks 2 gasolinera"}
        })
    end
end, false)

RegisterNetEvent('map_markers:requestBlips')
AddEventHandler('map_markers:requestBlips', function()
    if #blips > 0 then
        TriggerClientEvent('map_markers:syncBlips', source, blips)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        blips = {}
        blipsCache = nil
        isLoaded = false
    end
end)

LoadBlips()
