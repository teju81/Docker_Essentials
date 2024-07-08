sudo docker rmi ros2_docker:jammy_humble
sudo docker build -t ros2_docker:jammy_humble -f $(pwd)/Dockerfile .