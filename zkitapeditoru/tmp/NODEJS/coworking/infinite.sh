#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATHOFFILE=`echo $DIR/cowork.js`  
PATHTONODE=`which node`
trap "echo Booh!" SIGINT SIGTERM
while :
do
	$PATHTONODE $PATHOFFILE
	sleep 1
done
