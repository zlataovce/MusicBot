FROM maven:3.9-eclipse-temurin-17-alpine as build

RUN mvn package

FROM eclipse-temurin:17-jre-jammy

COPY --from=build target/JMusicBot-*-All.jar /app/JMusicBot.jar

ENTRYPOINT ["java", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]