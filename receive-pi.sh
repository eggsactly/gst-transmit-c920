#!/bin/bash

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5004 ! application/x-rtp ! rtpjitterbuffer ! rtph264depay ! h264parse ! queue ! omxh264dec ! fbdevsink 

