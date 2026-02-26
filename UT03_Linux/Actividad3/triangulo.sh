#==============================================#
#                                              #
#    author: slayaglez                         #
#    github: https://github.com/slayaglez      #
#    version: 1.0.0                            #
#                                              #
#==============================================#

#!/bin/bash

read -p "Introduzca la altura de su triángulo: " altura
echo

for ((i=1; i<=altura; i++)); do
    
    for ((j=0; j<=altura-i; j++)); do

        echo -n " "
    done
    for ((k=1; k<=(2*i-1); k++)); do

        echo -n "#"
    done

    echo ""
done