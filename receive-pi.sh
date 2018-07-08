#!/bin/bash

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5003 ! application/x-rtp ! rtpjitterbuffer ! rtph264depay caps = "video/x-h264, codec_data=(buffer)017a001effe1001d677a001ebcd940a03db016a0c020a80000030008000003014478b16cb001000568ebecb22c, stream-format=(string)avc, alignment=(string)au, level=(string)3, profile=(string)high-4:2:2, width=(int)640, height=(int)480, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)20/1" ! queue ! omxh264dec ! fbdevsink 

