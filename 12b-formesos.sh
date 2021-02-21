# ! /bin/bash

#
#
#
#
# prog mesos[..]

# aixo vol dir que com a minim tindra 1 argument o els  ][ volen dir més argumetns opcionals

# rep 1 o més argument+
# per cada nota de 0 a 10
# per cada nota dir si es suspes, aprovat, notable, excelent.

# 1er BLOC) validar numero d'arguments

if [ $# -le 0 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 mes[..]"
  exit $ERR_NARGS
fi

# 2n BLOC) amb 2 sub_blocs --> Validar cada mes introduit, i donar resultat escrit 

for element in $*
do
	#XIXA
	mes=$element
	if ! [ $mes -ge 1 -a $mes -le 12 ]
	then
		echo "Error: valor $mes no vàlid, els mesos prenen valors [1,12]" >> /dev/stderr
  		#exit $ERR_VALOR  ES RECUPERAABLE !

	else	
	case $mes in
		"2")
			dies=28;;
		"4"|"6"|"8"|"10"|"12")
			dies=30;;
		"1"|"3"|"5"|"7"|"9"|"11")
			dies=31;;
	
	esac
	echo $dies
	fi
done
exit 0  
	
