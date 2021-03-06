#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# Identificar quin tipus d'arxiu es un arxiu donat
#   -validar Earg, Validar E element, dir tipus element entre dir_regular_link_
#   $ prog direct
# -----------------------

ERR_NARGS=1
ERR_NARX=2

# EL PROGRAMA CONTÉ 3 MODULS

# 1) Validem arguments

if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo " Usage: $0 arxiu"
  exit $ERR_NARGS
fi

# 2) Validar si es fitxer

if ! [ -e $1  ]
then
  echo " Error: $1 no es un fitxer o no exsisteix"
  exit $ERR_NARX
fi

# 3) Identificar tipus arxius (XIXA)

fitx=$1

if [ -L $fitx ] # important l'ordre ja que un link/dir es tmb un arxiu
then
  echo "Es un link"

elif [ -d $fitx ]
then
  echo "Es un directori"

elif [ -f $fitx ]
then
  echo "Es un regular file"
  
else
  echo "$1 no és ni link, ni dir, ni regular file, és un altre tipus de fitxer" 
fi

exit 0  # si anem movem el exit podem anar provant bloc per bloc

