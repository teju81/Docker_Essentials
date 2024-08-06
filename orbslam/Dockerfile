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
RUN apt-get update -y && apt-get upgrade -y


##################################################
# Step 6: Build C++ opencv 4.4 from source
##################################################

RUN apt update -y && apt upgrade -y
RUN mkdir -p ~/code/opencv && cd ~/code/opencv && git clone https://github.com/opencv/opencv.git . && git checkout 4.4.0
RUN mkdir -p ~/code/opencv_contrib && cd ~/code/opencv_contrib && git clone https://github.com/opencv/opencv_contrib.git . && git checkout 4.4.0
RUN apt -y remove x264 libx264-dev
RUN apt -y install build-essential checkinstall cmake pkg-config yasm
RUN apt -y install git gfortran
RUN apt -y install libjpeg8-dev libpng-dev
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt -y update
RUN apt -y install libjasper1
RUN apt -y install libtiff-dev
RUN apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
RUN apt -y install libxine2-dev libv4l-dev
RUN cd /usr/include/linux && ln -s -f ../libv4l1-videodev.h videodev.h
RUN apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
RUN apt -y install libgtk2.0-dev libtbb-dev qt5-default
RUN apt -y install libatlas-base-dev
RUN apt -y install libfaac-dev libmp3lame-dev libtheora-dev
RUN apt -y install libvorbis-dev libxvidcore-dev
RUN apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
RUN apt -y install libavresample-dev
RUN apt -y install x264 v4l-utils
RUN apt -y install libprotobuf-dev protobuf-compiler
RUN apt -y install libgoogle-glog-dev libgflags-dev
RUN apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

RUN pip install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib

RUN mkdir -p ~/code/opencv/build && cd ~/code/opencv/build && cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_C_EXAMPLES=ON \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D WITH_TBB=ON \
-D WITH_V4L=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=/root/opencv/opencv-py3/lib/python3.5/site-packages \
-D WITH_QT=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
-D BUILD_EXAMPLES=ON \
-D OPENCV_GENERATE_PKGCONFIG=YES .. && make -j4 && make install && sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf' && ldconfig

COPY opencv4.pc ~/Desktop/opencv/build/unix-install/opencv4.pc
COPY opencv4.pc /usr/local/lib/pkgconfig/opencv4.pc

RUN echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >> ~/.bashrc
RUN echo "export PKG_CONFIG_PATH" >> ~/.bashrc

##################################################
# Step 7: Install realsense2
##################################################

RUN mkdir -p /etc/apt/keyrings && curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp > /dev/null
RUN echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | tee /etc/apt/sources.list.d/librealsense.list
RUN apt-get update -y
RUN apt-get install librealsense2-dkms -y
RUN apt-get install librealsense2-utils -y
RUN apt-get install librealsense2-dev -y
RUN apt-get install librealsense2-dbg -y

##################################################
# Step 7: Build ORBSLAM3 and its dependencies
##################################################
RUN mkdir -p ~/code/orbslam && cd ~/code/orbslam && git clone https://github.com/teju81/ORB_SLAM3.git . && git checkout c++14_comp && chmod +x build.sh && mkdir -p ~/code/orbslam/Thirdparty/Pangolin
RUN cd ~/code/orbslam/Thirdparty/Pangolin && git clone --recursive https://github.com/stevenlovegrove/Pangolin.git .
COPY install_prerequisites.sh /root/code/orbslam/Thirdparty/Pangolin/scripts/.
RUN cd ~/code/orbslam/Thirdparty/Pangolin && chmod +x scripts/install_prerequisites.sh && ./scripts/install_prerequisites.sh -v -m apt required && cmake -B build && cmake --build build
RUN cd ~/code/orbslam/Thirdparty/Pangolin/build && ctest
RUN cd ~/code/orbslam && ./build.sh