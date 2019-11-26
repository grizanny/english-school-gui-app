# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine
LABEL maintainer="Aliaksandr Rahavoi <rogovoi200023507@gmail.com>"
# Add a volume pointing to /tmp
VOLUME /tmp
# Make port available to the world outside this container
EXPOSE 8888
# The application's jar file
ARG JAR_FILE=target/english-school-gui-0.0.1-SNAPSHOT.jar
# Add the application's jar to the container
ADD ${JAR_FILE} english-school-gui.jar
ENV JAVA_OPTS="-Xms128m -Xmx128m"
# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/english-school-gui.jar"]