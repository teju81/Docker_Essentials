# Intended to be run as "./docker_run.sh <container_name>"
# When <container_name> is not provided default container_name ros2_container is used
container_name=${1:-splatam_container}
image_name=${2:-splatam_docker}
#docker run --rm -it --privileged --runtime=nvidia --gpus all --network=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/raviteja/code/:/home/raviteja/code/ --name $container_name $image_name bash

docker run -it --rm --volume="/home/rbccps23/code/splatam/:/SplaTAM/" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --net=host \
    --privileged \
    --group-add audio \
    --group-add video \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --gpus all \
    --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name $container_name $image_name bash