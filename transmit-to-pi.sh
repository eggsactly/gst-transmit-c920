#!/bin/bash

# Get video from USB2.0 VGA UVC WebCam built into Asus laptop

gst-launch-1.0 -v \
	v4l2src device=/dev/video0 ! video/x-raw,width=640,height=480,framerate=20/1,format=YV12 ! videoconvert ! queue ! x264enc ! h264parse ! rtph264pay pt=96 ! udpsink host=224.1.1.1 port=5004 auto-multicast=true

