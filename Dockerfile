FROM ubuntu

MAINTAINER harikrishnaa

#RUN mkdir /opt/

WORKDIR /opt/
RUN apt-get update
RUN apt-get install wget -y 
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.tar.gz
RUN tar -xzf apache-tomcat-8.5.75.tar.gz
RUN mv apache-tomcat-8.5.75/ /opt/tomcat/
RUN apt install openjdk-8-jdk -y
RUN java -version
RUN apt-get install git -y
WORKDIR /opt/
RUN git init
RUN git pull https://github.com/Harikrishnaa498/kick498.git
WORKDIR /opt/target/
RUN mv /opt/target/vprofile-v1.war /opt/tomcat/webapps/
WORKDIR /opt/tomcat/webapps/
#RUN rm -rf ROOT
#RUN mv /opt/tomcat/webapps/vprofile-v1 ROOT
RUN ls -ln

#WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
