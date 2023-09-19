# Vision

# Activate multiple terminals
function runDAI (){
    echo "Starting Tmux session for EGH450 UAV Vision"
    sleep 2
    tmux new-session -s cdrone\; set -g mouse on\;              \
        send-keys "roslaunch egh450_target_solvepnp pose_estimator.launch" \; split-window -h -p 85\; select-pane -t 0\; split-window -v\;                   \
        send-keys "rosrun depthai_publisher dai_publisher_yolov5_runner" \; select-pane -t 2\; split-window -h\; select-pane -t 2\;                   \
        send-keys "rosrun depthai_publisher aruco_subscriber" \; split-window -v -p 75\;               \
        send-keys "" \; split-window -v -p 60\;                                 \
        
}
export -f runDAI
