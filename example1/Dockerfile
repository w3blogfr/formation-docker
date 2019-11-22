FROM ubuntu

MAINTAINER thibaut

# Install Java.
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget

# INSTALL TOMCAT
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz && \
   wget -qO- https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz.md5 | md5sum -c - && \
   tar zxf apache-tomcat-*.tar.gz && \
   rm apache-tomcat-*.tar.gz && \
   mv apache-tomcat* tomcat

RUN chmod +x /tomcat/bin/catalina.sh

EXPOSE 8080
CMD ["/tomcat/bin/catalina.sh","run"]
