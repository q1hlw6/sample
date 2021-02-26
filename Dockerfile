FROM tomcat:latest

COPY target/sample.war /usr/local/tomcat/webapps/ROOT.war
