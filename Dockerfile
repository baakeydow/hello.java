FROM maven:alpine
COPY app /usr/src/app
WORKDIR /usr/src/app
EXPOSE 8080
RUN mvn clean package
CMD ["java", "-jar", "target/app-0.0.1-SNAPSHOT.jar"]