FROM maven:3.9-eclipse-temurin-17-alpine as build

COPY . /app
WORKDIR /app

RUN mvn package

FROM eclipse-temurin:17-jre-jammy

COPY --from=build /app/target/JMusicBot-*-All.jar /app/JMusicBot.jar

ENTRYPOINT ["java", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]