FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY build/libs/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=rc

EXPOSE 8080

CMD ["java", "-jar", "-Dspring.profiles.active=rc", "-Duser.timezone=Asia/Seoul", "/app/app.jar"]