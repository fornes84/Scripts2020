# ! /bin/bash

# Example funcions

#validar rep 1 arg
#validar si existeix usuari
#mostrar camp a camp

showuser(){

if $# -ne 1 
then
  echo "Error, nº arguments erronis"
  echo "Usage"
  return 1
fi

usuari=$1

egrep "^$usuari:" /etc/passwd
if $? -ne 0
then
  echo "Error, usuari $usuari no existeix"
  return 2
else
   egrep "^$usuari:*" | cut -d: -f2

fi

  




}
