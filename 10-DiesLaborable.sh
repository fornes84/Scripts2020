#! /bin/bash
# @edt ASIC 20-21
# Dir si es laborable o no el dia introduit
#------------------------------------

# BLOC1

ERRARG=1

if [ $# -ne 1 ]
then
	echo "Error nº argumetns erroni"
        echo "Usage: $0 mes"
	exit $ERRARG	
fi

# BLOC2

#volem saber si es laborable o festiu ################################


case $1 in

	"dl"|"dt"|"dc"|"dj"|"dv")
		echo "es laboable";;
	"ds"|"dm")
		echo "es festiu";;
	*)
		echo "es altre cosa"
esac	

exit 0


