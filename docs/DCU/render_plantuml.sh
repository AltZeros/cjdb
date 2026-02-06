#!/usr/bin/env bash
set -euo pipefail

# --- CONFIGURACIÓN DE RUTAS ---
# Cambia estas rutas por las tuyas
ORIGEN="./"     # Donde tienes tus archivos .puml
DESTINO="./img4"  # Donde quieres que aparezcan las imágenes
# ------------------------------

# Crear el directorio de destino si no existe
mkdir -p "$DESTINO"

# Verificar si PlantUML está instalado
if ! command -v plantuml >/dev/null 2>&1; then
  echo "Error: PlantUML no está instalado."
  echo "Instálalo con: sudo apt install -y default-jre graphviz plantuml"
  exit 1
fi

# Procesar los archivos
echo "Iniciando procesamiento de diagramas..."
echo "Buscando en: $ORIGEN"

# Verificamos si hay archivos .puml antes de entrar al ciclo
if ls "$ORIGEN"/*.puml >/dev/null 2>&1; then
    for f in "$ORIGEN"/*.puml; do
      nombre=$(basename "$f")
      echo ">>> Procesando: $nombre"
      
      # Generar SVG y PNG directamente en la carpeta de destino (-o)
      plantuml -tsvg -charset UTF-8 -o "$(realpath "$DESTINO")" "$f"
      plantuml -tpng -charset UTF-8 -o "$(realpath "$DESTINO")" "$f"
    done
    echo "¡Listo! Diagramas renderizados en: $DESTINO"
else
    echo "No se encontraron archivos .puml en $ORIGEN"
fi