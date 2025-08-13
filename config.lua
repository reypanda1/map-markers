-- =============================================
-- MAP MARKERS - CONFIGURACIÓN COMPATIBLE
-- =============================================
-- Este archivo es 100% compatible con client.lua y server.lua existentes
-- Solo incluye configuraciones que realmente se usan en el código actual

Config = {}

-- =============================================
-- CONFIGURACIÓN DEL MARCADOR POR DEFECTO
-- =============================================
-- ESTA ES LA ÚNICA CONFIGURACIÓN QUE SE USA ACTUALMENTE

Config.DefaultBlip = {
    title = "Marcador por Defecto",
    x = -1144.100341796875,
    y = 242.8971405029297,
    z = 65.14013671875,
    icon = 7,
    color = 13,
    areaVisible = false
}

-- =============================================
-- CONFIGURACIONES ADICIONALES COMPATIBLES
-- =============================================
-- Estas se pueden usar sin modificar client.lua y server.lua

-- Mensajes de consola personalizables (se usan en server.lua)
Config.Messages = {
    -- Mensajes del autor (líneas 8-9 en server.lua)
    authorWelcome = {
        "^2[Rey_Panda]^7 Gracias por usar mi script!",
        "^2[Rey_Panda]^7 Thanks for using my script!"
    },
    
    -- Mensajes de carga de marcadores (líneas 76-83 en server.lua)
    loading = {
        success = "^2[Map Markers]^7 Cargados: %d marcadores",
        withInvalid = "^3[Map Markers]^7 Cargados: %d marcadores válidos, %d ignorados",
        invalidFile = "^2[Map Markers]^7 Archivo inválido, creado marcador por defecto",
        defaultCreated = "^2[Map Markers]^7 Archivo no encontrado, creado y guardado blips_data.json por defecto."
    }
}

-- Configuración del comando /marks (se usa en server.lua líneas 97-147)
Config.Command = {
    -- Nombre del comando (línea 97)
    name = "marks",
    
    -- Marcadores por página (línea 105)
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

-- Configuración de validación (se usa en server.lua líneas 26-35)
Config.Validation = {
    -- Título: longitud mínima y máxima (línea 27)
    titleMinLength = 1,
    titleMaxLength = 50,
    
    -- Iconos: rango válido (línea 32)
    iconMin = 1,
    iconMax = 170,
    iconExcluded = {60, 61, 62, 63, 64}, -- línea 32
    
    -- Colores: rango válido (línea 33)
    colorMin = 0,
    colorMax = 84,
    
    -- Coordenadas: permitir cero o no (línea 30)
    allowZeroCoordinates = false
}

-- Configuración de archivos (se usa en server.lua)
Config.Files = {
    -- Nombre del archivo de datos (línea 40)
    dataFileName = "blips_data.json"
}

-- Configuración de rendimiento (valores hardcodeados en el código actual)
Config.Performance = {
    -- Cooldown mínimo entre refrescos en cliente (línea 9 client.lua)
    refreshCooldown = 100, -- ms
    
    -- Cooldown mínimo entre guardados en servidor (línea 88 server.lua)  
    saveCooldown = 1000, -- ms
    
    -- Tamaño de lote para crear blips (línea 23 client.lua)
    blipBatchSize = 20,
    
    -- Delay entre lotes (línea 55 client.lua)
    batchDelay = 1, -- ms
    
    -- Delay inicial antes de cargar (línea 95 client.lua)
    initialDelay = 1000, -- ms
    
    -- Delay adicional en cliente (línea 94 client.lua)
    clientDelay = 500 -- ms
}

-- Configuración visual de blips (valores hardcodeados en client.lua líneas 28-35)
Config.BlipAppearance = {
    -- Escala de los blips (línea 30)
    scale = 0.8,
    
    -- Transparencia de los blips (línea 31)  
    alpha = 200,
    
    -- Mostrar solo en rango corto (línea 32)
    shortRange = true,
    
    -- Modo de visualización (línea 33)
    display = 4,
    
    -- Configuración de áreas
    area = {
        -- Radio por defecto (línea 41)
        defaultRadius = 100.0,
        
        -- Transparencia de áreas (línea 44)
        alpha = 100,
        
        -- Rango corto para áreas (línea 45)
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