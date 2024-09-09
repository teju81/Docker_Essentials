FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME='raviteja'
ENV USER_PASSWORD='rbccps'


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install software-properties-common -y
RUN apt-get update
RUN apt-get install python3-pip -y

###############################################
# Step 2: Install Useful Packages
###############################################
RUN apt-get install mlocate -y
RUN apt-get update -y && apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get update -y
RUN apt-get install git -y


##################################################
# Step 3: Install GUI based Text Editor : Sublime
##################################################
RUN curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
RUN add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
RUN apt install sublime-text -y
RUN apt install gedit -y
RUN apt-get update -y && apt-get upgrade -y

RUN pip install --upgrade pip

##################################################
# Step 4: Install python packages for monogs
##################################################
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN pip install --upgrade --force-reinstall --ignore-installed blinker
RUN pip install open3d

# sequence of packages matters - open3d doesnt work properly otherwise
RUN pip install opencv-python
RUN pip install opencv-contrib-python
RUN pip install trimesh
RUN pip install munch
RUN pip install plyfile
RUN pip install wandb
RUN pip install glfw
RUN pip install imgviz
RUN pip install PyOpenGL==3.1.6
RUN pip install PyGLM
RUN pip install rich
RUN pip install evo
RUN apt install python3-tk -y
RUN pip install torchmetrics
RUN apt install python3-tk -y

RUN pip install lpips
RUN pip install ruff
RUN pip install tqdm
RUN pip install pyrealsense2

# Your GPU's compute capability (a number) must be part of the below list - to find that number for your gpu go to https://developer.nvidia.com/cuda-gpus
ENV TORCH_CUDA_ARCH_LIST="6.0 7.0 7.5 8.0"
RUN git clone https://github.com/camenduru/simple-knn.git --recursive && cd simple-knn && git checkout 44f7642 && pip install .
RUN git clone https://github.com/rmurai0610/diff-gaussian-rasterization-w-pose.git --recursive && cd diff-gaussian-rasterization-w-pose && git checkout 43e21bf && pip install .

##################################################
# Step 5: Install ROS2
##################################################

RUN locale && apt update && apt install locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8 && locale
RUN add-apt-repository universe && apt update && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update && apt upgrade -y && apt install ros-humble-desktop -y && apt install ros-dev-tools -y
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc


##################################################
# Step 6: Install PyDboW3
##################################################

RUN git clone https://github.com/teju81/pydbow3.git --recursive && cd pydbow3/modules/dbow3 && mkdir build && cd build && cmake .. && make -j4 && sudo make install && cd ../../.. && pip install .


RUN pip install setuptools==58.2.0
RUN apt install python-is-python3
RUN apt remove python3-matplotlib -y
RUN echo "alias python=python3" >> ~/.bashrc

WORKDIR /monogs_ros_ws
