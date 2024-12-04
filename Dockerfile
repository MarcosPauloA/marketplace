# Use Maven base image
FROM maven:3.8.7-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the project
RUN mvn clean package -DskipTests

# Use OpenJDK base image for runtime
FROM openjdk:17-jdk-slim

# Expose the port the application runs on
EXPOSE 8080

# Copy the built JAR file to the container
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
