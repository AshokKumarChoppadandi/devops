FROM openjdk:8

LABEL author="Ashok Kumar Choppadandi <ashokkumar98778@gmail.com>" \
        maintainer="Ashok Kumar Choppadandi <ashokkumar98778@gmail.com>" \
        description="A simple sprintboot application"

WORKDIR /

COPY maven/hello-spring-v2.0.jar /

ENV APP_VERSION v2

CMD java -jar /hello-spring-v2.0.jar --app.version=$APP_VERSION