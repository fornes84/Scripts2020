#! /bin/bash
# EXERCICIS Scripts 2019 del 21 al 24

#21 Fer una funció que rep un login..

function getHome(){

  login=$1
  home=$(egrep "^$login:" /etc/passwd | cut -d: -f6) 
  if [ -n "$home" ]
  then	  
    echo $home	  
    return 0
  else
    return 1
  fi    
}

# 22 Fer una funcio

function getHoleList(){  	
  ERR_ARG=1	
  ERR_LOG=2
  status=0

  if [ $# -lt 1 ]
  then
     echo "Nº argument no valid"
     echo "Usage: $0 login [login]"
     return $ERR_ARG
  fi 
  for login in $*
  do    	
    getHome $login    
    if [ $? -ne 0 ]
    then
      status=$ERR_LOG		
    fi	
  done
	
  return $status
}



# 23 
# Donat un Homedir mostra la ociupacio en bytes del directori

function getSize(){

  homeDir=$1
  if [ -d $homeDir ] 
  then	  
    du -b -c $homeDir | cut -f1 | tail -1
    if [ $? -eq 0 ]
    then	    
      return 0
    fi  
  else
    return 2
  fi
 
}
