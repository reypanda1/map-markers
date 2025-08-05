local blips = {}
local blipHandles = {}
local isInitialized = false
local lastRefreshTime = 0

-- Parsear string vector3
local function ParseVector3(str)
    if type(str) ~= 'string' then return nil, nil, nil end
    local x, y, z = string.match(str, "vector3%(([^,]+),%s*([^,]+),%s*([^)]+)%)")
    return tonumber(x), tonumber(y), tonumber(z)
end

-- Refresh blips
local function RefreshBlips()
    local currentTime = GetGameTimer()
    if currentTime - lastRefreshTime < 100 then return end
    for i = #blipHandles, 1, -1 do
        local handles = blipHandles[i]
        if handles.icon and DoesBlipExist(handles.icon) then 
            RemoveBlip(handles.icon) 
        end
        if handles.radius and DoesBlipExist(handles.radius) then 
            RemoveBlip(handles.radius) 
        end
    end
    blipHandles = {}
    if #blips == 0 then return end
    local batchSize = 20
    local currentBatch = 0
    Citizen.CreateThread(function()
        for i = 1, #blips do
            local info = blips[i]
            local x, y, z = ParseVector3(info.vector3)
            if x and y and z then
                local bIcon = AddBlipForCoord(x, y, z)
                if bIcon and bIcon ~= 0 then
                    SetBlipSprite(bIcon, info.icon or 1)
                    SetBlipColour(bIcon, info.color or 0)
                    SetBlipScale(bIcon, 0.8)
                    SetBlipAlpha(bIcon, 200)
                    SetBlipAsShortRange(bIcon, true)
                    SetBlipDisplay(bIcon, 4)
                    if info.title and #info.title > 0 then
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentString(info.title)
                        EndTextCommandSetBlipName(bIcon)
                    end
                    local handle = { icon = bIcon, radius = nil }
                    if info.areaVisible then
                        local bRadius = AddBlipForRadius(x, y, z, 100.0)
                        if bRadius and bRadius ~= 0 then
                            SetBlipColour(bRadius, info.color or 0)
                            SetBlipAlpha(bRadius, 100)
                            SetBlipAsShortRange(bRadius, true)
                            handle.radius = bRadius
                        end
                    end
                    blipHandles[#blipHandles + 1] = handle
                end
            end
            currentBatch = currentBatch + 1
            if currentBatch >= batchSize then
                currentBatch = 0
                Citizen.Wait(1)
            end
        end
        lastRefreshTime = GetGameTimer()
    end)
end

local function RequestBlips()
    if isInitialized then return end
    TriggerServerEvent('map_markers:requestBlips')
    isInitialized = true
end

RegisterNetEvent('map_markers:syncBlips')
AddEventHandler('map_markers:syncBlips', function(serverBlips)
    if not serverBlips or type(serverBlips) ~= 'table' then
        return
    end
    blips = serverBlips
    RefreshBlips()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        isInitialized = false
        Citizen.Wait(1000)
        RequestBlips()
    end
end)

AddEventHandler('onClientResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for i = #blipHandles, 1, -1 do
            local handles = blipHandles[i]
            if handles.icon and DoesBlipExist(handles.icon) then 
                RemoveBlip(handles.icon) 
            end
            if handles.radius and DoesBlipExist(handles.radius) then 
                RemoveBlip(handles.radius) 
            end
        end
        blipHandles = {}
        blips = {}
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    RequestBlips()
end)
