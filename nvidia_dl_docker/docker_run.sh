# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-pytorch_container}
image_name=${2:-pytorch_docker}
sudo docker run --rm -it --runtime=nvidia --gpus all --network=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/raviteja/code/:/home/raviteja/code/ --name $container_name $image_name bash