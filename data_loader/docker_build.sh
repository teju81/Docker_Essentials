image_name=${1:-data_loader_docker}
sudo docker rmi $image_name
sudo docker build -t $image_name -f $(pwd)/Dockerfile .