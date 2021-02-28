#! /bin/bash
#
# Entra un directori com a argument
# exs arg
# exs dir
# fer ls del directori


# ARA 1 O MES DIRECTORIS I VALIDAR-lOS 

if [ $# -ge 1 ]
then
	echo "Error: nº arguments insuficients"
	echo "Usage $0: arg1"
	exit $ERRASGS
fi

dir=$1


# XIXA, ULL NO ES POT PASSAR DIRECTAMENT

ERR_NODIR=1
status=0
llistaElements=$(ls $dir)

for dir in $* 
do

  if !  [ -d $dir ]
  then
    echo "Error: $1 no es un directori o no exsisteix" >> /dev/stderr
    status=$ERR_NODIR
  else


  for element in $llistaElements # fit es un nom relatiu ULL, SI ELS ARXIUS ESTAN A UN LLOC DIFETENT DE L'ARREL S?HA D?ESPECIFICAR P.E --> prova/carta  

  do
    element2="$dir/$element1"

    if [ -L $element2 ]
    then
      $frase="Es un link"
    elif[ -d $element2 ]
    then	  
      $frase="es un directori"
    elif [ -f $element2 ]
    then
      $frase="es un regular file"
    else	
      $frase="es una altre cosa"	
    fi
  
    echo -e "\t $num: $element: $frase "
    (($num++))
  done
  fi

done
	
exit 0
