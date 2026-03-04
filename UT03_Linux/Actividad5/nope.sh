#!/usr/bin/env bash

echo "Hi!, soy el script pasota y mi PID es: $$"

trap 'echo "RECIBIDO OK OK ahora ya si eso lo vemos...";' TERM
trap 'echo; echo "Pas00o0o0o0o0 de tii jaja"; continue' INT
trap 'echo; echo "que te olvides pesado!"; continue' TSTP
trap 'echo; echo "Terminando, bye bye :("' EXIT

echo "Iniciando proceso pasota"
while true; do
    echo "mek mek!! sigo vivo!!"
    read -rt 2 || true
done
