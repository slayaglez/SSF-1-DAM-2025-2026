#!/usr/bin/env bash
set -euo pipefail

# Uso:
#   ./crear_estructura.sh miproyecto jugadores.txt
# Si no pasas jugadores.txt, usa "jugadores.txt" en el directorio actual.

PROJECT_NAME="${1:-}"
INPUT_FILE="${2:-jugadores.txt}"

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Uso: $0 <nombre_proyecto> [jugadores.txt]" >&2
  exit 1
fi

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "No existe el fichero: $INPUT_FILE" >&2
  exit 1
fi

BASE_DIR="$PWD/$PROJECT_NAME"
mkdir -p "$BASE_DIR"

# Normaliza nombre de club para nombre de carpeta
normalize_club_dir() {
  local s="$1"
  # recorta, cambia espacios por _, quita caracteres raros para carpetas
  s="$(echo "$s" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"
  s="$(echo "$s" | tr ' ' '_' | tr -cd '[:alnum:]_.-')"
  echo "$s"
}

# Recorre el fichero (separador ;)
# Formato esperado:
# Equipo;Dorsal;Nombre completo;Apodo;... (resto de campos)
awk -F';' '
  NR==1 { next } # saltar cabecera
  NF>=2 { print $1 ";" $2 ";" $0 }
' "$INPUT_FILE" | while IFS=';' read -r club dorsal rest_of_line; do
  club_dir="$(normalize_club_dir "$club")"
  club_path="$BASE_DIR/$club_dir"

  mkdir -p "$club_path/assets" "$club_path/others" "$club_path/players"
  : > "$club_path/wiki.txt"

  # dorsal: si viene N/D o vacío, lo saltamos (para no pisar archivos)
  dorsal_fmt="$(echo "$dorsal" | tr -d '[:space:]')"

  # si quieres 2 dígitos solo si es numérico
  if [[ "$dorsal_fmt" =~ ^[0-9]+$ ]]; then
    dorsal_fmt="$(printf '%02s' "$dorsal_fmt" | tr ' ' '0')"
  fi

  out_file="$club_path/players/${dorsal_fmt}.info"

  echo "$rest_of_line" > "$out_file"
done

echo "OK. Estructura creada en: $BASE_DIR"

