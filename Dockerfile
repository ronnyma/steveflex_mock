FROM openjdk:8-jre
RUN useradd -ms /bin/bash wiremock
USER root
EXPOSE 8080
ENV JAVA_OPTS="-XX:MaxPermSize=1024m"
commit=$(git rev-parse HEAD)
git_commit=${commit::8}

LABEL git_commit

RUN mkdir -p /opt/wiremock
WORKDIR /opt/wiremock/

RUN mkdir -p /opt/wiremock/__files
RUN mkdir -p /opt/wiremock/mappings
COPY ./data/__files /opt/wiremock/__files
COPY ./data/mappings /opt/wiremock/mappings

RUN  curl -L "https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.27.2/wiremock-standalone-2.27.2.jar" -o /opt/wiremock/wiremock.jar

ENTRYPOINT ["java", "-jar", "/opt/wiremock/wiremock.jar"]
