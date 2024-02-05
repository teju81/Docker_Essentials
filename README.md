# Docker_Essentials

## Docker Hello-World
- Install using convenience script as given in https://docs.docker.com/engine/install/ubuntu/

**References:**

1) https://docs.docker.com/engine/install/ubuntu/


## Basic setup

### Machine Learning Development Work - Nvidia Docker



- Install nvidia-container toolkit as given in https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- Run sample workload as given in https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/sample-workload.html
- Install Pytorch image from docker hub ``docker pull pytorch/pytorch:latest``
- Run a pytorch container by running the command ``sudo docker run --rm -it --runtime=nvidia --gpus all pytorch/pytorch:latest bash``
- Check that the gpu is accessible from within the container if by running the commands in a python3 environment
  ```
  import torch
  torch.cuda_is_available()
  ```
  the program should return ``true``.
  


**Reference:**

1) https://github.com/NVIDIA/nvidia-container-toolkit
2) https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/sample-workload.html

### Robotics work - ROS Docker

- ROS1
- ROS2

## Docker Cheatsheet

**Docker with Audio**

```docker run -it --rm --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie <docker_image_name> bash```

**Docker with Display/GUI**

```docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <docker_image_name> bash```

**Docker with both Display/GUI and Audio**

```docker run -it --rm --network=host -e ROS_IP=<ROS_IP> -e ROS_MASTER_URI=<ROS_MASTER_URI> -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie <docker_image_name> bash```


**Running Multiple Terminals associated with the same container**

``docker exec -it <container_name> bash``

**Note:**
- Bash after the container name in ``docker run`` or ``docker exec`` commands will override the CMD defined in the dockerfile of the given image
- The display related tags need to be specified with the ``docker run`` command. The display will work for all other terminals associated with the container. No need to explicitly type the display related tags in the ``docker exec`` command again.



## Custom Dockerfile

Most times the docker images one works with doesn't have everything we need. Consider using this dockerfile as a template for your work. it has the following features.

```
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
	mlocate \
	gedit \
	git \
  wget



# Install Sublime text
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
RUN echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
RUN apt-get update
RUN apt-get install sublime-text



```

- Non-interactive user : some packages require user input beyond (y/n) which we see in apt installs. Line XX builds the image without the user input.
- 

## References

1. Docker Mumshad Mannambeth - https://kodekloud.com/wp-content/uploads/2020/06/Docker-for-Beginners-Mumshad-Mannambeth.pdf
2. Docker for Beginners (FreeCodeCamp.org Youtube Channel)- https://www.youtube.com/watch?v=fqMOX6JJhGo&t=10s&ab_channel=freeCodeCamp.org
3. https://www.sublimetext.com/docs/linux_repositories.html
4. https://github.com/TerminalFi/LSP-copilot?tab=readme-ov-file
5. https://forum.sublimetext.com/t/github-copilot-for-sublime-text-4-is-coming/64449/3
6. https://packagecontrol.io/packages/LSP
7. https://packagecontrol.io/packages/LSP-copilot
