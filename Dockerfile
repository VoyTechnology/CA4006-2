FROM tomcat:9-jre8-alpine

ADD out/assignment2.war /usr/local/tomcat/webapps/

EXPOSE 8080