# ! /bin/bash
# EdT 20-21 Sistemas Operatius
# Programa que procesa opcions amb valor i arguments

opcions=''
args=''
file=''
min=''
max=''
while [ -n "$1"  ]
do
  case $1 in
    -[bce])
      opcions="$opcions $1";;
    -a)
	file=$2  
	shift;;
    -d)
	min=$2
	max=$3
	shift 
    	shift;;
       # fem 2 shifts per saltar els arg	
    *)
      args="$args $1";;	    
  esac
  shift
done
echo "Opcions: $opcions"
echo "Arguments: $args"
echo "File: $file"
echo "MAX: $max MIN: $min"
exit 0	
