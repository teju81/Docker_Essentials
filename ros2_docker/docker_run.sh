# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-ros2_container}
image_name=${2:-ros2_docker:jammy_humble}
sudo docker run -it --network=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name $container_name $image_name bash