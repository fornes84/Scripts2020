# ! /bin/bash

# Exercicis funcions
# recordar a cada modificació executar bash $0


# Exercici 1

function showuser(){

  if [ $# -ne 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    return 1
  fi

  usuari=$1
  fields=''

  fila=$(egrep "^$usuari:" /etc/passwd) 

  if [ $? -ne 0 ]
  then
    echo "Error, usuari $usuari no existeix"
    return 2
  fi

  login=$(echo "$fila" | cut -d: -f1)
  uid=$(echo $fila | cut -d: -f3)
  gid=$(echo $fila | cut -d: -f4)
  home=$(echo $fila | cut -d: -f6)
  shell=$(echo $fila | cut -d: -f7)

  
  echo "nom:$login"
  echo "udi:$uid"
  echo "gid:$gid"
  echo "home:$home"
  echo "shell:$shell"

  return 0
  
}


#showuser marc

# Exercici 2

function showUserGecos(){
	
   if [ $# -ne 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    return 1
  fi

  usuari=$1

  fila=$(egrep "^$usuari:" /etc/passwd)

  if [ $? -ne 0 ]
  then
    echo "Error, usuari $usuari no existeix"
    return 2
  fi

  gecos=$(echo "$fila" | cut -d: -f5)

  nom=$(echo $gecos | cut -d, -f1)
  lloc=$(echo $gecos | cut -d, -f2)
  tel=$(echo $gecos | cut -d, -f3)
  tel_h=$(echo $gecos | cut -d, -f4)
  extra=$(echo $gecos | cut -d, -f5)

  echo "nom:$nom"
  echo "lloc:$lloc" 
  echo "tel:$tel"
  echo "tel_casa:$tel_h"
  echo "extra:$extra"

  return 0

}

# showUserGecos marc

# 3

function showUserGroup(){

  if [ $# -ne 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    return 1
  fi

  gname=$1

  fila=$(egrep "^$gname:" /etc/group)

  if [ $? -ne 0 ]
  then
    echo "Error, nom de grup $gname no existeix"
    return 2
  fi


  pass=$(echo $fila | cut -d: -f2)
  gid=$(echo $fila | cut -d: -f3)
  users=$(echo $fila | cut -d: -f4)

  echo "Gname:$gname"
  echo "Gid:$gid"
  echo "usuaris del grup:$users"
  return 0
}

#showUserGroup marc

# 4

function showUser_Group(){

  if [ $# -ne 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    return 1
  fi

  usuari=$1

  fila=$(egrep "^$usuari:" /etc/passwd)

  if [ $? -ne 0 ]
  then
    echo "Error, usuari $usuari no existeix"
    return 2
  fi

  uid=$(echo $fila | cut -d: -f3)
  gid=$(echo $fila | cut -d: -f4)
  home=$(echo $fila | cut -d: -f6)
  shell=$(echo $fila | cut -d: -f7)

  gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)

  echo "nom:$usuari"
  echo "udi:$uid"
  echo "gid:$gid"
  echo "gname:$gname"
  echo "home:$home"
  echo "shell:$shell"

  return 0

}

#showUser_Group marc

#5

function showUserList(){
 
  if [ $# -lt 1 ]
  then
    echo "Error, nº arguments erronis"
    echo "Usage"
    exit 1
  fi
  
  OK=0

  for login in $*
  do
     fila=$(egrep "^$login:" /etc/passwd)
     if [ $? -ne 0 ]
     then
       echo "Error, usuari $usuari no existeix" >> /tmp/stderr
       OK=2
       #return 2
     else

     uid=$(echo $fila | cut -d: -f3)
     gid=$(echo $fila | cut -d: -f4)
     home=$(echo $fila | cut -d: -f6)
     shell=$(echo $fila | cut -d: -f7)
     gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
    
     echo "nom:$login"
     echo "uid:$uid"
     echo "gid:$gid"
     echo "gname:$gname"
     echo "home:$home"
     echo "shell:$shell"
     fi   
  done

  return $OK
  
}

#showUserList marc pere anna isx43457008

# 6

function showUserIn(){

while read -r login
do
     linea=$(egrep "^$login:" /etc/passwd)
     if [ $? -ne 0 ]
     then
       echo "Error, usuari $usuari no existeix" >> /tmp/stderr
       OK=2
       #return 2
     else
 
     uid=$(echo $linea | cut -d: -f3)
     gid=$(echo $linea | cut -d: -f4)
     home=$(echo $line | cut -d: -f6)
     shell=$(echo $linea | cut -d: -f7)
     gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)

     echo "nom:$usuari"
     echo "udi:$uid"
     echo "gid:$gid"
     echo "gname:$gname"
     echo "home:$home"
     echo "shell:$shell"   
     fi

done  

}

# 7
# DONAT UN GNAME...

#PISTA:

function shoWGroupMainMembers()

{

  ERR_ARG=1
  ERR_VAL=2

  if [ $# -ne 1 ]
  then
    echo "Error nº arguments erroni"
    echo "usage $0 gname"
    exit $ERR_ARG
  fi

  gname=$1

  lineaGRP=$(egrep "^$gname" /etc/group)
  
  if [ $? -eq 0 ]
  then
    gid=$(echo $lineaGRP | cut -d: -f3) 

    lineaPASS=$(egrep ^[^:]*:[^:]*:[^:]*:$gid: /etc/passwd) 	  
    login=$(echo $lineaPASS | cut -f1)
    uid=$(echo $lineaPASS | cut -f3)
    dir=$(echo $lineaPASS | cut -f6)
    shell=$(echo $lineaPASS | cut -f7)

  else
    echo "Error, el nom del grup $1 no existeix"
    exit $ERR_VAL	  
  fi
}

shoWGroupMainMembers marc
