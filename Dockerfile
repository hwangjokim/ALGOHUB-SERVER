FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

ARG CREDENTIAL_NAME
ARG CREDENTIAL_PW

ENV CREDENTIAL_NAME=${CREDENTIAL_NAME}
ENV CREDENTIAL_PW=${CREDENTIAL_PW}

COPY . .
RUN ./gradlew bootJar

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=rc

EXPOSE 8080

CMD ["java", "-jar", "-Dspring.profiles.active=rc", "-Duser.timezone=Asia/Seoul", "/app/app.jar"]