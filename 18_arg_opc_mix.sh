#! /bin/bash
# @edt ASIX M01-ISO Curs 2018-2019
# prog -e dat -p -n nom arg[...]
# separar en dues llistes args i opcions (que estan mesclats)
# ------------------------------------------
ERR_ARGS=1
if [ $# -le 1 ]; then
  echo "ERROR: numero args incorrecte"
  echo "usage: prog -e dat -p -n nom arg[...]"
  exit $ERR_ARGS
fi
opcions=""
arguments=""

while [ $# -gt 0 ] 
do
  case $1 in
  -[a-z|A-Z]) 
      opcions="$opcions $1"
      shift
      if [ $1 ^[^-]*  ]
      then
        opcions="$opcions $1"
      fi;;
  *)
      arguments="$arguments $1";;
      shift
  esac
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"

