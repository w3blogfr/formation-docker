#!/bin/sh

MANAGER_USERNAME=${MANAGER_USERNAME:-admin}
MANAGER_PASSWORD=${MANAGER_PASSWORD:-admin}
echo "========================================"
echo ""
echo " MANAGER_USERNAME     ${MANAGER_USERNAME}"
echo " MANAGER_PASSWORD 	${MANAGER_PASSWORD}"
echo ""
echo "========================================"

#Add users for manager
cat > /usr/local/tomcat/conf/tomcat-users.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users>
	<role rolename="manager-gui"/>
	<role rolename="admin-gui"/>
	<role rolename="manager-status"/>
	<user username="${MANAGER_USERNAME}" password="${MANAGER_PASSWORD}" roles="manager-gui,admin-gui,manager-status"/>
</tomcat-users>
EOF

#allow manager for remote access and not only localhost
cat > /usr/local/tomcat/webapps/manager/META-INF/context.xml <<EOF
<Context antiResourceLocking="false" privileged="true" >
  <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
EOF

echo "Start TOMCAT"
catalina.sh run