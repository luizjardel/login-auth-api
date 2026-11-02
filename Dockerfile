FROM maven:3.9.4-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY login-auth-api/ .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
