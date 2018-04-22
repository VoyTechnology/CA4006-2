FROM tomcat:9-jre8-alpine

ADD /target/Assignment-2.war /usr/local/tomcat/webapps

EXPOSE 8080
