#!/bin/bash 

# Wait for the network to come up
while ! ping -c 1 -W 1 192.168.1.1; do
    #echo "Waiting for 192.168.1.1 - network interface might be down..."
    sleep 1
done

# Once the network is up, then start the script
gst-launch-1.0 -v \
	v4l2src device=/dev/video0 ! queue ! video/x-h264,width=1920,height=1080,framerate=30/1 ! h264parse ! rtph264pay ! udpsink host=224.1.1.1 port=5001 auto-multicast=true \
	alsasrc device=hw:1 ! audioconvert ! queue ! voaacenc ! rtpmp4apay ! udpsink host=224.1.1.1 port=5002 auto-multicast=true 

