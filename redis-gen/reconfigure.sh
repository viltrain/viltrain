sudo docker stop redis-gen
sudo docker rm redis-gen
sudo docker build -t viltrain/redis-gen .
sudo docker run -d --name redis-gen -v /var/run/docker.sock:/tmp/docker.sock:ro viltrain/redis-gen
