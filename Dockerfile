FROM openjdk:8
#ADD target/spring-boot-maven-plugin spring-boot-maven-plugin.jar
#EXPOSE 8081
#ENTRYPOINT ["-java","-jar","spring-boot-maven-plugin.jar"]

VOLUME /tmp

ADD m2 m2
ADD app.jar app.jar
ADD thin.properties thin.properties

ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -jar app.jar --thin.root=/m2" ]

EXPOSE 8081
