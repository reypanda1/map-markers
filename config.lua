-- =============================================
-- MAP MARKERS - CONFIGURACIÓN COMPLETA
-- =============================================

Config = {}

-- =============================================
-- CONFIGURACIÓN GENERAL
-- =============================================

-- Habilitar mensajes de debug en consola
Config.Debug = false

-- Mensaje de bienvenida del autor
Config.ShowAuthorMessage = true

-- =============================================
-- CONFIGURACIÓN DE RENDIMIENTO
-- =============================================

-- Tiempo mínimo entre refrescos de blips (ms)
Config.RefreshCooldown = 100

-- Tiempo mínimo entre guardados (ms)
Config.SaveCooldown = 1000

-- Delay inicial antes de cargar blips (ms)
Config.InitialDelay = 1000

-- Delay adicional en el cliente (ms)
Config.ClientDelay = 500

-- Tamaño de lote para crear blips (para evitar lag)
Config.BlipBatchSize = 20

-- Delay entre lotes de blips (ms)
Config.BlipBatchDelay = 1

-- =============================================
-- CONFIGURACIÓN DE BLIPS
-- =============================================

-- Configuración visual de los blips
Config.BlipSettings = {
    -- Escala de los blips (0.1 - 2.0)
    scale = 0.8,
    
    -- Transparencia de los blips (0 - 255)
    alpha = 200,
    
    -- Mostrar solo en rango corto
    shortRange = true,
    
    -- Modo de visualización (1-10, recomendado: 4)
    display = 4
}

-- Configuración de las áreas de radio
Config.AreaSettings = {
    -- Radio por defecto de las áreas (unidades del juego)
    defaultRadius = 100.0,
    
    -- Transparencia de las áreas (0 - 255)
    alpha = 100,
    
    -- Mostrar áreas solo en rango corto
    shortRange = true
}

-- =============================================
-- CONFIGURACIÓN DE VALIDACIÓN
-- =============================================

-- Rangos válidos para iconos de blips
Config.IconValidation = {
    -- Rango mínimo y máximo de iconos
    min = 1,
    max = 170,
    
    -- Iconos excluidos (problemáticos o reservados)
    excluded = {60, 61, 62, 63, 64}
}

-- Rangos válidos para colores de blips
Config.ColorValidation = {
    -- Rango mínimo y máximo de colores
    min = 0,
    max = 84
}

-- Validación de títulos
Config.TitleValidation = {
    -- Longitud mínima del título
    minLength = 1,
    
    -- Longitud máxima del título
    maxLength = 50
}

-- Validación de coordenadas
Config.CoordinateValidation = {
    -- No permitir coordenadas en cero
    allowZero = false,
    
    -- Rango válido para coordenadas X
    xRange = {min = -4000, max = 4000},
    
    -- Rango válido para coordenadas Y
    yRange = {min = -4000, max = 4000},
    
    -- Rango válido para coordenadas Z
    zRange = {min = -500, max = 2000}
}

-- =============================================
-- CONFIGURACIÓN DEL COMANDO /MARKS
-- =============================================

-- Configuración del comando de listado
Config.Command = {
    -- Nombre del comando
    name = "marks",
    
    -- Marcadores por página
    pageSize = 10,
    
    -- Permiso requerido (usar "command" para admin estándar)
    permission = "command",
    
    -- Mostrar coordenadas en formato redondeado
    roundCoordinates = true
}

-- Mensajes del comando
Config.CommandMessages = {
    -- Mensaje de sin permisos
    noPermission = "❌ Sin permisos para usar este comando",
    
    -- Mensaje cuando no hay marcadores
    noMarkers = "📌 No hay marcadores configurados",
    
    -- Mensaje cuando no se encuentran resultados de búsqueda
    noSearchResults = "🔍 No se encontraron marcadores con esa búsqueda",
    
    -- Formato del mensaje principal
    mainMessage = "📌 Marcadores: %d total",
    
    -- Formato con búsqueda
    searchMessage = "📌 Marcadores: %d total (búsqueda: '%s')",
    
    -- Formato con paginación
    pageMessage = " | Página %d/%d",
    
    -- Mensaje de ayuda
    helpMessage = "💡 Uso: /marks [página] [búsqueda] | Ej: /marks 2 gasolinera"
}

-- =============================================
-- CONFIGURACIÓN DEL MARCADOR POR DEFECTO
-- =============================================

-- Marcador que se crea automáticamente si no existe el archivo
Config.DefaultBlip = {
    title = "Marcador por Defecto",
    vector3 = "vector3(-1144.100, 242.897, 65.140)",
    icon = 7,
    color = 13,
    areaVisible = false
}

-- =============================================
-- CONFIGURACIÓN DE ARCHIVOS
-- =============================================

-- Configuración de archivos
Config.Files = {
    -- Nombre del archivo de datos
    dataFile = "blips_data.json",
    
    -- Formato JSON con indentación bonita
    prettyJson = true,
    
    -- Crear backup automático al guardar
    createBackup = false,
    
    -- Nombre del archivo de backup
    backupFile = "blips_data_backup.json"
}

-- =============================================
-- CONFIGURACIÓN DE MENSAJES DE CONSOLA
-- =============================================

-- Configuración de logging
Config.Logging = {
    -- Mostrar estadísticas de carga
    showLoadStats = true,
    
    -- Mostrar marcadores inválidos ignorados
    showInvalidMarkers = true,
    
    -- Mostrar resumen de validación detallado
    showValidationSummary = true,
    
    -- Mostrar mensajes de guardado
    showSaveMessages = false,
    
    -- Mostrar mensajes de sincronización
    showSyncMessages = false
}

-- Mensajes de consola personalizables
Config.ConsoleMessages = {
    -- Mensaje de bienvenida
    welcome = {
        "^2[Rey_Panda]^7 Gracias por usar mi script!",
        "^2[Rey_Panda]^7 Thanks for using my script!"
    },
    
    -- Mensajes de carga
    loading = {
        success = "^2[Map Markers]^7 Cargados: %d marcadores",
        withInvalid = "^3[Map Markers]^7 Cargados: %d marcadores válidos, %d ignorados",
        invalidFile = "^3[Map Markers]^7 Archivo inválido, creado marcador por defecto",
        defaultCreated = "^2[Map Markers]^7 Archivo no encontrado, creado blips_data.json por defecto"
    },
    
    -- Mensajes de validación
    validation = {
        header = "^3[Map Markers]^7 === RESUMEN DE VALIDACIÓN ===",
        footer = "^3[Map Markers]^7 ==============================",
        total = "^3[Map Markers]^7 Total de marcadores: %d",
        valid = "^2[Map Markers]^7 Marcadores válidos: %d",
        invalid = "^1[Map Markers]^7 Marcadores inválidos: %d"
    }
}

-- =============================================
-- CONFIGURACIÓN AVANZADA
-- =============================================

-- Configuración avanzada (no modificar a menos que sepas lo que haces)
Config.Advanced = {
    -- Usar caché para blips
    useCache = true,
    
    -- Validar datos al cargar
    validateOnLoad = true,
    
    -- Limpiar blips automáticamente al parar recurso
    autoCleanup = true,
    
    -- Sincronización automática con clientes
    autoSync = true
}

-- =============================================
-- FUNCIONES DE AYUDA PARA VALIDACIÓN
-- =============================================

-- Función para validar si un icono es válido
function Config.IsValidIcon(icon)
    if type(icon) ~= 'number' then return false end
    if icon < Config.IconValidation.min or icon > Config.IconValidation.max then return false end
    for i = 1, #Config.IconValidation.excluded do
        if icon == Config.IconValidation.excluded[i] then return false end
    end
    return true
end

-- Función para validar si un color es válido
function Config.IsValidColor(color)
    if type(color) ~= 'number' then return false end
    return color >= Config.ColorValidation.min and color <= Config.ColorValidation.max
end

-- Función para validar título
function Config.IsValidTitle(title)
    if type(title) ~= 'string' then return false end
    local len = #title
    return len >= Config.TitleValidation.minLength and len <= Config.TitleValidation.maxLength
end

-- Función para validar coordenadas
function Config.IsValidCoordinate(x, y, z)
    if type(x) ~= 'number' or type(y) ~= 'number' or type(z) ~= 'number' then return false end
    if not Config.CoordinateValidation.allowZero and (x == 0 or y == 0 or z == 0) then return false end
    
    local xRange = Config.CoordinateValidation.xRange
    local yRange = Config.CoordinateValidation.yRange
    local zRange = Config.CoordinateValidation.zRange
    
    if x < xRange.min or x > xRange.max then return false end
    if y < yRange.min or y > yRange.max then return false end
    if z < zRange.min or z > zRange.max then return false end
    
    return true
end

-- =============================================
-- INFORMACIÓN DE CONFIGURACIÓN
-- =============================================

--[[
GUÍA DE CONFIGURACIÓN:

1. RENDIMIENTO:
   - RefreshCooldown: Reduce para mayor responsividad, aumenta para mejor rendimiento
   - BlipBatchSize: Reduce si hay lag al cargar muchos blips
   - SaveCooldown: Tiempo mínimo entre guardados para evitar spam de escritura

2. BLIPS:
   - scale: 0.1 = muy pequeño, 2.0 = muy grande (recomendado: 0.6-1.0)
   - alpha: 0 = invisible, 255 = completamente opaco
   - display: 4 = estándar, 2 = solo en mapa grande

3. VALIDACIÓN:
   - Ajusta los rangos según tus necesidades
   - excluded: Lista de iconos que causan problemas

4. COMANDO:
   - pageSize: Cuántos marcadores mostrar por página
   - permission: "command" = admin estándar, personalizable

5. ARCHIVOS:
   - prettyJson: true = formato legible, false = compacto
   - createBackup: true = crear respaldo automático

CONSEJOS:
- Para servidores con muchos jugadores: aumenta RefreshCooldown y SaveCooldown
- Para mejor visual: ajusta scale y alpha según tu gusto
- Para debugging: activa Config.Debug y Config.Logging opciones
]]