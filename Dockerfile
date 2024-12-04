# Use a imagem base com Java 21
FROM openjdk:21-jdk-slim

# Argumento para o arquivo JAR
ARG JAR_FILE=target/*.jar

# Copie o JAR do projeto para o contêiner
COPY ${JAR_FILE} app.jar

# Exponha a porta que o aplicativo irá usar
EXPOSE 8080

# Defina o comando para iniciar o aplicativo
ENTRYPOINT ["java","-jar","/app.jar"]
