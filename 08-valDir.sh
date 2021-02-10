#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# Llistar un directori donat
#   -validar Earg, Validar si directori, llistar
#   $ prog direct
# -----------------------
ERR_NARGS=1
ERR_NODIR=2

# 1) Validem arguments
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo " Usage: $0 dir"
  exit $ERR_NARGS
fi

# 2) Validar si es directori

dir=$1

#VALIDAR SI HELP

if [ $1 = "-h" ]
then
  echo "Help del prgrama"
  echo "edt"
  exit 0



if ! [ -d $dir ]  # en aquest cas el ! es podria posar dins valida si l'argument es directori
then
  echo "Error: $dir no es un directori"
  echo "Usage $0 dir" # recordem al usuari el mateix d'abans
  exit $ERR_NODIR
fi
 # 3) XIXA
	
ls -l $dir

exit 0  # si anem movem el exit podem anar provant bloc per bloc




