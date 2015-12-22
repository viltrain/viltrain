FROM jwilder/docker-gen:latest

ADD sources.list /etc/apt/sources.list

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -f -y -q --no-install-recommends \
    redis-tools \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

ADD redis.tmpl /app/redis.tmpl

CMD ["-watch", "-only-exposed", "-notify", "/bin/sh /app/redis.sh", "/app/redis.tmpl", "/app/redis.sh"]
