#!/bin/bash
STAGE_CA="https://acme-staging-v02.api.letsencrypt.org"
REAL_CA="https://acme-v02.api.letsencrypt.org"
exists_domain () {
    ip_list=$(dig +short $1)
    if [ -z "$ip_list" ]; then
        exit 1
    fi
    for ip in $ip_list; do
        ping -c 3 -W 3 $ip > /dev/null
        if [ $? -eq 0 ]; then
            exit 0
        fi
    done
    exit 2
}
make_certfile () {
    ca="$1"
    cat <<-EOL > getssl.cfg
        CA="$ca"
        ACL=('/var/www/html/.well-known/acme-challenge')
        USE_SINGLE_ACL="true"
EOL
    ./getssl "$ROOT_DOMAIN" -q -U >> getssl.log 2>&1
}
# 도메인 존재하는지 확인
exists_domain "$ROOT_DOMAIN"
if [ ! $? -eq 0 ]; then
    exit 255
fi
# 스테이지 파일 생성되면 찐으로 발급
make_certfile "$STAGE_CA"
if [ -f "./$ROOT_DOMAIN/fullchain.pem" ]; then
    rm -rf $ROOT_DOMAIN
    make_certfile "$REAL_CA"
    tmp="/etc/nginx/tmp/conf.d"
    if [ -d "$tmp" ]; then
        mv "$tmp" /etc/nginx/conf.d
    fi
    nginx -s reload
    exit 0
fi;
exit 254