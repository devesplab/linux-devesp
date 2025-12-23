#!/bin/bash
#
# Di hola y muestra la fecha
#
DATE=`date +"%m/%d/%y"`
LOG=greeting.log

[ -f ${LOG} ] || echo "INFO: creando ${LOG} porque no existe" && touch ${LOG}

function greeting(){
  echo "Hola, Mundo! Hoy es ${DATE}" > ${LOG}
} 

greeting
