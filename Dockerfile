FROM maven AS build
COPY . /spring-app
WORKDIR "spring-app"
RUN mvn package

FROM openjdk:8-jdk-alpine
COPY --from=build spring-app/target/discovery-service-0.0.1-SNAPSHOT.jar /discovery-service.jar
ENTRYPOINT ["java", "-jar", "discovery-service.jar"]