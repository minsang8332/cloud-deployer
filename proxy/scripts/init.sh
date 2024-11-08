#!/bin/bash
set -eu
# 템플릿 환경변수 치환
templates=("/etc/nginx/" "/etc/nginx/conf.d/")
for template in "${templates[@]}"; do
    for config in "$template"*.conf; do
        if [[ -f "$config" ]]; then
            envsubst '${SSL_CERTIFICATE} ${ROOT_DOMAIN}' < "$config" > "$config.tmp"
            mv "$config.tmp" "$config"
        fi
    done
done
# acme-callenge 권한 설정
mkdir -p /var/www/html/.well-known/acme-challenge
chmod -R 755 /var/www/html/.well-known
# 스크립트가 위치한 폴더로 이동하여 실행 권한 부여
cd /home/user/scripts
# getssl 다운로드
wget https://raw.githubusercontent.com/srvrco/getssl/master/getssl
# cron 설정
mkdir -p /root/.cache/crontab
echo "0 0 1 * * /home/user/scripts/certificate.sh > /dev/null 2>&1" | crontab -