#!/usr/bin/env bash

# Generar número entre 1 y 10
objetivo=$(( ( RANDOM % 10 ) + 1 ))
intentos=3

echo
echo
echo "¡He pensado un número 1 entre y 10!"
echo "Tienes $intentos intentos."


for (( i=1; i<=intentos; i++ )); do
    read -p "Intento #$i: ¿Cuál es? " apuesta
    
    if [[ $apuesta -eq $objetivo ]]; then
        echo "¡BOOM! HAS GANADO en el intento $i ¡¡YUHUU!!"
        exit 0
    elif [[ $apuesta -lt $objetivo ]]; then
        echo "Te quedaste corto... 📉"
    else
        echo "Te pasaste de largo... 📈"
    fi
done

printf "¡Game Over! El número era el $objetivo. 💀\n\n"
