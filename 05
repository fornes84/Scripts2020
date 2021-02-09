#! /bin/bash
# Mostrar si està aprovat suspès validar rep un argument i que la nota es valid
# SINOPSIS: PROG NOTA

# VALIDAR ARGUMENTS
if [ $# -ne 1 ]
then
  echo "error nº arguments no valid"
  echo "Usage: $0 nota"
  exit $ERR_NARGS  
fi

# VALIDAR ARGUMENT ENTRE 0 i 10

nota=$1

if ! [ $nota -ge 0 -a $nota -le 10 ]
then
	echo "Nota no valida"	
	echo "nota pren valors del [0,10]"
	exit $ERR_VALOR
fi

# XIXA
if [ $nota -lt 5 ]
then
  echo "suspès"
else
   echo "aprovat"	  
fi

exit 0
