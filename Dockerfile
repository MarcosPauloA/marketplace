# Use a imagem base com Java 21
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
# RUN apt-get install maven -y
# RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

# Exponha a porta que o aplicativo irá usar
EXPOSE 8080

COPY --from=build /target/marketplace-0.0.1-SNAPSHOT.jar app.jar


# Defina o comando para iniciar o aplicativo
ENTRYPOINT ["java","-jar","/app.jar"]