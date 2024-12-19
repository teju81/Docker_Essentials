sudo docker rmi photoslam_docker
sudo docker build -t photoslam_docker -f $(pwd)/Dockerfile .
