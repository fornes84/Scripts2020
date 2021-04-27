#! /bin/bash

function exemple_llistar() {

  	 
  file=/dev/stdin # per defecte si no en passen res mes

  if [ -$# -eq 1  ]
  then
    file=$1
  fi

  while read -r line 
  do
    gid=$(echo $line | cut -d: -f4)	  
    if [ $gid -ge $MAX ] 
    then
      echo "$line"
    fi   
  done < $file

}

