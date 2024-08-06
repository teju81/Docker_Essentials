tmux split-window -h
tmux split-window -v -l 30
tmux select-pane -t 0
tmux split-window -v
tmux select-pane -t 3
tmux split-window -v -l 10
tmux select-pane -t 3
tmux split-window -v
tmux send-keys -t 5 'roscore' C-m
tmux send-keys -t 0 'publish_color_images(){
    roscd ros_images_publisher; ROOT=$PWD
    rosrun ros_images_publisher publish_images.py \
        --images_folder /code/data_loader/datasets/tum/rgbd_dataset_freiburg1_desk/rgb/ \
        --topic_name /camera/color/image_raw \
        --camera_info_file $ROOT/data/cam_params_realsense.json
}' C-m
tmux send-keys -t 0 'publish_color_images' C-m

tmux send-keys -t 1 'publish_depth_images(){
    roscd ros_images_publisher; ROOT=$PWD
    rosrun ros_images_publisher publish_images.py \
        --images_folder /code/data_loader/datasets/tum/rgbd_dataset_freiburg1_desk/depth/ \
        --topic_name /camera/aligned_depth_to_color/image_raw \
        --camera_info_file $ROOT/data/cam_params_realsense.json \
        --format depth
}' C-m
tmux send-keys -t 1 'publish_depth_images' C-m

tmux send-keys -t 3 'rosrun tf static_transform_publisher 0 0 0 0 0 0 1 map head_camera 10' C-m
tmux send-keys -t 4 'run_rviz(){
    roscd ros_images_publisher; ROOT=$PWD
    rosrun rviz rviz -d $ROOT/rviz_for_color_and_depth_images.rviz
}' C-m
tmux send-keys -t 4 'run_rviz' C-m
tmux select-pane -t 2