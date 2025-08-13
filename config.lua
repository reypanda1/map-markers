Config = {}


Config.DefaultBlip = {
    title = "Marcador por Defecto",
    x = -1144.100341796875,
    y = 242.8971405029297,
    z = 65.14013671875,
    icon = 7,
    color = 13,
    areaVisible = false
}

Config.Messages = {

    authorWelcome = {
        "^2[Rey_Panda]^7 Gracias por usar mi script!",
        "^2[Rey_Panda]^7 Thanks for using my script!"
    },
    

    loading = {
        success = "^2[Map Markers]^7 Cargados: %d marcadores",
        withInvalid = "^3[Map Markers]^7 Cargados: %d marcadores válidos, %d ignorados",
        invalidFile = "^2[Map Markers]^7 Archivo inválido, creado marcador por defecto",
        defaultCreated = "^2[Map Markers]^7 Archivo no encontrado, creado y guardado blips_data.json por defecto."
    }
}

-- Configuración del comando /marks
Config.Command = {

    name = "marks",
    

    pageSize = 10,
    
    -- Mensajes del comando
    messages = {
        noPermission = "❌ Sin permisos",
        markersFound = "📌 Marcadores: %d total",
        markersWithSearch = "📌 Marcadores: %d total (búsqueda: '%s')",
        pageInfo = " | Página %d/%d",
        helpText = "💡 Uso: /marks [página] [búsqueda] | Ej: /marks 2 gasolinera",
        noResults = "🔍 No se encontraron marcadores"
    }
}

-- Configuración de validación
Config.Validation = {

    titleMinLength = 1,
    titleMaxLength = 50,
    

    iconMin = 1,
    iconMax = 170,
    iconExcluded = {60, 61, 62, 63, 64}, 
    
    -- Colores: rango válido (línea 33)
    colorMin = 0,
    colorMax = 84,
    

    allowZeroCoordinates = false
}


Config.Files = {

    dataFileName = "blips_data.json"
}


Config.Performance = {

    refreshCooldown = 100, -- ms
    

    saveCooldown = 1000, -- ms
    

    blipBatchSize = 20,
    

    batchDelay = 1, -- ms
    

    initialDelay = 1000, -- ms

    
    clientDelay = 500 -- ms
}


Config.BlipAppearance = {

    scale = 0.8,
    

    alpha = 200,
    

    shortRange = true,

    
    display = 4,
    

    area = {

        defaultRadius = 100.0,
        

        alpha = 100,
        

        shortRange = true
    }
}

function Config.GetDefaultBlipForJSON()
    local blip = Config.DefaultBlip
    return {
        title = blip.title,
        vector3 = string.format("vector3(%.3f, %.3f, %.3f)", blip.x, blip.y, blip.z),
        icon = blip.icon,
        color = blip.color,
        areaVisible = blip.areaVisible
    }
end

-- Función para validar si un icono está en el rango permitido
function Config.IsValidIcon(icon)
    if type(icon) ~= 'number' then return false end
    if icon < Config.Validation.iconMin or icon > Config.Validation.iconMax then return false end
    
    for i = 1, #Config.Validation.iconExcluded do
        if icon == Config.Validation.iconExcluded[i] then return false end
    end
    
    return true
end

-- Función para validar si un color está en el rango permitido  
function Config.IsValidColor(color)
    if type(color) ~= 'number' then return false end
    return color >= Config.Validation.colorMin and color <= Config.Validation.colorMax

end
