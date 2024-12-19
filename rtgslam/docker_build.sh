sudo docker rmi rtgslam_docker
sudo docker build -t rtgslam_docker -f $(pwd)/Dockerfile .
