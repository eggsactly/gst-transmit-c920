#!/bin/bash

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5003 ! application/x-rtp ! rtpjitterbuffer ! rtph264depay ! video/x-h264, codec_data=017a001effe1001d677a001ebcd940a03db016a0c020a80000030008000003014478b16cb001000568ebecb22c, stream-format=avc, alignment=au, level=3, profile=high-4:2:2, width=640, height=480, pixel-aspect-ratio=1/1, framerate=20/1 ! videoconvert ! queue ! omxh264dec ! fbdevsink 

