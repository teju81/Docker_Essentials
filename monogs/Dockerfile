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
RUN mkdir -p /root/code && cd /root/code && git clone https://github.com/camenduru/simple-knn.git --recursive && cd simple-knn && git checkout 44f7642 && pip install .
RUN cd /root/code && git clone https://github.com/rmurai0610/diff-gaussian-rasterization-w-pose.git --recursive && cd diff-gaussian-rasterization-w-pose && git checkout 43e21bf && pip install .
RUN cd /root/code && git clone https://github.com/cvg/Hierarchical-Localization.git --recursive && cd Hierarchical-Localization && git checkout 41860cf && pip install .

##################################################
# Step 5: Install ROS2
##################################################

RUN locale && apt update && apt install locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8 && locale
RUN add-apt-repository universe && apt update && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update && apt upgrade -y && apt install ros-humble-ros-base -y && apt install ros-dev-tools -y
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc


# ##################################################
# # Step 6: Install PyDboW3
# ##################################################
RUN apt-get update
RUN apt-get install libopencv-dev -y
RUN cd /root/code && git clone https://github.com/teju81/pydbow3.git --recursive && cd pydbow3/modules/dbow3 && mkdir build && cd build && cmake .. && make -j4 && sudo make install && cd ../../.. && pip install .


##################################################
# Step 7: 
##################################################

RUN pip install setuptools==58.2.0
RUN apt install python-is-python3
RUN apt remove python3-matplotlib -y
RUN echo "alias python=python3" >> ~/.bashrc

##################################################
# Step 8: Install VSCODE
##################################################

RUN wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/4849ca9bdf9666755eb463db297b69e5385090e3/code_1.93.0-1725459079_amd64.deb
RUN apt install ./code_1.93.0-1725459079_amd64.deb -y && echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
RUN apt-get install wget gpg -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN  install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
RUN echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
RUN rm -f packages.microsoft.gpg
RUN apt update && apt install apt-transport-https && apt update
RUN apt install code -y

##################################################
# Step 9: Install TMUX
##################################################
RUN apt update -y && apt install tmux -y
RUN echo "set -g mouse on" > ~/.tmux.conf

RUN mkdir -p /root/code/monogs_ros_ws/src && cd /root/code/monogs_ros_ws/src && git clone https://github.com/teju81/MonoGS.git . && git checkout multicam_ros2
WORKDIR /root/code/monogs_ros_ws
