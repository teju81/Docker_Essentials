FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

ENV USER_NAME='raviteja'
ENV USER_PASSWORD='rbccps'


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install software-properties-common -y
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip3 install torch torchvision torchaudio
RUN pip install matplotlib
RUN pip install opencv-python
RUN pip install opencv-contrib-python

###############################################
# Step 4: Install Useful Packages
###############################################
RUN apt-get install plocate -y
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
# Step 6: Docker Display Related Stuff
##################################################

# Add a user as GUI display via X11 forwarding can not be done as root user
RUN useradd -m $USER_NAME -p $(perl -e 'print crypt($ARGV[0], "password")' $USER_PASSWORD)
RUN usermod -a -G sudo $USER_NAME
#RUN useradd -ms /bin/bash ros_master
USER $USER_NAME
WORKDIR /home/$USER_NAME