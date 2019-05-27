FROM openjdk:8

COPY target/hello-jenkinspipelines-1.0-SNAPSHOT.jar /opt/application/hello-jenkinspipelines.jar

WORKDIR /opt/application

EXPOSE 8080

CMD java -jar hello-jenkinspipelines.jar