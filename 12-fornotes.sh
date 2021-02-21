# ! /bin/bash

#
#
#
#
# prog notes[..]

# aixo vol dir que com a minim tindra 1 argument o els  ][ volen dir més argumetns opcionals

# rep 1 o més argument+
# per cada nota de 0 a 10
# per cada nota dir si es suspes, aprovat, notable, excelent.

# 1er BLOC) validar numero d'arguments

if [ $# -le 0 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 nota[..]"
  exit $ERR_NARGS
fi

# 2n BLOC) amb 2 sub_blocs --> Validar cada nota introduida, i donar resultat escrit 

for element in $*
do
	#XIXA
	nota=$element
	if ! [ $nota -ge 0 -a $nota -le 10 ]
	then
		echo "Error: nota $nota  no vàlida, pren valors [0,10]" >> /dev/stderr
		#echo "nota pren valors [0,10]"
  		#exit $ERR_VALOR

	elif [ $nota -lt 5 ]
	then
 		echo "Suspès"
	elif [ $nota -lt 7 ]
	then
  		echo "Aprovat"
	elif [ $nota -lt 9 ]
	then
  		echo "Notable"
	else
  		echo "Excel·lent"
	fi

done
exit 0
	
