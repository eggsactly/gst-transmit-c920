#!/bin/bash

while ! ping -c 1 -W 1 192.168.1.1; do
    sleep 1
done

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5004 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtpjitterbuffer ! rtph264depay ! h264parse ! omxh264dec ! queue ! videoconvert ! queue ! fbdevsink sync=false

