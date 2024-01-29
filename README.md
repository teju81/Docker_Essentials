# Docker_Essentials

## Docker Hello-World
- Install using convenience script as given in https://docs.docker.com/engine/install/ubuntu/
- Remove the need to use sudo everytime you want to run docker by following https://docs.docker.com/engine/install/linux-postinstall/

**References:**

1) https://docs.docker.com/engine/install/ubuntu/
2) https://docs.docker.com/engine/install/linux-postinstall/


## Basic setup

## Machine Learning Development Work - Nvidia Docker



- Install nvidia-container toolkit as given in https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- Run sample workload as given in https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/sample-workload.html
- Install Pytorch

**Reference:**

1) https://github.com/NVIDIA/nvidia-container-toolkit
2) https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/sample-workload.html

## Robotics work - ROS Docker

- ROS1
- ROS2

## Docker Cheatsheet

**Docker with Audio**
docker run -it --rm --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie <docker_image_name> bash

**Docker with Display/GUI**
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <docker_image_name> bash

**Docker with both Display/GUI and Audio**
docker run -it --rm --network=host -e ROS_IP=<ROS_IP> -e ROS_MASTER_URI=<ROS_MASTER_URI> -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie <docker_image_name> bash


**Running Multiple Terminals associated with the same container**

``docker exec -it <container_name> bash``

**Note:**
- Bash after the container name in ``docker run`` or ``docker exec`` commands will override the CMD defined in the dockerfile of the given image
- The display related tags need to be specified with the ``docker run`` command. The display will work for all other terminals associated with the container. No need to explicitly type the display related tags in the ``docker exec`` command again.


## References

1. Docker Mumshad Mannambeth - https://kodekloud.com/wp-content/uploads/2020/06/Docker-for-Beginners-Mumshad-Mannambeth.pdf
2. Docker for Beginners (FreeCodeCamp.org Youtube Channel)- https://www.youtube.com/watch?v=fqMOX6JJhGo&t=10s&ab_channel=freeCodeCamp.org
