###  Containerize the Application Using Docker

   # Use a base image with Java pre-installed
   FROM openjdk:11-jre-slim

   # Set the working directory in the container
   WORKDIR /app

   # Copy the compiled Java application into the container
   COPY HelloWorld.class /app

   # Command to run the Java application
   CMD ["java", "HelloWorld"]