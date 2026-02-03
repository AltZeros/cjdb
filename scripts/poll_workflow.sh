#!/usr/bin/env bash
set -euo pipefail

# Poll GitHub Actions API for the plantuml-render workflow runs and wait until one completes
OWNER="AltZeros"
REPO="cjdb"
WORKFLOW_FILE="plantuml-render.yml"
MAX_ATTEMPTS=30
SLEEP=10

for i in $(seq 1 "$MAX_ATTEMPTS"); do
  echo "[Intento $i/$MAX_ATTEMPTS] Consultando ejecuciones..."
  data=$(curl -s "https://api.github.com/repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_FILE/runs")
  total=$(echo "$data" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d.get("total_count",0))')
  if [ "${total}" -eq 0 ]; then
    echo "No hay runs aún. Esperando ${SLEEP}s..."
  else
    echo "Se detectó al menos un run. Mostrando resumen del más reciente:"
    echo "$data" | python3 -c 'import sys,json; d=json.load(sys.stdin); r=d["workflow_runs"][0]; print("id=%s status=%s conclusion=%s created=%s html=%s" % (r.get("id"), r.get("status"), r.get("conclusion"), r.get("created_at"), r.get("html_url")))'

    status=$(echo "$data" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d["workflow_runs"][0]["status"])')
    conclusion=$(echo "$data" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d["workflow_runs"][0].get("conclusion"))')
    html=$(echo "$data" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d["workflow_runs"][0].get("html_url"))')

    if [ "$status" = "completed" ]; then
      echo "Run completada con conclusion: ${conclusion:-null}"
      echo "URL: $html"
      exit 0
    else
      echo "Run no completada (status=$status). Esperando ${SLEEP}s..."
    fi
  fi
  sleep "$SLEEP"
done

echo "Timeout: no se encontró ni completó un run en ${MAX_ATTEMPTS} intentos." >&2
exit 2
