#! /bin/bash
# @edt ASIC 20-21
#Exemples case + ex 10, dir quans dies té el mes introduit
#------------------------------------

# BLOC1

ERRARG=1
ERRVAL=2

if [ $# -ne 1 ]
then
	echo "Error nº argumetns erroni"
        echo "Usage: $0 mes"
	exit $ERRARG	
fi


# BLOC2

mes=$1

if ! [ $mes -ge 1 -a $mes -le 12  ]
then	
	echo "Error: Argument no valid, ha de ser un numero entre 1 i 12"
	echo "Usage: $ mes (valor del 1 al 12)"
	exit $ERRVAL

fi


# BLOC3

mes=$1

case $mes in

	[13579])
		dies = 30;;
	"4"|"6"|"8"|"10"|"12")
		dies = 31;;
	*)
		dies = 28;;
	
esac

echo "Té ",$dies,"dies"

exit 0


#volem saber si es laborable o festiu ################################


case $1 in
	"dm"|"dt"|"dc"|"dj"|"dv")
		echo "es laboable";;
	"ds"|"dj")
		echo "es festiu";;
	*)
		echo "es altre cosa"
esac	

exit 0




# vocal o consonant #####################################################

case $1 in
	[aeiou])
		echo "és una vocal";;
	
	[bcdfghjklmnpqrstvwxyz])
		echo "és una consonant";;
	*)
		echo "es altre" 

exit 0

###########################################################

case $1 in
	"pere" | "pau"| "joan")
		echo "es un nen";;
	"marta"|"anna"|"julia")
		echo "es una nena";;
	*)
		echo "indefinit"
esac

exit 0
