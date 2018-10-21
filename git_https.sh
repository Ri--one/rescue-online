#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)
BRANCH=$1
MESSAGE=$2
PASSWORD=$4
USERNAME=$3
cd $DIR

#git branch $BRANCH
#git checkout $BRANCH
git add *
git commit -m $MESSAGE

expect -c　-d "
set timeout 5
spawn git push origin $BRANCH
    expect -nocase \"Username\" {
	send \"${USERNAME}\n\"
	expect -nocase \"Password\" {
	    send \"${PASSWORD}\n\"
	    spawn sleep 3
	    spawn echo \"exit\"
        }
    }
"

