#!/usr/bin/env bash
set -euo pipefail

# Script para renderizar los diagramas PlantUML a SVG y PNG localmente
# Requisitos: plantuml, java (default-jre) y graphviz

mkdir -p docs/img/useCases

if ! command -v plantuml >/dev/null 2>&1; then
  echo "PlantUML no encontrado. Instálalo con: sudo apt-get update && sudo apt-get install -y default-jre graphviz plantuml"
  exit 1
fi

for f in docs/plantUML/useCases/*.puml; do
  echo "Renderizando: $f"
  plantuml -tsvg -charset UTF-8 -o docs/img/useCases "$f"
  plantuml -tpng -charset UTF-8 -o docs/img/useCases "$f"
done

echo "Diagramas renderizados en docs/img/useCases/"