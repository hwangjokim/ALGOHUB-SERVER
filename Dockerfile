FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

COPY . .
RUN ./gradlew bootJar

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=rc

# 8. 컨테이너 실행 시 자동으로 포트 노출
EXPOSE 8080

# 9. 실행 명령어 (최적화된 Spring Boot 실행)
CMD ["java", "-jar", "-Dspring.profiles.active=rc", "-Duser.timezone=Asia/Seoul", "/app/app.jar"]