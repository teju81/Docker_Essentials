FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04
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
RUN pip3 install torch torchvision torchaudio #--index-url https://download.pytorch.org/whl/cu118
RUN pip install --upgrade --force-reinstall --ignore-installed blinker
RUN pip install open3d==0.18.0

# sequence of packages matters - open3d doesnt work properly otherwise
RUN pip install opencv-python
RUN pip install opencv-contrib-python
RUN pip install trimesh
RUN pip install imageio
RUN pip install plyfile
RUN pip install wandb
RUN pip install glfw
RUN pip install roma
RUN pip install imgviz
RUN pip install PyOpenGL==3.1.6
RUN pip install PyGLM
RUN pip install einops
#RUN pip install PyQt5
RUN pip install python-pycg
RUN pip install evo
RUN apt install python3-tk -y
RUN pip install torchmetrics
RUN apt install python3-tk -y
RUN pip install faiss-gpu
RUN pip install pytorch-msssim
RUN pip install lpips
RUN pip install ruff
RUN pip install tqdm
RUN pip install pyrealsense2
RUN pip install "numpy<2"
RUN pip install munch

# Your GPU's compute capability (a number) must be part of the below list - to find that number for your gpu go to https://developer.nvidia.com/cuda-gpus
ENV TORCH_CUDA_ARCH_LIST="6.0 7.0 7.5 8.0"
RUN mkdir -p /root/code && cd /root/code && git clone https://github.com/VladimirYugay/simple-knn.git --recursive && cd simple-knn && git checkout c7e51a0 && pip install .
RUN cd /root/code && git clone https://github.com/eriksandstroem/evaluate_3d_reconstruction_lib.git --recursive && cd evaluate_3d_reconstruction_lib && git checkout 9b3cc08 && pip install .
RUN cd /root/code && git clone https://github.com/VladimirYugay/gaussian_rasterizer.git --recursive && cd gaussian_rasterizer && git checkout 9c40173 && pip install .
RUN cd /root/code && git clone https://github.com/rmurai0610/diff-gaussian-rasterization-w-pose.git --recursive && cd diff-gaussian-rasterization-w-pose && git checkout 43e21bf && pip install .
RUN cd /root/code && git clone https://github.com/cvg/Hierarchical-Localization.git --recursive && cd Hierarchical-Localization && git checkout 41860cf && pip install .
RUN mkdir -p /root/code/loopsplat_ros_ws/src && cd /root/code/loopsplat_ros_ws/src && git clone https://github.com/teju81/LoopSplat.git . && git checkout ros2


##################################################
# Step 5: Install ROS2
##################################################

RUN locale && apt update && apt install locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8 && locale
RUN add-apt-repository universe && apt update && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update && apt upgrade -y && apt install ros-humble-ros-base -y && apt install ros-dev-tools -y
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc


RUN apt-get update && apt-get install -y \
    libxkbcommon-x11-0 \
    libxcb-xinerama0 \
    libxcb-xinerama0-dev \
    libxcb-icccm4 \
    libxcb-icccm4-dev \
    libxcb-image0 \
    libxcb-image0-dev \
    libxcb-keysyms1 \
    libxcb-keysyms1-dev \
    libxcb-render-util0 \
    libxcb-render-util0-dev \
    libxcb-randr0 \
    libxcb-randr0-dev \
    libxcb-xkb-dev \
    libx11-xcb-dev


##################################################
# Step 7: 
##################################################

RUN pip install setuptools==58.2.0
RUN apt install python-is-python3
RUN apt remove python3-matplotlib -y
RUN apt-get install xvfb -y
RUN Xvfb :99 -screen 0 1024x768x24 &
RUN export DISPLAY=:99
RUN echo "alias python=python3" >> ~/.bashrc

##################################################
# Step 9: Install TMUX
##################################################
RUN apt update -y && apt install tmux -y
RUN echo "set -g mouse on" > ~/.tmux.conf

WORKDIR /root/code/loopsplat_ros_ws
