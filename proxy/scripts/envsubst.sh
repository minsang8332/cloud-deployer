#!/bin/bash
set -eu
templates=( "/etc/nginx/" "/etc/nginx/conf.d/")
for template in "${templates[@]}"; do
    for config in "$template"*.conf; do
        if [[ -f "$config" ]]; then
            envsubst '${SSL_CERTIFICATE}' < "$config" > "$config.tmp"
            mv "$config.tmp" "$config"
        fi
    done
done