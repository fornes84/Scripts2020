#! /bin/bash
# EdT 2020-21 ISIX1 Marc Fornés
#fsize
#Donat un login com arg, calcular amb du l'ocupació del home de l'usuari. Cal obtenir el home del /etc/passwd.


function fsize(){
  Err_narg=1

  if [ $# -ne 1 ]
  then
	echo "Error nº arguments erroni"
	echo "Usage: $0 login"
	return $Err_narg
  fi

  login=$1
  home=$(egrep "^$login:" /etc/passwd | cut -d: -f6)
  du -h -s  $home

  return 0  
}

function loginargs() {
  
  Err_narg=1
  status=0

  if [ $# -lt 1 ]
  then
        echo "Error nº arguments erroni"
        echo "Usage: $0 login [login]"
        return $Err_narg
  fi

  for login in $*
  do
    egrep "^$login:" /etc/passwd > /dev/null 
    if [ $? -ne 0 ]
    then
       echo "El login $login no existeix" >> /dev/stderr
       status=1
    else
	fsize $login
    fi

  done	  

  return $status

}

function loginfile(){

  Err_narg=1
  Err_tipus=2
  status=0

  if [ $# -ne 1 ]
  then
        echo "Error nº arguments erroni"
        echo "Usage: $0 login"
        return $Err_narg
  fi

  file=$1

  if ! [ -f "$file" ]
  then
    echo "Error tipus argument no valid"
    echo "Usage: $0 file"
    return $Err_tipus
  fi

  while read -r linea
  do
    fsize $linea

  done < $file

  return $status
}


function loginboth(){
  
  Err_tipus=2
  file=/dev/stdin

  if [ $# -eq 1 ]
  then
    file=$1
    if ! [ -f "$file" ]
    then
      echo "Error tipus argument no valid"
      echo "Usage: $0 file"
      return $Err_tipus
    fi
  fi

  while read -r login
  do
    loginargs $login
  done < $file
}


function fstype(){
  
  fstypE=$1
  egrep -v "^#|^$" /etc/fstab | tr -s '[[:blank:]]' ' '| egrep "^[^ ]* [^ ]* $fstypE "| cut -d' ' -f1,2
  return 0 
}

function allfstype(){

  llista_fstype=$(egrep -v "^#|^$" /etc/fstab | tr -s '[[:blank:]]' ' '| cut -d' ' -f3 | sort -u)
  
  for fs in $llista_fstype
  do
    echo "$fs :"	  
    infoFstab=$(fstype $fs | tr ' ' '\t')
    echo -e "\t $infoFstab" 
  done

  return 0

}


