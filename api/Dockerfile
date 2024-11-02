FROM alpine:latest

RUN apk update && \
    apk add --no-cache \
    vim \
    openjdk21

# jdk 경로 설정
ENV JAVA_HOME=/opt/jdk-21.0.1
ENV PATH=$JAVA_HOME/bin:$PATH

# EXPOSE 8080
CMD ["tail", "-f", "/dev/null"]