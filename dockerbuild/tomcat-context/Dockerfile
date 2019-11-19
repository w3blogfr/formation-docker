ARG TOMCAT_VERSION
FROM tomcat:${TOMCAT_VERSION}

#Install utils tools
RUN apt-get update && apt-get install -y git curl nano iputils-ping unzip && rm -rf /var/lib/apt/lists/*

#Configuration des logs
ADD assets/run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh"]
