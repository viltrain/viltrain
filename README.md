# viltrain


# Proxy
Based on openresty it proxy passes to containers based on a redis hash.

    sudo docker run -d --name proxy -p 80:8080 viltrain/proxy
    
# Redis-gen
Insert and keeps the redis hash up-to-date based on the running containers

    sudo docker run -d --name redis-gen -v /var/run/docker.sock:/tmp/docker.sock:ro viltrain/redis-gen
    
# Builder
Let your project inheret from this image

    FROM viltrain/builder
    EXPOSE 5000
    CMD ["python", "app.py"]
