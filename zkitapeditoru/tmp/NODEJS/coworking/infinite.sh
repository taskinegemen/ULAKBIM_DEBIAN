#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATHOFFILE=`echo $DIR/cowork.js`

PATHTONODE="node";
if [ -f /usr/bin/node ]; then
	PATHTONODE="/usr/bin/node"
elif [ -f /usr/local/bin/node ]; then
        PATHTONODE="/usr/local/bin/node"
fi
  
#PATHTONODE=`which node`
trap "echo Booh!" SIGINT SIGTERM
while :
do
	$PATHTONODE $PATHOFFILE
	sleep 1
done
