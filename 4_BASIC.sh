#
# DIES MES
#
# :wq
#############################


ERR_NOARGS=1

if [ $# -le 0 ]
then
	echo "Error no argumetns correctes"
	echo "usage: $0 mes [..]"
	exit $ERR_NOARGS
fi


for element in $*
do
	case
		element -eq 2)
		dies=28;;
		element 

done

exit 0
