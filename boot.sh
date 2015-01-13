#!/bin/bash

git config -f $GERRIT_HOME/etc/gerrit.config ldap.server ldap://$LDAP_PORT_389_TCP_ADDR 
git config -f $GERRIT_HOME/etc/gerrit.config gerrit.canonicalWebUrl $GERRIT_CANONICAL_WEB_URL 

$GERRIT_HOME/bin/gerrit.sh start

if [ $? -eq 0 ] 
then
    echo "Gerrit $GERRIT_VERSION is started successfully."
	echo ""
	tail -f $GERRIT_HOME/logs/httpd_log
else
    cat $GERRIT_HOME/logs/error_log
fi 
