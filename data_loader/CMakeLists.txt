cmake_minimum_required(VERSION 2.8.3)
project(ros_images_publisher)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  
  std_msgs
  sensor_msgs
  geometry_msgs

)

catkin_package(CATKIN_DEPENDS message_runtime) # declares dependencies for packages that depend on this package.

include_directories(
  ${catkin_INCLUDE_DIRS}
)
catkin_install_python(PROGRAMS publish_images.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)