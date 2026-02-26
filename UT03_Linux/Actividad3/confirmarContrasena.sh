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
        echo "✅ OK: Las contraseñas coinciden."
        exit 0
    else
        echo "💥 ERROR: Las contraseñas no son iguales. Intente de nuevo."
        echo "----------------------------------------------------"
    fi
done