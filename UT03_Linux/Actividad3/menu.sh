#==============================================#
#                                              #
#    author: slayaglez                         #
#    github: https://github.com/slayaglez      #
#    version: 1.0.0                            #
#                                              #
#==============================================#

#!/bin/bash

    echo "🤩🤩Cbas Script🤩🤩"
    echo "1. Espacio libre en disco (%) 💯"
    echo "2. Espacio libre (tamaño) 🧩"
    echo "3. Usuario actual y nombre de la máquina 🎮"
    echo "4. Números de usuarios en la máquina (/etc/passwd) 🧑‍🎓"
    echo "5. Espacio usado en tu carpeta 🏆"
    echo
    read -p "Elija una opción: " eleccion

case "$eleccion" in 
    1)
        df --output=source,pcent,target
    ;;
    2)
        libre= df -h --output=avail / | tail -1
        echo
        echo -n "Tienes $libre libres en tu raíz"
                
    ;;
    3)
        echo
        echo "Usuario actual: " $USER 
        echo -n "Nombre de la máquina: "
        hostname 
    ;;
    4)
        echo -n "Usuarios en la máquina: "
        users
    ;;
    5)
        echo -n "Espacio usado en carpeta: "
        du -sh .
    ;;
esac
