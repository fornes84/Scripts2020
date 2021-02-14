#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# Identificar quin tipus d'arxiu es un arxiu donat
#   -validar Earg, Validar si directori, llistar
#   $ prog direct
# -----------------------
ERR_NARGS=1
ERR_NARX=2

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

if [ -L $fitx ] # important l'ordre ja que un link es tmb un tipus de dir
then
  echo "Es un link"
  exit 0

elif [ -d $fitx ]
then
  echo "Es un directori"
  exit 0

elif [ -f $fitx ]
then
  echo "Es un regular file"
  exit 0
  
else
  echo "$1 no és ni link, ni dir, ni regular file, és un altre tipus de fitxer" 
  exit 0
fi

exit 0  # si anem movem el exit podem anar provant bloc per bloc

