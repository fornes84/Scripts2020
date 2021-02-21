#! /bin/bash
#
#

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
	echo $num
	((num++))
done
exit 0


# 2) MOSTRAR de n a 0 countdownd

n=10

while [ $n -le 0 ]
do
        echo $n     #academicament es millor així, mostrar i decrementar
        ((n--))
done
exit 0

# o bé



