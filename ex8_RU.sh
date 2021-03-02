# ! /bin/bash
# EdT 20-21 Sistemas Operatius
# Programa nº8: programa que rep com a arguments un o mes noms d'usuari i els mostra per pantalla. En cas de no exsistir per stderr


ERR_ARG=1

if [ $# -lt 1 ]
then
  echo "Error, nº arguments erroni, mínim 1"
  echo "Usage: $0 nom [nom]"
  exit $ERR_ARG
fi

llista=$(cat /etc/passwd) # OK

for element in $*
do
  guarda='No'
  for linea in $llista #OK
  do
    if $element = echo "$linea" | egrep '^[^:]*': # EL echo es OK
    then
      if [ echo $? -eq 0 ]  
      then
        echo "$element"
      else
        echo "$element no existeix a /etc/passwd" >> /dev/stderr
      fi
    fi  
  done
done

exit 0
