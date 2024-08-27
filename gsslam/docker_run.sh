# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-gsslam_container}
image_name=${2:-gsslam_docker}

# Allow X server connection
xhost +local:root

#docker run --rm -it --privileged --runtime=nvidia --gpus all --network=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/rbccps23/code/MonoGS/:/MonoGS/ --name $container_name $image_name bash

docker run -it --rm --volume="/home/raviteja/code/gs_slam/MonoGS/:/MonoGS/" --volume="/home/raviteja/code/datasets/:/MonoGS/datasets/" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --net=host \
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
