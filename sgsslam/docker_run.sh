# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-sgsslam_container}
image_name=${2:-sgsslam_docker}

# Allow X server connection
xhost +local:root
docker rm $container_name
docker run -it --volume="/media/raviteja/Disk21/datasets:/root/code/datasets" --volume="/media/raviteja/Disk21/code_outputs/sgsslam:/root/code/output" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=all" \
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