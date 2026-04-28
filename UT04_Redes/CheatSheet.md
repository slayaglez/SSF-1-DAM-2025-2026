------------------------------
## 📘 Guía de Direccionamiento IP y Subnetting## Ejercicio 3, 4 y 7: Identificación de Clases
Para saber a qué clase pertenece una IP, solo tienes que mirar el primer número (primer octeto):

| Clase | Rango del 1er octeto | Máscara por defecto |
|---|---|---|
| A | 0 - 127 | 255.0.0.0 (/8) |
| B | 128 - 191 | 255.255.0.0 (/16) |
| C | 192 - 223 | 255.255.255.0 (/24) |
| D | 224 - 239 | (Multicast - No se usa para hosts) |
| E | 240 - 255 | (Experimental - No se usa para hosts) |

------------------------------
## Ejercicio 5, 8 y 11: Red vs Host e IPs especiales
Una vez que sabes la clase, divides la IP:

   1. Separación:
   * Clase A: [Red] . [Host] . [Host] . [Host]
      * Clase B: [Red] . [Red] . [Host] . [Host]
      * Clase C: [Red] . [Red] . [Red] . [Host]
   2. IP de Red (ID): Escribe la parte de red igual y pon todos los números de host a 0.
   3. IP de Broadcast: Escribe la parte de red igual y pon todos los números de host a 255.
   4. IP de Router: Normalmente es la primera IP utilizable (la IP de red + 1).
   5. ¿Válida para equipo? No es válida si es la de Red (todo 0s en host) o la de Broadcast (todo 255s en host).

------------------------------
## Ejercicio 6: Conversión de Máscara a CIDR (/XX)
El número CIDR es la suma de los "1" que hay en binario.

* 255 es 11111111 (ocho "1").
* 255.0.0.0 = /8 (8 unos)
* 255.255.0.0 = /16 (16 unos)
* 255.255.255.0 = /24 (24 unos)
* Si el número no es 255 o 0 (ej: 240), suma los bits: 128(1)+64(1)+32(1)+16(1) = 4 bits.

------------------------------
## Ejercicio 12: Subnetting (Crear subredes)
Cuando te piden dividir una red, sigue estos pasos:

   1. Identificar qué necesitas: ¿Más redes o más hosts?
   2. Fórmula de Hosts: $2^h - 2 \geq \text{equipos necesarios}$.
   * Ejemplo: Para 12 equipos, $2^4 = 16$. Necesitas 4 bits de host.
   3. Calcular Máscara Nueva:
   * Si usas 4 bits para host en una Clase C (que tiene 8 bits totales al final), te sobran 4 bits para RED.
      * Tu máscara ya no es /24, ahora es /24 + 4 = /28.
   4. Saltos de Red: Resta el valor de la máscara a 256.
   * Si /28 es 255.255.255.240, el salto es $256 - 240 = \mathbf{16}$. Tus redes serán: .0, .16, .32, .48...
   
------------------------------
## Ejercicio 13 y 15: Dispositivos de red

* Misma subred: Se usa un Switch. La comunicación es directa por MAC.
* Distinta subred: Se necesita un Router (él hace de Puerta de Enlace).
* Filtrado de contenido: Se usa un Proxy o un Firewall.
* Loopback (127.0.0.1): Es para que el ordenador se hable a sí mismo. No sale a la red.

------------------------------
## Ejercicio 16 y 17: Tablas de Enrutamiento
Para que un router sepa dónde enviar un paquete, mira su tabla:

   1. Red de Destino: ¿A qué red va el paquete?
   2. Máscara: Para saber qué parte de la IP comparar.
   3. Gateway (Puerta de enlace): ¿A qué IP de otro router se lo tengo que pasar?
   4. Interfaz: ¿Por qué "puerta" física (m0, m1...) saco el cable?

------------------------------
Tip para el Ejercicio 17: Para saber si una IP pertenece a una red con máscara rara (ej: /26), mira el tamaño del bloque. /26 hace saltos de 64.

* Red 1: 0 a 63
* Red 2: 64 a 127
* Red 3: 128 a 191
* Si te dan la IP .135, cae dentro del rango 128-191. ¡Es de la Red 3!