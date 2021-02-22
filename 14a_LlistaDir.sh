#! /bin/bash

#

# Entra un directori com a argument

# exs arg

# exs dir

# fer ls del directori

if [ $# -ne 1 ]
then
	echo "Error: nº arguments insuficients"
	echo "Usage $0: arg1"
	exit $ERRASGS
fi

dir=$1

if !  [ -d $dir ]
then
  echo "Error: $1 no es un directori o no exsisteix"
  echo "Usage $0: dir"
fi

# XIXA

ls  $dir

exit 0
