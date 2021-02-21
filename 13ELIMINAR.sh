#! /bin/bash
#
#
#3) Mostrar els arguments

while [ $# -gt 0 ]
do
	echo "$#: $*"  # mostra numero darguments i els arguments en si
	shift # desplaça a lesquerra ( que passa? va desapareixent arguments)
done	# el shift saplica als paramet dentrada, i cada shift desplaça a la dret#a eliminatn els que es van passant i desplaçant els demes ???

# es interesant dexecutar i veure
exit 0


