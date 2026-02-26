#==============================================#
#                                              #
#    author: slayaglez                         #
#    github: https://github.com/slayaglez      #
#    version: 1.0.0                            #
#                                              #
#==============================================#

#!/bin/bash

while true; do
    
    read -sp "Ingrese su contraseña: " contra1
    echo
    read -sp "Confirme su contraseña: " contra2
    echo

    if [[ "$contra1" == "$contra2" ]]; then
        echo "----------------------------------------------------"
        echo "✅ OK: Las contraseñas coinciden."
        echo "----------------------------------------------------"
        exit 0
    else
        echo "----------------------------------------------------"
        echo "💥 ERROR: Las contraseñas no son iguales. Intente de nuevo."
        echo "----------------------------------------------------"
    fi
done