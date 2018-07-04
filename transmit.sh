#!/bin/bash 
gst-launch-1.0 -v v4l2src device=/dev/video0 ! queue ! video/x-h264,width=1920,height=1080,framerate=30/1 ! h264parse ! rtph264pay ! udpsink host=224.1.1.1 port=5001 auto-multicast=true

