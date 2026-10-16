
# Stage 1: Build the Spring Boot application
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy dependency definition first to improve Docker layer caching
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy source code and build the JAR
COPY src ./src
RUN mvn -B clean package

# Stage 2: Run the application
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy only the packaged JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
