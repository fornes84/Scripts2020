#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# Llistar un directori donat
#   -validar Earg, Validar si directori, llistar
#   $ prog nota
# -----------------------
ERR_NARGS=1
ERR_VALOR=2

# 1) Validem arguments
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 falta argument directori"
  exit $ERR_NARGS
fi

# 2) Validar si es directori
dir=$1
if ! [ -d $dir  ] # valida si l'argument es directori
then
  echo "Error: no es un directori o no es directori valid"
  echo "ha de ser tipus: /dir1/dir2... o ~ o / "
  exit $ERR_VALOR
 # 3) XIXA
else
  echo "Cert"	
  ls -l $dir
fi

exit 0




