FROM nginx:alpine

ARG SSL_CERTIFICATE=${SSL_CERTIFICATE}
ENV SSL_CERTIFICATE=${SSL_CERTIFICATE}

RUN apk update && \
    apk add --no-cache \
    bash \
    vim \
    openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d /etc/nginx/conf.d
COPY scripts /home/user/scripts

WORKDIR /home/user/scripts
RUN wget https://raw.githubusercontent.com/srvrco/getssl/master/getssl
RUN chmod +x *
     
# 인증서 자동화 스크립트
RUN ./certificate.sh
# nginx 설정파일 환경변수 치환
RUN ./envsubst.sh

EXPOSE 80
EXPOSE 443

# 포그라운드에서 실행하여 컨테이너가 종료되지 않도록 함
CMD nginx -g 'daemon off;'
