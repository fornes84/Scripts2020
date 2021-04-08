#! /bin/bash
# Exemles



function creaEscola(){


  for classe in $*
  do
	creaClasse $classe
	echo "FI"
  done

}



function creaClasse(){

  #agument nom de la classe
  #PASSWD="pass_alum"
  llista_noms=$(echo $classe{01..02})
  
  for user in $llista_noms
  do
    echo useradd $user # primer provar amb echo !!! per no tenir que borrar els usuaris si no va bé
    #echo "Pass_alum" | passwd --stdin $user &> /dev/null # aqui els hi assignem per defecte un passwd a tots
    echo "$user:$PASSDWD" | chpasswd #<---ALTEERNATIVA tot i ue esta diseñat realment per fer: chpasswd < file_users
  done





}




function showAllGroup(){

	llista_gids=$(cut -d: -f4 /etc/passwd | sort -nu)
	MIN_USU=2

	for gid in $llista_gids
	do	
	  

	  gname=$(grep "^[]*:[]*:gid:" /etc/group | cut -d: -f1)
	  cont=$(grep "^[^:]*:[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | wc -l) 
	  echo "$gname($gid):$cont"
	  
	  if [ $cont -ge $MIN_USU ] # AIXO TE QUE ANAR ADALT PQ NOMES MOSTRAREM CAPÇALERA SI HI HA DADES, CLAR (I EL FI AL FINAL) !
	    then		 
	    egrep "^[^:]*:[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | sort | cut -d: -f1,3,7 | sed -r 's/(^.*$)/\t\1/'
	  fi

	done

return 0
}
