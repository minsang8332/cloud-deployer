FROM alpine:latest

RUN apk update && \
apk add --no-cache \
vim \
openjdk21

# JAVA_HOME 설정
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /home/user
COPY run.sh run.sh
RUN chmod +x run.sh

EXPOSE 8080

CMD exec ./run.sh & tail -f /dev/null