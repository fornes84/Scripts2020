#! /bin/bash
# SO. ISIX1  09/02/21
#
# Validar si hi ha exactament 2 arguments i mostrar-los

# Validació errors

if [ $# -ne 2 ]
then
  echo "Error numero arguments error"
  echo "Usage $0: arg1 arg2"
fi  
exit 1	

# XIXA

echo " Arguments correctes $1 i $2 "

exit 0
