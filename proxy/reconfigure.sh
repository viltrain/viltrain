sudo docker stop proxy
sudo docker rm proxy
sudo docker build -t viltrain/openresty .
sudo docker run -d --name proxy -p 80:8080 viltrain/openresty
