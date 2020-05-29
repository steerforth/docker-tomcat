FROM hub.c.163.com/public/centos:7.2-tools

MAINTAINER steerforth "565355716@qq.com"

#安装jdk
ADD jdk-8u181-linux-x64.tar.gz /usr/local/java
ENV JAVA_HOME=/usr/local/java/jdk1.8.0_181
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

#安装tomcat
ADD apache-tomcat-8.5.34.tar.gz /usr/local/tomcat
RUN chmod +x /usr/local/tomcat/apache-tomcat-8.5.34/bin/*.sh
ENV CATALINA_HOME=/usr/local/tomcat/apache-tomcat-8.5.34

COPY tomcat.conf /etc/supervisor/conf.d/

ENTRYPOINT ["/usr/bin/supervisord"]
