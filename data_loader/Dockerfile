FROM osrf/ros:noetic-desktop-full
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME='raviteja'
ENV USER_PASSWORD='rbccps'

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install software-properties-common -y
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip install matplotlib
RUN pip install opencv-python
RUN pip install opencv-contrib-python

###############################################
# Step 4: Install Useful Packages
###############################################
RUN apt-get install mlocate -y
RUN apt-get update -y && apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get update -y
RUN apt-get install git -y


##################################################
# Step 5: Install GUI based Text Editor : Sublime
##################################################
RUN curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
RUN add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
RUN apt install sublime-text -y
RUN apt install gedit -y
RUN apt-get update -y
RUN apt-get upgrade -y

RUN mkdir /root/catkin_ws/src -p
RUN cd /root/catkin_ws/src && git clone https://github.com/teju81/ros_images_publisher.git
COPY CMakeLists.txt /root/catkin_ws/src/ros_images_publisher/.
RUN /bin/bash -c '. /opt/ros/$ROS_DISTRO/setup.bash; catkin_init_workspace'
RUN /bin/bash -c '. /opt/ros/$ROS_DISTRO/setup.bash; cd /root/catkin_ws; catkin_make'
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

RUN apt-get update && apt-get install -y \
	ros-noetic-realsense2-camera \
	ros-noetic-realsense2-description \
	&& rm -rf /var/lib/apt/lists/

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt update && apt install tmux -y

COPY data_loader_script.sh .