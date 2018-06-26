FROM openjdk:7
COPY app /usr/src/app
WORKDIR /usr/src/app
EXPOSE 80
RUN javac Main.java
CMD ["java", "Main"]