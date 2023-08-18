# Use an official OpenJDK base image
FROM openjdk:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle build files into the container
COPY build.gradle settings.gradle /app/

# Copy the gradlew script into the container
COPY gradlew /app/gradlew

# Make the gradlew script executable
RUN chmod +x gradlew

# Copy the source code into the container
COPY src /app/src

# Build the application using Gradle
RUN ./gradlew build

# Expose the port that the Spring Boot application will listen on
EXPOSE 8082

# Start the Spring Boot application when the container runs
CMD ["java", "-jar", "build/libs/your-application-name.jar"]

