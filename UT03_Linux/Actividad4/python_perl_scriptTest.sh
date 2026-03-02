#!/usr/bin/bash

horainicio=$(date '+%H:%M:%S')
echo
echo -e "Hola qué tal!"
echo -e "Ahora son las: $horainicio"
echo -e "¿En qué te puedo ayudar?"
echo
echo
echo "=== Bloque Python embebido dentro de Bash ==="
echo

python3 <<'FINPYTHON'
for i in range(1, 11):
    print(f"Estoy contando dentro de Python dentro de Bash!! --> {i}!")
FINPYTHON

echo
echo "=== Bloque Perl embebido dentro de Bash ==="
perl <<'FINPERL'
for my $i (1..10) {
    print "Estoy contando dentro de Perl dentro de Bash!! --> $i!\n";
}
FINPERL

echo
echo -e "El script bash ha terminado correctamente!\n"
