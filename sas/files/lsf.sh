#!/bin/bash

check_jfd_lsf () {
ps -ef | grep -v grep | grep -i jfd > /dev/null

 if [ $? -ne 0 ]
  then

   echo "Jfd process is not running"
   exit 1

  else

   ps -ef | grep -v grep | grep -i jfd

 fi

 bhosts | grep ok > /dev/null
 if [ $? -ne 0 ]
  then

   echo "LSF process is not running"
   exit 1

  else

   bhosts

 fi
}

stop () {

. /sasbin/Platform_Suite/lsf/conf/profile.lsf
. /sasbin/Platform_Suite/pm/conf/profile.js
/sasbin/Platform_Suite/pm/jadminStop.sh
lsadmin resshutdown
badmin hshutdown
lsadmin limshutdown 
}

start () {

. /sasbin/Platform_Suite/lsf/conf/profile.lsf
. /sasbin/Platform_Suite/pm/conf/profile.js
lsadmin limstartup
badmin hstartup
lsadmin resstartup
/sasbin/Platform_Suite/pm/jadminStart.sh


sleep 20

check_jfd_lsf
}

case "$1" in 
        start)
                start
                ;;
        stop)
                stop
                ;;
        *)
esac        

