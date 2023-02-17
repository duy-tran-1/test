# syntax=docker/dockerfile:1

#
# Build stage
#
FROM maven:3.8.1-jdk-8-slim AS build
WORKDIR /app
COPY src ./src
COPY pom.xml ./
RUN mvn  clean package

#
# Package stage
#
FROM openjdk:8-jre-slim
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]


#FROM openjdk:8-jre-alpine
#
#WORKDIR /app
#
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#
#RUN dos2unix mvnw
#RUN chmod +x mvnw
#RUN ./mvnw dependency:go-offline
#
#COPY target/demo-0.0.1-SNAPSHOT.jar ./
#
#CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
