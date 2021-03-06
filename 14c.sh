#! /bin/bash
#
# Entra un directori com a argument
# exs arg
# exs dir
# fer ls del directori

if [ $# -ne 1 ]
then
	echo "Error: nº arguments insuficients"
	echo "Usage $0: arg1"
	exit $ERRASGS
fi

dir=$1

if !  [ -d $dir ]
then
  echo "Error: $1 no es un directori o no exsisteix"
  echo "Usage $0: dir"
fi

# XIXA, ULL NO ES POT PASSAR DIRECTAMENT

num=1
llistaElements=$(ls $dir)

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

  echo "$num: $element: $frase "
  (($num++))
  
done
	
exit 0
