# EGH450_Group_4
Autonomous Drone Project
Install Ubuntu on Raspberry Pis:

Download the Ubuntu Server image for Raspberry Pi.
Flash the image onto an SD card (use tools like "balenaEtcher").
Insert the flashed SD card into Raspberry Pi and boot.
Connect to Pi via ssh (default credentials: username: ubuntu, password: ubuntu).
Change the default password when prompted.

Install ROS on the Raspberry Pis:

Setup ROS Repositories.
Install ROS Noetic (or your desired version).
Initialize rosdep.
Setup ROS environment in .bashrc.
Clone Custom Code from a Git Repository:

Install git.
Clone your repository using git clone [https://github.com/jessbender/EGH450_Group_4].

Add the following to the .bashrc:
function run450 (){
  echo "Starting Tmux session for EGH450 UAV control - DEMO"
  sleep 2
  tmux new-session -s uavg4\; set -g mouse on\; send-keys "roscore" C-m\; split-window -h -p 85\; select-pane -t 0\; split-window -v\;                   \
      send-keys "sleep 10; rosrun depthai_publisher aruco_subscriber" C-m \; select-pane -t 2\; split-window -h\; select-pane -t 2\;                   \
      send-keys "sleep 10; rosrun depthai_publisher dai_publisher_yolov5_runner" C-m \; split-window -v -p 75\;               \
      send-keys "sleep 5; roslaunch ~/${catkin_ws}/launch/control.launch" C-m\; split-window -v -p 60\;                                 \
      send-keys "sleep 5; roslaunch qutas_lab_450 environment.launch" C-m\; split-window -v \;                                        \
      send-keys "sleep 10; roslaunch egh450_target_solvepnp pose_estimator.launch" C-m\;  select-pane -t 6\;                                   \
      send-keys "cd-spar; python3 tf2_listener" \;  split-window -v \;                                        \
      send-keys "sleep 5; roslaunch ~/${catkin_ws}/launch/breadcrumb.launch" C-m \;  split-window -v \;                                        \
      send-keys "cd-spar; python3 payloads"\;  split-window -v -p 80\;                      \
      send-keys "rosbag record -a" \; split-window -v -p 80\; select-pane -t 8\; split-window -h\; \
      send-keys "cd-spar; python3 tf2_broadcaster_frames"\; select-pane -t 11\;                                                 \
      send-keys "roslaunch spar_node rundemo.launch" \;
}
export -f run450
