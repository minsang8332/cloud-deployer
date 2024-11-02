FROM nginx:alpine

RUN apk update && \
    apk add --no-cache \
    bash \
    vim \
    openssl

WORKDIR /home/user/scripts
RUN wget https://raw.githubusercontent.com/srvrco/getssl/master/getssl
COPY scripts/certificate.sh certificate.sh
RUN chmod +x certificate.sh getssl