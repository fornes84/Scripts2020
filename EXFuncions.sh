# ! /bin/bash

# Exercicis funcions
# recoradr a cada modificació executar bash $0

#validar rep 1 arg
#validar si existeix usuari
#mostrar camp a camp

function showuser(){

  if [ $# -ne 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    return 1
  fi

  usuari=$1
  fields=''

  egrep "^$usuari:" /etc/passwd > /dev/null 

  if [ $? -ne 0 ]
  then
    echo "Error, usuari $usuari no existeix"
    return 2
  else
    login=$(egrep "^$usuari:" /etc/passwd | cut -d: -f1)	
    for i in 3 4 5 6 7
    do
      fields="$fields:$(egrep "^$usuari:" /etc/passwd | cut -d: -f$i)" 
    done
    echo "$login$fields"
    return 0
  fi
}
