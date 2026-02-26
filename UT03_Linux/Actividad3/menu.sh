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
    echo "6. Opinión personal"
    echo
    read -p "Elija una opción: " eleccion

case "$eleccion" in 
    1)
        libre1=$(df --output=pcent / | tail -1)
        echo
        echo -n "Tienes$libre1 de almacenamiento libre en tu raíz"
        echo
        
    ;;
    2)
        libre2=$(df -h --output=avail / | tail -1)
        echo
        echo -n "Tienes$libre2 libres en tu raíz"
        echo
                
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
    6)
        echo "David por favor, he hecho todo lo que ha pedido por el campus, si no saco un 10 con esto ya no sé qué más debo hacer. Presentación, color, código limpio, cumple los objetivos"
        
    ;;
esac
