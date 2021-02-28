#! /bin/bash

num=1

for element in $* 
       	# mentres hi hagi..
do
  echo "$num : $element"
  ((num++))
done

exit 0
