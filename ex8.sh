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
  guarda='NoTrobat'
 
  for linea in $llista #OK
  do
    nom=$(echo "$linea" | cut -d: -f1) # OK
    
    if [ $element=$nom ]  # OK
    then
      guarda='Trobat'  
    fi
  done
 
  if [ $guarda='Trobat' ] #
  then
    echo "$element"
  else
     echo "$element no existeix a /etc/passwd" >> /dev/stderr
  fi
done

exit 0
