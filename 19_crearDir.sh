#Validar que existeixin 1 o més elements
#per tot crear-lo si es pot, crear-lo i mostrar a stdout si no mostrar a stdErr
# ordre mkdir no ha de generar sortida !!
# si el arg= tot bé, retorna un 0, si falla un(o mes) retorna un 2, si nº arg erroni, retorna un 1

#BLOC VALIDAR
#BLOC FOR, HEM DE ITERAR PER TOTS ELS ELEMENTS (TMB TINDRA)
# bash 19_crearDir.sh dir1 dir2 /patat/dir3 2> errorl.log per probar si s'envia a error realment

ERR_ARG=1
status=2

if [ $# -eq 0 ]
then
    echo"Error: Ha de tenir mínim un directori"
    echo"Usage: $0 noudir [noudir]"    
    exit $ERR_ARG
fi

for dir in $*
do
  mkdir -p $dir &>/dev/null
  # que no generi sortida la ordre(nosaltres si)
  if [ $? -eq 0 ]
  then	  
    echo "$dir"
  else
    echo "Error en crear: $dir" >> /dev/stderr
    status=2
  fi
done

exit $status 
# tecnica per retorn de error al final

# ULL, SI JA EXSISTEIX NO POT CREAR EL DIR, SI NO TÉ PERMISOS, TAMPOC..

