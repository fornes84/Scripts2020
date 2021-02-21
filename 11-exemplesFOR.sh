# ! /bin/bash/
#


#6)#Llistar numerats tots els loggins


llista=$(cut -d: -f1 /etc/passwd)
cont=1

for element in $llista
do
        echo "$element: $cont"
        ((cont++))
done
exit 0

#5) llistar noms di actiu numerats

llista=$(ls)
cont=1

for element in $llista
do
        echo "$element: $cont"
	((cont++))
done
exit 0


#4 Que surti cada argument numerant cada linea

contador=0

for arg in $*          
do
	contador=$((contador+1))
        echo "$arg : $contador"
done
exit 0

#3 Iterar per la llista de noms de fitxers que genera ls en el directori actiu

#Llista=$(ls)
for element in $llista
do
	echo $element
done
exit 0



# 2 bis) 
# tot i estar encapslat s'exandira igual !!!! $* i $@ són diferents !!!!!!!!!!
for arg in "$@"
do
	echo $arg
done
exit 0


# 2) iterar per cada argument rebut en el programa script

for arg in $*		# si encaspsulem "$*" i "$arg"  entendrà només un argument, per tant iterarà una sola vegada possant la parrafad, per tant iterarà una sola vegada possant la parrafadaa
do
	echo $arg
done





#for va in llista-de-valors
#do
	#accions
#done

# 1) Iterar una llista de noms

for nom in pere marta anna ramon
do
	echo $nom
done

# 1b) Sense cometes també funciona !

# 1c)
