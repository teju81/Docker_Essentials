FROM nvidia/cuda:11.6.1-devel-ubuntu20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME='raviteja'
ENV USER_PASSWORD='rbccps'


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install sudo software-properties-common -y
RUN apt-get update && apt-get install python3-pip -y
RUN pip install matplotlib opencv-python opencv-contrib-python

###############################################
# Step 4: Install Useful Packages
###############################################
RUN apt-get install mlocate curl wget git -y


##################################################
# Step 5: Install GUI based Text Editor : Sublime
##################################################
RUN curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
RUN add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
RUN apt install sublime-text gedit -y
RUN apt-get update -y && apt-get upgrade -y


RUN apt update
RUN mkdir -p /home/$USER_NAME/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/$USER_NAME/miniconda3/miniconda.sh
RUN bash /home/$USER_NAME/miniconda3/miniconda.sh -b -u -p /home/$USER_NAME/miniconda3
RUN /home/$USER_NAME/miniconda3/bin/conda init bash
RUN pip install virtualenv

COPY environment.yml .
RUN /home/$USER_NAME/miniconda3/bin/conda env create -f environment.yml