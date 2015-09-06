#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="MyTestApp"
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`
case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi
    : ADD START ACTIONS HERE
    /opt/bin/python2.6 ${QPKG_ROOT}/web/MyTestApp.py
    ;;

  stop)
    : ADD STOP ACTIONS HERE
    #kill -9 `ps ax | grep 'MyTestApp.py' | grep -v grep | awk ' { print $1;}'`
    kill `cat /var/run/MyTestApp.pid`
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
