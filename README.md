# Map Markers - Sistema de Marcadores Optimizado

## Descripción
Sistema optimizado para gestionar marcadores dinámicos en el mapa de GTA V. Todo se maneja desde archivos JSON, eliminando la necesidad de menús en el juego.

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

### Validación de datos mejorada
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