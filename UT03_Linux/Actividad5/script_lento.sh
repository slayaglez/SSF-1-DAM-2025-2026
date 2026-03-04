#!/usr/bin/env bash

archivo="lentosalida.txt"
cont=0
# Usamos $(...) para capturar la salida del comando date
horainicio=$(date '+%H:%M:%S')

echo "Empezamos a las $horainicio --> Inicio del contador" > "$archivo"

while true; do
    ((++cont))
    tempdate=$(date '+%H:%M:%S')
    echo "[$tempdate] Tamos activos -- iteración: $cont" >> "$archivo"
    sleep 2
done

