# Map Markers - Sistema de Marcadores

## Descripción
Sistema para gestionar marcadores dinámicos en el mapa de GTA V. Todo se maneja desde archivos JSON, eliminando la necesidad de menús en el juego.

## Características
- ✅ **Sin menús** - Todo se gestiona desde archivos
- ✅ **Archivo por defecto** - Se crea automáticamente con un marcador de ejemplo
- ✅ **Validación simple** - Sin cache innecesario, sin loops
- ✅ **Configuración mínima** - Solo lo esencial
- ✅ **Sincronización eficiente** - Solo cuando es necesario
- ✅ **Manejo de errores simple** - Ignora marcadores malos automáticamente
- ✅ **Comando /marks** - Listado instantáneo (solo admins)

## Instalación
1. Coloca el recurso en tu carpeta `resources/`
2. Añade `ensure map_markers` a tu `server.cfg`
3. Reinicia el servidor

## Uso

### Primera vez
Al iniciar el recurso por primera vez, se creará automáticamente el archivo `blips_data.json` con un marcador por defecto.

### Editar marcadores
Para añadir, editar o eliminar marcadores, simplemente modifica el archivo `blips_data.json`:

```json
[
    {
        "title": "Nombre del Marcador",
        "vector3": "vector3(-1144.100, 242.897, 65.140)",
        "icon": 7,
        "color": 13,
        "areaVisible": false
    }
]
```

### Parámetros
- **title**: Nombre que aparece en el marcador
- **vector3**: Coordenadas del marcador (lo puedes optener usando el comando /vector3)
- **icon**: ID del icono (1-170, excluyendo 60-64)
- **color**: ID del color (0-84)
- **areaVisible**: `true` para mostrar área, `false` para ocultar

### Recargar marcadores
Después de editar el archivo, usa el comando:
```
/marks
```

**Ejemplo de uso:**
```
/marks
📌 Map Markers: Marcadores listados en la consola del servidor
```

**Ejemplo de salida en consola del servidor:**
```
📌 Map Markers: Marcadores: 30 total | Página 1/3

[Map Markers] === PÁGINA 1/3 ===
[Map Markers] 1. "Gasolinera Centro" (-48, -1757, 29)
[Map Markers] 2. "Hospital Principal" (295, -1446, 29)
[Map Markers] 3. "Banco Central" (150, -1040, 29)
[Map Markers] 4. "Comisaría Norte" (441, -982, 30)
[Map Markers] 5. "Garaje Público" (215, -805, 30)
[Map Markers] 6. "Taller Mecánico" (-337, -135, 39)
[Map Markers] 7. "Tienda de Ropa" (425, -806, 29)
[Map Markers] 8. "Restaurante" (-1193, -768, 17)
[Map Markers] 9. "Farmacia" (318, -1076, 29)
[Map Markers] 10. "Gasolinera Norte" (49, -1761, 29)
[Map Markers] =========================

💡 Uso: /marks [página] [búsqueda] | Ej: /marks 2 gasolinera
```

O reinicia el recurso:
```
restart map_markers
```

### Validación de datos
El sistema valida automáticamente todos los marcadores y **ignora los mal configurados**, notificando al administrador:

- **Campos faltantes o vacíos**: Detecta campos requeridos que faltan o están vacíos
- **Coordenadas inválidas**: Valida que x, y, z sean números válidos (no 0, null o vacíos)
- **Tipos incorrectos**: Valida que los datos sean del tipo correcto
- **Rangos inválidos**: Verifica que iconos y colores estén en rangos válidos
- **Marcadores problemáticos**: Identifica exactamente qué marcador tiene errores
- **Resumen automático**: Muestra estadísticas de marcadores válidos vs inválidos

**Ejemplo de validación en consola:**
```
[Map Markers] === RESUMEN DE VALIDACIÓN ===
[Map Markers] Total de marcadores: 9
[Map Markers] Marcadores válidos: 1
[Map Markers] Marcadores inválidos: 8
[Map Markers] ==============================
[Map Markers] Marcador 2 "": Título inválido
[Map Markers] Marcador 3 "Sin Coordenada X": Coordenadas inválidas: x
[Map Markers] Marcador 4 "Coordenada Y Vacía": Coordenadas inválidas: y
[Map Markers] Marcador 5 "Icono Inválido": Icono inválido
[Map Markers] Marcador 6 "Color Fuera de Rango": Color inválido
[Map Markers] Marcador 7 "Falta Color": Campos faltantes: color
[Map Markers] Marcador 8 "AreaVisible Inválido": AreaVisible inválido
[Map Markers] Marcador 9 "Coordenadas en Cero": Coordenadas inválidas: x, y, z
[Map Markers] ==============================
```

### Configuración
El archivo `config.lua` permite personalizar:
- **Rendimiento**: Throttling de guardado y notificaciones
- **Blips**: Escala, transparencia, tamaño de área
- **Validación**: Rangos de iconos y colores permitidos
- **Debug**: Mensajes de depuración opcionales
- Actualmente no disponible hasta proximas actualizaciones(puedes intentar configurarlo pero no es recomendado ya que va mal la configuracion)

### Permisos
El comando `/marks` utiliza el grupo admin estándar de FiveM. Para usarlo, asegúrate de que el jugador tenga permisos de administrador:

**Para grupo de administradores (recomendado):**
```
add_ace group.admin command allow
```

**Para jugador específico:**
```
add_ace identifier.steam:110000xxxxxxxx command allow
```

**Nota:** El permiso `command` es el permiso estándar de FiveM para comandos de administrador.

### Comandos
- **/marks** - Lista todos los marcadores en la consola del servidor (solo admins)
  - **Paginación**: `/marks [página]` - Muestra 10 marcadores por página
  - **Búsqueda**: `/marks [página] [texto]` - Busca marcadores por nombre
  - **Ejemplos**: 
    - `/marks` - Primera página
    - `/marks 2` - Segunda página
    - `/marks 1 gasolinera` - Buscar gasolineras en primera página
    - `/marks 2 hospital` - Buscar hospitales en segunda página
  - Requiere permisos de administrador estándar de FiveM

## Compatibilidad
- FiveM
- QBCore (compatible pero no requiere)
- Cualquier framework de servidor

  # MAP Markers - Marker System

## Description
System to manage dynamic markers on the map of GTA V. Everything is handled from JSON files, eliminating the need for menus in the game.

## Characteristics
- ✅ ** Without menus ** - Everything is managed from files
- ✅ ** Default file ** - It is automatically created with an example marker
- ✅ ** Simple validation ** - Without unnecessary cache, without loops
- ✅ ** Minimum configuration ** - Only the essential
- ✅ ** Efficient synchronization ** - Only when necessary
- ✅ ** Simple error management ** - Ignore bad markers automatically
- ✅ ** Command /Marks ** - Instant List (Solo Adins)

## Facility
1. Place the resource in your `Resource/` folder
2. Add `reure map_markers` to your` server.cfg`
3. Restart the server

## Use

### First time
When starting the resource for the first time, the `blips_data` file will be automatically created with a default score.

### Edit markers
To add, edit or delete markers, simply modify the `blips_data.json`:

`` JSON
[ 
{ 
"Title": "Name of the Marker", 
"Vector3": "Vector3 (-1144.100, 242,897, 65,140)", 
"Icon": 7, 
"Color": 13, 
"Areavisible": False 
}
]
``

### parameters
- ** Title **: Name that appears on the scoreboard
- ** Vector3 **: Coordinates of the score
-** Icon **: Icon ID (1-170, excluding 60-64)
- ** Color **: color id (0-84)
- ** Areavisible **: `True` to show area,` fals` to hide

### Rechargar markers
After editing the file, use the command:
``
/Marks
``

** Example of use: **
``
/Marks
📌 MAP Markers: markers listed on the server console
``

** Exit exit in server console: **
``
📌 Map Markers: Markers: 30 Total | Page 1/3

[Map Markers] === Page 1/3 ===
[MAP Markers] 1. "Gasolinera Centro" (-48, -1757, 29)
[Map Markers] 2. "Main Hospital" (295, -1446, 29)
[MAP Markers] 3. "Central Bank" (150, -1040, 29)
[MAP Markers] 4. "North Police Station" (441, -982, 30)
[MAP Markers] 5. "Public Garage" (215, -805, 30)
[MAP Markers] 6. "Mechanical Workshop" (-337, -135, 39)
[MAP Markers] 7. "Clothing store" (425, -806, 29)
[MAP Markers] 8. "Restaurant" (-1193, -768, 17)
[Map Markers] 9. "Pharmacy" (318, -1076, 29)
[Map Markers] 10. "Northern Gasolinera" (49, -1761, 29)
[Map Markers] ====================

💡 Use: /Marks [page] [search] | Ex: /Marks 2 Gasolinera
``

Or restart the resource:
``
Restart Map_markers
``

### Data validation
The system automatically validates all markers and ** ignores the poorly configured **, notifying the administrator:

- ** missing or empty fields **: detects required fields that are missing or empty
- ** Invalid coordinates **: Validate that x, y, z are valid numbers (no 0, null or empty)
- ** incorrect types **: validate that the data is of the correct type
- ** Invalid ranges **: Verify what icons and colors are in valid ranges
- ** Problematic markers **: Identify exactly which marker has errors
- ** Automatic Summary **: Sample statistics of valid markers vs. invalids

** Example of console validation: **
``
[Map Markers] === Validation summary ===
[Map Markers] Total markers: 9
[Map Markers] Valid markers: 1
[Map Markers] Invalid markers: 8
[Map Markers] ========================
[MAP Markers] Marker 2 "": Invalid title
[Map Markers] 3 "No Coordinate X": Invalid coordinates: x x
[Map Markers] 4 "coordinate and empty": Invalid coordinates: and
[Map Markers] 5 "Invalid Icon": Invalid icon
[Map Markers] 6 "Out -Range Color": Inval
[Map Markers] 7 "Missing color": missing fields: color
[Map Markers] 8 "invalid areavisible score": invalid areavisible
[Map Markers] 9 "Coordinates at zero": Invalid coordinates: x, y, z
[Map Markers] ========================
``

### Configuration
The `config.lua` file allows you to customize:
- ** Performance **: Throttling of save and notifications
- ** Blips **: Scale, transparency, area size
- ** Validation **: icon ranges and allowed colors
- ** Debug **: Optional purification messages
- Currently not available until next updates (you can try to configure it but it is not recommended since the configuration is going wrong)

### Permissions
The `/Marks` command uses the FIMEm standard Group. To use it, make sure the player has administrator permits:

** For Group of Administrators (recommended): **
``
Add_ace Group.admin Command Allow
``

** For specific player: **
``
Add_ace identifier.steam: 110000xxxxxxxxx command allow
``

** Note: ** The permission `Command` is the standard FIVEM permission for administrator commands.

### Commands
- **/Marks ** - List all markers on the server console (Solo Adins) 
- ** Pagination **: `/Marks [page]` - Show 10 markers per page 
- ** Search **: `/Marks [page] [text]` - Look for markers by name 
- ** Examples **: 
- `/Marks` - First page 
- `/Marks 2` - Second page 
- `/Marks 1 Gasolinera` - Find gas stations on the first page 
- `/Marks 2 Hospital` - Find hospitals on the second page 
- Requires FICEM Standard Administrator Permits

## Compatibility
- FIVEM
- Qbcore (compatible but does not require)
- Any server framework



