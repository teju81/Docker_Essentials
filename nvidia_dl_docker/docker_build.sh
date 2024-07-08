sudo docker rmi pytorch_docker
sudo docker build -t pytorch_docker -f $(pwd)/Dockerfile .