sudo apt update -y
sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo apt install mlocate -y
sudo apt-get update -y
sudo apt-get install curl -y
sudo apt-get install wget -y
sudo apt-get install git -y
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text -y
sudo apt-get install python3-pip -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo pip install --upgrade pip
sudo apt install python-is-python3
echo "alias python=python3" >> ~/.bashrc
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
