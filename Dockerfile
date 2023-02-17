# syntax=docker/dockerfile:1

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN dos2unix mvnw
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

COPY target/demo-0.0.1-SNAPSHOT.jar ./

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]