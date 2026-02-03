#!/usr/bin/env bash
set -euo pipefail

# Script local para generar PDFs (requiere Node + npm y Jekyll / Ruby)

echo "Construyendo sitio con Jekyll..."
bundle exec jekyll build

echo "Instalando dependencias node..."
npm install

echo "Iniciando servidor estático en http://127.0.0.1:8080/_site..."
npx http-server _site -p 8080 -c-1 &
server_pid=$!

# esperar a que el servidor esté listo
sleep 2

echo "Generando PDFs..."
npm run generate

echo "Deteniendo servidor (PID $server_pid)"
kill $server_pid || true

echo "Pdfs generados en docs/pdfs/"
