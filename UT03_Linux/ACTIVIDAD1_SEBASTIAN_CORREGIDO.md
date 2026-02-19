# ACTIVIDAD 1.1 - COMANDOS BÁSICOS
## SEBASTIÁN LAYA GONZÁLEZ - slayaglez

<font color="red">**IMPORTANTE**</font>
En algunos ejercicios he marcado mis anteriores errores, la forma incorrecta al principio seguida de la forma corregida. Ej:

<font color="red">**forma errónea**</font> &nbsp; &nbsp;// &nbsp; &nbsp;<font color="00FF00">**corrección post-entrega**</font>

### 1. Explique todas las formas diferentes que conozca para ir a la carpeta home del usuario logueado.
<br>

```
cd
cd $HOME
cd ~/
cd ~
cd /home/$USER
```

<br>
<br>

### 2. Cree en la carpeta home de su usuario (recuerde que la carpeta /home/usuario ya está creada y es la carpeta principal de cada usuario) las siguientes carpetas prueba/test/febrero/estoy/aprendiendo con 1 solo comando, recuerde los parámetros de los comandos o búsquelos con --help o con man.
<br>

```
mkdir -p prueba/test/febrero/estoy/aprendiendo
```

<br>
<br>

### 3. Cree un enlace simbólico en su carpeta de usuario directamente a la carpeta estoy y llámelo link2estoy
<br>

```
ln -s prueba/test/febrero/estoy/ link2estoy
```

<br>
<br>

### 4. Cree la carpeta aprendiendo2 dentro de la carpeta anteriormente creada estoy de la forma en que le sea más cómodo
<br>

```
mkdir ~/prueba/test/febrero/estoy/aprendiendo2
```

<br>
<br>

### 5. Cree tres archivos vacíos en la carpeta aprendiendo llamados:
<br>

```
touch a.txt b.txt c.txt
```

<br>
<br>

### 6. En el campus virtual en la carpeta de recursos hay dos archivos de texto, .txt, players.txt y nombres_desordenados.txt, descárguelos y muévalos a la carpeta febrero.
<br>

```
mv ~/Descargas/players.txt ~/prueba/test/febrero/
mv ~/Descargas/nombres_desordenados.txt ~/prueba/test/febrero/
```

<br>
<br>

### 7. Si no lo está, vaya a la carpeta home de su usuario nuevamente (/home/user) y utilice un comando para ver en forma de "árbol" el listado de directorios recientemente creado.
<br>

```
tree prueba
```

<br>
<br>

### 8. Sería capaz de encontrar la forma (usando la ayuda del comando anterior: man o --help) para hacer lo mismo pero que en el listado tipo árbol pueda ver lo que ocupa cada carpeta? y los permisos? y todo a la vez?
<br>

```
sí:
tree -ps prueba
tree -psh prueba (para leerlo cómodamente)
```

<br>
<br>

### 9. Haga una búsqueda de todos los archivos con extensión .txt en su carpeta de usuario. Recuerde que si ya está en la carpeta de usuario la forma más rápida de indicar el directorio actual es hacer uso del punto.
<br>

```
find . *.txt
```

<br>
<br>

### 10. Busque todos los enlaces simbólicos.
<br>

```
find . -type l
```

<br>
<br>

### 11. Haga una búsqueda de todos los archivos que hayan sido modificados en los últimos 15 minutos. <font color="red">**ERROR**</font>
<br>

```
man find
```

en la sección "POSITIONAL OPTIONS" encontré lo siguiente:
<br>

```
-daystart
              Measure times (for -amin, -atime, -cmin, -ctime, -mmin, and  -mtime)  from  the  beginning  of  today
              rather  than  from  24  hours  ago.  This option only affects tests which appear later on the command
              line.
```

<br>
luego, encontré el comando:
<br>

``` diff
- find . -mmin 15
+ find . -type f -mmin -15
```

<br>
<br>

### 12. ¿Cómo podría guardar el resultado de la búsqueda anterior en un fichero llamado resultado.log? Recordatorio. Uso de Pipes. <font color="red">**ERROR**</font>
<br>

```diff
- find . -mmin 15 > resultado.log 
+ find . -type f -mmin -15 > resultado.log
```

<br>
<br>

### 13. Busque todos los archivos que empiecen por la letra "a" indiferentemente de si es mayúscula o minúscula.
<br>

```
find . -iname "a*"
```

<br>
(al parecer el entrecomillado es importante porque si no, no lo entiende como patrón)
<br>
<br>

### 14. Muestre en pantalla en contenido de todos los archivos de texto (.txt)
<br>

```
find . -iname "*.txt" -exec cat {} +
```

<br>
<br>

### 15. Busque todos los archivos vacíos. <font color="red">**ERROR**</font>
<br>

``` diff
- find . -empty
+ find . -type f -empty
```

<br>
<br>

### 15. Busque todos los archivos vacíos .txt y bórrelos en un solo comando. OJO: Verifique antes de ejecutar el borrado que el comando de búsqueda es correcto y devuelve los archivos que realmente se quieren borrar. <font color="red">**ERROR**</font>
<br>

```diff
- find . -empty -exec rm {} + 
+ find . -iname "*.txt" -empty -exec rm {} +
```
