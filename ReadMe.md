### Step 1: Create a Simple Java Application

1. Create a new Java file named `HelloWorld.java`.
2. Copy and paste the following code into `HelloWorld.java`:

   ```java
   public class HelloWorld {
       public static void main(String[] args) {
           System.out.println("Hello, World!");
       }
   }

### Step 2: Containerize the Application Using Docker

1. Create a new file named `Dockerfile`.
2. Copy and paste the following Dockerfile content into `Dockerfile`:

   ```dockerfile
   # Use a base image with Java pre-installed
   FROM openjdk:11-jre-slim

   # Set the working directory in the container
   WORKDIR /app

   # Copy the compiled Java application into the container
   COPY HelloWorld.class /app

   # Command to run the Java application
   CMD ["java", "HelloWorld"]

1. Create a new file named `docker-compose.yml`.
2. Copy and paste the following Docker Compose configuration into `docker-compose.yml`:

   ```yaml
   version: '3'
   services:
     java-app:
       build:
         context: .
         dockerfile: Dockerfile
       ports:
         - "8080:8080"
       networks:
         - app-network

   networks:
     app-network:
       driver: bridge

3. Save the docker-compose.yml.
4. Run the Docker Compose configuration:
   ```sh
   docker-compose up

5. Verify that the application is running by opening a web browser and navigating to http://localhost:8080. You should see Hello, World! displayed`.
6. Press Ctrl+C to stop the Docker Compose process.

### Step 4: Build the Deployment File for Kubernetes

1. Create two new files: `deployment.yaml` and `service.yaml`.
2. Copy and paste the following Kubernetes deployment configuration into `deployment.yaml`:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: java-app-deployment
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: java-app
     template:
       metadata:
         labels:
           app: java-app
       spec:
         containers:
           - name: java-app
             image: helloworld-java-app
             ports:
               - containerPort: 8080


3. Save the deployment.yaml.
4. Save the service.yaml.
5. Apply the Kubernetes deployment and service:
   ```sh
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml

6. Verify that the deployment and service are created:
   ```sh
   kubectl get pods
   kubectl get services

8. Access the application by finding the external IP of the service:
    ```sh
   kubectl get svc java-app-service

9.Open a web browser and navigate to http://<EXTERNAL_IP>:8080. You should see Hello, World! displayed.





