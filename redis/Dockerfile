FROM redis:latest

RUN apt-get update && apt-get install -y gettext && rm -rf /var/lib/apt/lists/*

ARG REDIS_PASSWORD=${REDIS_PASSWORD}

COPY redis.conf /usr/local/etc/redis/redis.conf.tmp

RUN envsubst '${REDIS_PASSWORD}' < /usr/local/etc/redis/redis.conf.tmp > /usr/local/etc/redis/redis.conf && rm -f /usr/local/etc/redis/redis.conf.tmp

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]