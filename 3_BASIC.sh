ERR_NOARG=1
valor=$1

if  [ $# -ne 1 ]
then
  echo "Error: Nº parametres incorrectes"
  echo "Usage: $0 arg1 "
  exit $ERR_NOARG
fi

num=1
while [ $num -le $valor ]
do
  echo "$num"
  ((num++))
done
exit 0
