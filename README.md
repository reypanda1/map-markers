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

# Map Markers - Marker System

## Description

A system for managing dynamic markers on the GTA V map. Everything is handled through JSON files, eliminating the need for in-game menus.

## Features

  - ✅ **No menus** - Everything is managed via files
  - ✅ **Default file** - Automatically created with an example marker
  - ✅ **Simple validation** - No unnecessary caching, no loops
  - ✅ **Minimal configuration** - Only the essentials
  - ✅ **Efficient synchronization** - Only when necessary
  - ✅ **Simple error handling** - Automatically ignores bad markers
  - ✅ **/marks command** - Instant listing (admins only)

-----

## Installation

1.  Place the resource in your `resources/` folder
2.  Add `ensure map_markers` to your `server.cfg`
3.  Restart the server

-----

## Usage

### First Time

When the resource is started for the first time, the `blips_data.json` file will be automatically created with a default marker.

### Editing Markers

To add, edit, or delete markers, simply modify the `blips_data.json` file:

```json
[
    {
        "title": "Marker Name",
        "vector3": "vector3(-1144.100, 242.897, 65.140)",
        "icon": 7,
        "color": 13,
        "areaVisible": false
    }
]
```

### Parameters

  - **title**: The name that appears on the marker
  - **vector3**: The coordinates of the marker (you can get them using the /vector3 command)
  - **icon**: Icon ID (1-170, excluding 60-64)
  - **color**: Color ID (0-84)
  - **areaVisible**: `true` to show an area, `false` to hide it

### Reloading Markers

After editing the file, use the command:

```
/marks
```

**Example of use:**

```
/marks
📌 Map Markers: Markers listed in the server console
```

**Example of server console output:**

```
📌 Map Markers: Markers: 30 total | Page 1/3

[Map Markers] === PAGE 1/3 ===
[Map Markers] 1. "Downtown Gas Station" (-48, -1757, 29)
[Map Markers] 2. "Main Hospital" (295, -1446, 29)
[Map Markers] 3. "Central Bank" (150, -1040, 29)
[Map Markers] 4. "North Police Station" (441, -982, 30)
[Map Markers] 5. "Public Garage" (215, -805, 30)
[Map Markers] 6. "Mechanic Shop" (-337, -135, 39)
[Map Markers] 7. "Clothing Store" (425, -806, 29)
[Map Markers] 8. "Restaurant" (-1193, -768, 17)
[Map Markers] 9. "Pharmacy" (318, -1076, 29)
[Map Markers] 10. "North Gas Station" (49, -1761, 29)
[Map Markers] =========================

💡 Usage: /marks [page] [search] | Ex: /marks 2 gas station
```

Or restart the resource:

```
restart map_markers
```

-----

### Data Validation

The system automatically validates all markers and **ignores any that are misconfigured**, notifying the administrator:

  - **Missing or empty fields**: Detects required fields that are missing or empty
  - **Invalid coordinates**: Validates that x, y, z are valid numbers (not 0, null, or empty)
  - **Incorrect types**: Validates that the data is of the correct type
  - **Invalid ranges**: Verifies that icons and colors are within valid ranges
  - **Problematic markers**: Identifies exactly which marker has errors
  - **Automatic summary**: Shows statistics of valid vs. invalid markers

**Example of console validation:**

```
[Map Markers] === VALIDATION SUMMARY ===
[Map Markers] Total markers: 9
[Map Markers] Valid markers: 1
[Map Markers] Invalid markers: 8
[Map Markers] ==============================
[Map Markers] Marker 2 "": Invalid title
[Map Markers] Marker 3 "No X Coordinate": Invalid coordinates: x
[Map Markers] Marker 4 "Empty Y Coordinate": Invalid coordinates: y
[Map Markers] Marker 5 "Invalid Icon": Invalid icon
[Map Markers] Marker 6 "Color Out of Range": Invalid color
[Map Markers] Marker 7 "Missing Color": Missing fields: color
[Map Markers] Marker 8 "Invalid AreaVisible": Invalid AreaVisible
[Map Markers] Marker 9 "Zero Coordinates": Invalid coordinates: x, y, z
[Map Markers] ==============================
```

-----

### Configuration

The `config.lua` file allows you to customize:

  - **Performance**: Throttling for saving and notifications
  - **Blips**: Scale, transparency, area size
  - **Validation**: Allowed icon and color ranges
  - **Debug**: Optional debug messages
  - Currently not available until future updates (you can try to configure it, but it's not recommended as the configuration doesn't work well)

-----

### Permissions

The `/marks` command uses the standard FiveM admin group. To use it, make sure the player has administrator permissions:

**For admin group (recommended):**

```
add_ace group.admin command allow
```

**For a specific player:**

```
add_ace identifier.steam:110000xxxxxxxx command allow
```

**Note:** The `command` permission is the standard FiveM permission for admin commands.

-----

### Commands

  - **/marks** - Lists all markers in the server console (admins only)
      - **Pagination**: `/marks [page]` - Shows 10 markers per page
      - **Search**: `/marks [page] [text]` - Searches for markers by name
      - **Examples**:
          - `/marks` - First page
          - `/marks 2` - Second page
          - `/marks 1 gas station` - Search for gas stations on the first page
          - `/marks 2 hospital` - Search for hospitals on the second page
      - Requires standard FiveM administrator permissions

-----

### Compatibility

  - FiveM
  - QBCore (compatible but not required)
  - Any server framework





