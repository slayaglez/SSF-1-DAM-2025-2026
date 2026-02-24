#!/bin/bash

# Comprobar si el directorio existe
RUTA="${1:-.}"

if [ ! -d "$RUTA" ]; then
    echo "Error: El directorio '$RUTA' no existe."
    exit 1
fi




cd "$RUTA" || { clear; echo "💔 No tienes permisos para acceder a este directorio"; exit 1; } 

# Variables de conteo
count_img=0
count_pdf=0
count_doc=0
count_txt=0
count_otros=0



mkdir -p IMGS PDFS DOCS VACIOS OTROS TXTS

# Procesar archivos ignorando script
for file in *; do
    [ -d "$file" ] && continue
    [[ "$file" == "KaosKiller.sh" ]] && continue
    [[ "$file" == "random_files_v2.sh" ]] && continue
    [ ! -s "$file" ] && continue # Ignorar vacíos para el movimiento

# Hago un switch
        ext="${file##*.}"
    if [[ "$ext" =~ ^(jpg|png|gif)$ ]]; then
        mv "$file" IMGS/ 2>/dev/null && ((count_img++))
    elif [[ "$ext" =~ ^(pdf|PDF)$ ]]; then
        mv "$file" PDFS/ 2>/dev/null && ((count_pdf++))
    elif [[ "$ext" =~ ^(txt|TXT)$ ]]; then
        mv "$file" TXTS/ 2>/dev/null && ((count_txt++))
    elif [[ "$ext" =~ ^(docx|odt)$ ]]; then
        mv "$file" DOCS/ 2>/dev/null && ((count_doc++))
    else
        mv "$file" OTROS/ 2>/dev/null && ((count_otros++))
    fi
done


# Guardo archivos vacíos
vacios=$(find . -maxdepth 1 -type f -empty)
# El numero de palabras de la variable es el numero de archivos
num_vacios=$(echo $vacios | wc -w)

# --- INFORME FINAL ---
echo -e "\n--- RESUMEN DE ORGANIZACIÓN ---"
echo "✅ IMGS: $count_img | PDFS: $count_pdf | DOCS: $count_doc | TXTS: $count_txt | OTROS: $count_otros"
    if [[ $num_vacios == 0 ]]; then
        echo "✅ No se han encontrado elementos vacíos"
    else
        echo "⚠️ Elementos vacíos encontrados: $num_vacios"
    fi
echo "--------------------------------"


if [ "$num_vacios" -gt 0 ]; then
    echo "Lista de elementos vacíos: $vacios"
    
    echo -n "¿Deseas eliminar estos $num_vacios elementos? (s/n): "
    read -r respuesta
    [[ "$respuesta" =~ ^[Ss]$ ]] && rm $vacios && echo "✨ Limpieza completada."
fi


