#use latest ubuntu image
FROM ubuntu

# Avoids interactive installation for ros2: Ref link https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME='ros_master'
ENV USER_PASSWORD='ros_master'
RUN apt-get update -y && apt-get upgrade -y


#install ROS2 Humble

###############################################
# Step 1: Set Locale
###############################################
 
#Make sure you have a locale which supports UTF-8
# check for UTF-8
RUN locale
RUN apt update && apt install locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

# verify settings
RUN locale

###############################################
# Step 2: Setup Sources
###############################################

# Add the ROS 2 apt repository to your system.
RUN apt install software-properties-common -y
RUN add-apt-repository universe -y

# Add the ROS 2 GPG key with apt.
RUN apt-get update -y && apt-get install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add the repository to your sources list.
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null


###############################################
# Step 3: Install ROS2 Packages
###############################################

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install ros-humble-desktop -y
RUN apt install ros-dev-tools -y
RUN apt install ros-humble-navigation2 -y
RUN apt install ros-humble-nav2-bringup -y
RUN apt install ros-humble-turtlebot3* -y
RUN apt install python3-colcon-common-extensions -y
RUN sudo apt install python3-pip - y
# Anything higher than 58.2.0 will give SetuptoolsDeprecationWarning warning
RUN pip install setuptools==58.2.0
RUN rosdep init
#RUN rosdep update


###############################################
# Step 4: Install Useful Packages
###############################################
RUN apt-get install plocate -y
RUN apt-get update -y && apt-get upgrade -y


##################################################
# Step 5: Install GUI based Text Editor : Sublime
##################################################
RUN curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
RUN add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
RUN apt install sublime-text -y
# RUN apt install gedit -y

##################################################
# Step 6: Docker Display Related Stuff
##################################################

# Add a user as GUI display via X11 forwarding can not be done as root user
RUN useradd -m $USER_NAME -p $(perl -e 'print crypt($ARGV[0], "password")' $USER_PASSWORD)
RUN usermod -a -G sudo $USER_NAME
#RUN useradd -ms /bin/bash ros_master
USER $USER_NAME
WORKDIR /home/$USER_NAME



###############################################
# Step 7: COLCON Related
###############################################

RUN mkdir -p ~/ros2_ws/src


###############################################
# Step 8: Bashrc additions for ROS
###############################################
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
RUN echo "export ROS_AUTOMATIC_DISCOVERY_RANGE=SYSTEM_DEFAULT" >> ~/.bashrc
RUN echo "# export ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST" >> ~/.bashrc
RUN echo "# export ROS_STATIC_PEERS=192.168.0.1;remote.com" >> ~/.bashrc
RUN echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
RUN echo "export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models" >> ~/.bashrc
# Gazebo hangs without running below command - important that it follows after the previous export command and not before
# Ref: 1) https://github.com/ros-planning/navigation2/issues/2757 2) https://docs.aws.amazon.com/robomaker/latest/dg/run-hello-world-ros.html
RUN echo "source /usr/share/gazebo/setup.bash" >> ~/.bashrc
RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
RUN echo "export _colcon_cd_root=/opt/ros/humble/" >> ~/.bashrc
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc





