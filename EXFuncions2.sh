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
    return 1
  fi
  
  OK=0

  for login in $*
  do
     usuari=$login
     fila=$(egrep "^$usuari:" /etc/passwd)

     if [ $? -ne 0 ]
     then
       echo "Error, usuari $usuari no existeix" >> /tmp/stderr
       OK=2
       #return 2
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
     echo " "   
  done

  if [ $OK -ne 2 ]
  then
    return 0

  else
    return 2
  fi
}

#showUserList marc root pere


# 6
function showUserIn(){

  while read -r login
  do
  
  fila=$(egrep "^$login:" /etc/passwd)
  if [ $? -ne 0 ]
  then
    echo "Login usuari $login no trobat ! adeu !"
    return 0
  fi
  
  uid=$(echo $fila | cut -d: -f3)
  gid=$(echo $fila | cut -d: -f4)
  home=$(echo $fila | cut -d: -f6)
  shell=$(echo $fila | cut -d: -f7)

  gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)

  
  echo "user:$login"
  echo "uid:$uid"
  echo "gid:$gid"
  echo "gname:$gname"
  echo "home:$home"
  echo "shell:$shell"
  echo " "

  done	  

return 0
}

#showUserIn


# 7

function showGroupMainMembers(){
  
  ERR_NARG=1

  if [ $# -ne 1 ]
  then
    echo "Nº arguments tipus gname erronu"
    echo "Usage: $0 gname"
    return $ERR_NARG
  fi	  
  
  gname=$1

  filaGroup=$(egrep "^$gname:" /etc/group)
  
  if [ $? -ne 0 ]
  then
    echo "No existeix el nom de grup $gname. Sortint"
    return 0	    
  fi

  gid=$(echo $filaGroup | cut -d: -f3)
 
  #això pot retornar més d'un fila..
  echo "Usuaris i caract. del grup $gname:"
  egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7

  return 0
}

#showGroupMainMembers anna

#8 

function showGroupMainMembersPRO(){
  
  ERR_NARG=1
  if [ $# -ne 1 ]
  then
    echo "Nº arguments tipus gname erronu"
    echo "Usage: $0 gname"
    return $ERR_NARG
  fi

  gname=$1

  filaGroup=$(egrep "^$gname:" /etc/group)

  if [ $? -ne 0 ]
  then
    echo "No existeix el nom de grup $gname. Sortint"
    return 0
  fi

  gid=$(echo $filaGroup | cut -d: -f3)

  #això pot retornar més d'un fila..
  echo "Usuaris i caract. del grup $gname:"
  egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7 | tr ':' '\t'
  egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7 | sed -r 's /^([^:]*):([^:]*):([^:]*):([^:]*):.*$/(/1)  (/2)  (/3)  (/4)/' 
  #egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7 | sort -t: -k1,1 |
  #egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7 | sort -t: -k2,2 -r |  | tr '[a-z]' '[A-Z]' 


  return 0
}

#showGroupMainMembersPRO anna


#9. 

function showAllGroupMainMembers(){

  llistaG=$(sort -t: -k1,1 -u /etc/group)

  for linea in $llistaG:
  do
	echo  "Gname:"
	echo -e "   $linea" | cut -d: -f1
	echo "Usuaris d'aquest gname:"
	gid=$(echo $linea | cut -d: -f3)
	echo -e "  " "$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1 | sort)"
	echo " "

  done	  
 
  return 0

}

#showAllGroupMainMembers



# 10.
function showAllShells(){


  llistaP=$(cut -d: -f7 /etc/passwd | sort -u) 

  for row in $llistaP
  do
   	  
    numUsu=$(egrep "^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$row" /etc/passwd | wc -l)
    if [ $? -eq 0 ]
    then	    
      echo "El shell $row, té $numUsu usuari/s, i són els següents:"
    else
      echo "Cap usuari trobat per al shell $row"
    fi
    egrep "^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$row" /etc/passwd | sort -t: -k3,3n | cut -d: -f1 | sed -r 's/^(.*)$/\t\1/'  
  done

  return 0	
}

#showAllShells

#11.
function showAllGroupMainMembers2(){

#Fer una nova versió de showAllGroupMembers on per cada grup es llisti una
#capçalera amb el nom del grup i la quantitat d’usuaris que tenen aquest grup com
#a grup principal. Per a cada grup llavors es llisten les línies de detall dels usuaris
#que hi pertanyem, per ordre de login, mostrant login, uid, home i shell.

  llistaG=$(sort -t: -k1,1 -u /etc/group)

  for linea in $llistaG:
  do
        echo  "Gname:"
        echo "$linea" | cut -d: -f1
	gid=$(echo $linea | cut -d: -f3)
	num=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | wc -l)
        echo "Amb un total de $num usuari/s seguënts:"
	echo -e "\t" "LOGIN" "\t" "UID" "\t" "HOME" "\t" "SHELL"
	echo -e "\t" "$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,6,7 | sort -t: -k1,1 | tr ':' '\t')"
        echo " "

  done

  return 0


return 0
}

#showAllGroupMainMembers2

#12.
showAllShells2 (){
 
  llistaP=$(cut -d: -f7 /etc/passwd | sort -u)

  for row in $llistaP
  do

    numUsu=$(egrep "^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$row" /etc/passwd | wc -l)
    if [ $? -eq 0 ]
    then
      if [ $numUsu -ge 2 ]
      then	
        echo "El shell $row, té $numUsu usuari/s, i són els següents:"
	egrep "^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$row" /etc/passwd | sort -t: -k3,3n | cut -d: -f1 | sed -r 's/^(.*)$/\t\1/'
      fi
    else
      echo "Cap usuari trobat per al shell $row" >> /etc/stderr
    fi
  done

  return 0


}

#showAllShells2


#13.14.15
function numStdin(){

#15.numStdin [file]
#Numerar línies d’un file rebut com a argument o de stdin si no s’ha indicat cap
#argument. Si s’ha rebut un argument validar que sigui un regular file que
#existeixi. Cal validar el número d’arguments rebuts (cap o un).
#Recomanació, establiu sempre incondicionalment com a valor per defecte a
#processar stdin i modifiqueu-lo al fitxer rebut únicament si s’ha passat un
#argument.

ERR_NARG=1
ERR_ARG=2
cont=1

  if [ $# -gt 1 ]
  then
    echo "Num regular files incorrecte"
    echo "Usage: $0 [regularfile]"
    return $ERR_NARG
  fi

  if [ $# -eq 0 ]
  then
    while read -r linea
    do
      echo "$cont      $linea"
      cont=$(($cont+1))
    done
  fi
	  
  if ! [ -f $1 ] 
  then
    echo "L'argument $1 no es un regular file"
    echo "Usage: $0 [regularfile]"
    return $ERR_ARG
  fi
  ruta=$(pwd)
  fitxer=$(echo "$ruta/$1")

  egrep -n "^.*$" $fitxer 

return 0

}

numStdin carta.txt
#numStdin < carta2.txt


#16.
function filterGid(){







}

filterGid
