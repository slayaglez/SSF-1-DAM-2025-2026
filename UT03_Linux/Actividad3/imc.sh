#==============================================#
#                                              #
#    author: slayaglez                         #
#    github: https://github.com/slayaglez      #
#    version: 1.0.0                            #
#                                              #
#==============================================#

#!/bin/bash

altura=$1
peso=$2

altura=$(echo "scale=2; $altura / 100" | bc)
altura=$(echo "scale=2; $altura * $altura" | bc)
imc=$(echo "scale=2; $peso / $altura" | bc)
decimal=18.5

if (( $(echo "$imc < 18.5" | bc -l) )); then
    echo $imc" es bajo peso"
elif (( $(echo "$imc >= 18.5" | bc -l) )) && (( $(echo "$imc < 25" | bc -l) )); then
    echo $imc" es peso normal"
elif (( $(echo "$imc >= 25" | bc -l) )) && (( $(echo "$imc < 30" | bc -l) )); then
    echo $imc" es sobrepeso"
elif (( $(echo "$imc >= 30" | bc -l) )); then
    echo $imc" es obesidad"
fi