FROM maven as build
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN mvn clean install
FROM openjdk:8
COPY --from=build /app/target/SpringWebApplication-SNAPSHOT.jar /app/target/SpringWebApplication-0.0.1-SNAPSHOT.jar
EXPOSE 9005
ENTRYPOINT ["java", "-jar", "/app/target/SpringWebApplication-0.0.1-SNAPSHOT.jar"]
