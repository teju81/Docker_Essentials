# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-monogs_container}
image_name=${2:-monogs_docker}
#docker run --rm -it --privileged --runtime=nvidia --gpus all --network=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/raviteja/code/MonoGS/:/MonoGS/ --name $container_name $image_name bash


# Allow X server connection
xhost +local:root

docker run -it --volume="/home/raviteja/code/monogs_ros_ws/:/monogs_ros_ws/" --volume="/home/raviteja/code/MonoGS/:/MonoGS/" --volume="/home/raviteja/code/datasets/:/datasets" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --net=host \
    --ipc=host\
    --privileged \
    --group-add audio \
    --group-add video \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --gpus all \
    --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name $container_name $image_name bash

# Disallow X server connection
xhost -local:root