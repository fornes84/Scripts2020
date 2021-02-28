#! /bin/bash
# @edt ASIX M01-ISO Curs 2018-2019
# prog [ -a -b- -c- -d- -e] arg[...]
# separar en dues llistes args i opcions
# ------------------------------------------
ERR_ARGS=1
if [ $# -eq 0 ]; then
  echo "ERROR: numero args incorrecte"
  echo "usage: $0 [-a -b -c -d -e -f] arg[...]"
  exit $ERR_ARGS
fi
opcions=""
arguments=""
for arg in $*
do
  case $arg in
  "-a"|"-b"|"-c"|"-d"|"-e"|"-f")
      opcions="$opcions $arg";;
  *)
      arguments="$arguments $arg";;
  esac
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"



