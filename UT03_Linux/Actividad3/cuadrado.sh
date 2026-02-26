#==============================================#
#                                              #
#    author: slayaglez                         #
#    github: https://github.com/slayaglez      #
#    version: 1.0.0                            #
#                                              #
#==============================================#

#!/bin/bash

echo ¡Bienvenido!
read -p "Introduzca la base de su cuadrado: " base
echo
read -p "Introduzca la altura de su cuadrado: " altura
echo

for ((i=0; i<base; i++)); do
    
    for ((j=0; j<altura; j++)); do

        echo -n "# "
    done

    echo ""
done