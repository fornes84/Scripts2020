#! /bin/bash
#
#



#4)
# DESPRËS DE LA 4 ITERACIO EL BUCLE ACAVARA
num=1

while [ -n "$1" ] # mentre diferent de 0

do
	echo "$num: $1, $#, $*"
	$((num++))
	shift
done
exit 0


#5) ara amb $#

while [ -gt $# ]
do
	#IDEM

done
exit 0


#6) EXEMPLE PROCESAR LA ENTRADA ESTANDAR, li podriem passar al script un text amb < text.txt
 
while read -r line # mentres hi hagi coses per llegir.. 
do
	echo $line
done
exit 0


#07) numerar cada linea , per probar

n=1
while read -r line
do
	echo "$n: $line"
	$((n++))
done
exit 0

# tail /etc/passwd | bash programa07.sh


#08) Idem amb FI

num=1
read -r line
while read -r line
do
	echo "$num:$line"
	read -r line
	((num++))

done

exit 0


# 09) NUMERAR  I PASSA A MASJUSCULA L'ENTRADA STD

n=1
while read -r line	
do
	
	echo"$num: $line" | tr '[a-z]' '[A-Z]'
	$((num++))
done
exit 0

#10 SI VOLGUESIM VEURE ELS 60 PRIMERS CARACTERS --> cut -c 
#11	SI VOLGUESIM VEURE LINES QUE COMPLEIXIN --> GREP













#3) Mostrar els arguments

while [ $# -gt 0 ]
do
	echo "$#: $*"  # mostra numero darguments i els arguments en si
	shift # desplaça a lesquerra ( que passa? va desapareixent arguments)
done	# el shift saplica a ???

# es interesant dexecutar i veure
exit 0



# 1) Mostra numero del 1 al 10
# Haurà de ser algo així:

# while [ cond ]
# do
# 	accions
# done



num=1
MAXIM=10

while [ $num -le $MAXIM ]
do
	echo $num  # mostra del 1 al 10
	((num++))
done
exit 0




# 2) MOSTRAR de n a 0 countdownd

n=10
MIN=0

while [ $num -ge $MIN ]
do
        echo $num ,     #academicament es millor així, mostrar i decrementar
        ((n--))
done
exit 0

# MOSTRA ARGUMENTS -n >> not null -z >> es zero

while [ -n "$1" ]  # mentres l'argumetn 1 sigui diferent de null
do
	echo "$1 $#: $*"  # mostra argument pos1, total arguments i arguments (els que hi hagi)
	shift # desplaça esquerra
done
exit 0

# ULL: FOR ES EL MECANISME PREFERIT PER RECORRE ""TOTA"" LA LLISTA D?ARGUMENTS 

# L ESTRUCTIURA WHILE+SHIFT VAL LA PENA QUAN VOLGUEM SALTAR ALGUN ARGUMENT : SHIFT i després SHIFT

EXEMPLE


# prog --f file.txt 15 # aqui potser podria valer la pena només agafar el 15


