# Use a imagem base com Java 21
FROM openjdk:21-jdk-slim
# Copie o JAR do projeto para o contêiner
COPY --from=build /target/marketplace-0.0.1-SNAPSHOT.jar app.jar
# Exponha a porta que o aplicativo irá usar
EXPOSE 8080
# Defina o comando para iniciar o aplicativo
ENTRYPOINT ["java","-jar","/app.jar"]