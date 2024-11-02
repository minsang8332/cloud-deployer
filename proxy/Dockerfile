FROM nginx:alpine

RUN apk update && \
    apk add --no-cache \
    bash \
    vim \
    openssl

# 인증서 자동화 스크립트
WORKDIR /home/user/scripts
RUN wget https://raw.githubusercontent.com/srvrco/getssl/master/getssl
COPY scripts/certificate.sh certificate.sh
RUN chmod +x certificate.sh getssl

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

# 포그라운드에서 실행하여 컨테이너가 종료되지 않도록 함
CMD nginx -g 'daemon off;'