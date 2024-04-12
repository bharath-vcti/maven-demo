# Use a base image that contains Java, Maven, and other necessary dependencies
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the project files into the Docker image
COPY pom.xml .
COPY src ./src

# Build the project using Maven
RUN mvn clean package

# Use a lightweight base image to run the application
FROM openjdk:11-jre-slim

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the compiled JAR file from the builder stage to the current directory in the Docker image
COPY --from=builder /app/target/*.jar ./app.jar

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]
