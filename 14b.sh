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

# XIXA ARA VOLEM NUMERA CADA NOM DEL LLISTAT

num=1
llistaElements=$(ls $dir)

for element in $llistaElements  
do
  echo "$num: $element "
  (($num++))
done
	
exit 0
