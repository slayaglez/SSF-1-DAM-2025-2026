#!/bin/bash

dias=$1
horas=$2
segundos=$3 
var1=86400
var2=3600

dias_segundos=$(($dias * $var1))
horas_segundos=$(($horas * $var2))
total=$(($dias_segundos + $horas_segundos))
total=$(($total + $segundos))

echo "De $dias días, $horas horas y $segundos segundos: $total es el numero de segundos totales";
