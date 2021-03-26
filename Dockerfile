# build
FROM maven:3.6.0-jdk-11-slim AS build

COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# package
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/AccountManagement-1.0-SNAPSHOT.jar /AccountManagement.jar

EXPOSE 4567
ENTRYPOINT ["java", "-jar", "/AccountManagement.jar"]


