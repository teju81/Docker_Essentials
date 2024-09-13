# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-orbslam_container}
image_name=${2:-orbslam_docker}

xhost +local:root

docker run --rm -it --privileged --network=host --ipc=host -v "/dev:/dev" -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/raviteja/code/datasets/:/root/code/datasets/ --name $container_name $image_name bash
# docker run -it --rm --volume="/home/raviteja/code/MonoGS/:/MonoGS/" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=all" \
#     --net=host \
#     --privileged \
#     --group-add audio \
#     --group-add video \
#     --ulimit memlock=-1 \
#     --ulimit stack=67108864 \
#     --gpus all \
#     --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
#     --name $container_name $image_name bash

xhost -local:root
