# Etapa de construção
FROM maven:3.8.6-openjdk-21 AS build

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos do projeto para o contêiner
COPY . .

# Execute o Maven para criar o pacote (JAR)
RUN mvn clean package

# Etapa de execução
FROM openjdk:21-jdk-slim

# Exponha a porta que o aplicativo irá usar
EXPOSE 8080

# Copie o JAR do estágio de construção para o estágio de execução
COPY --from=build /app/target/marketplace-0.0.1-SNAPSHOT.jar app.jar

# Defina o comando para iniciar o aplicativo
ENTRYPOINT ["java","-jar","/app.jar"]
