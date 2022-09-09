# syntax=docker/dockerfile:1

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY target/demo-0.0.1-SNAPSHOT.jar ./

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]