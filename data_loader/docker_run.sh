# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-data_loader_container}
image_name=${2:-data_loader_docker}
docker run --rm -it --privileged --network=host --ipc=host -v "/dev:/dev" -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --volume="/home/raviteja/code/data_loader/:/code/data_loader/" \
--volume="/home/raviteja/code/datasets/:/code/data_loader/datasets/"  \
--name $container_name $image_name bash