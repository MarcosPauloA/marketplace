# Etapa de construção
FROM ubuntu:latest AS build

# Copie os arquivos do projeto para o contêiner
COPY . .

# Etapa de execução
FROM openjdk:21-jdk-slim

# Exponha a porta que o aplicativo irá usar
EXPOSE 8080

# Copie o JAR do estágio de construção para o estágio de execução
COPY --from=build /target/marketplace-0.0.1-SNAPSHOT.jar app.jar

# Defina o comando para iniciar o aplicativo
ENTRYPOINT ["java","-jar","/app.jar"]
