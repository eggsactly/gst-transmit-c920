#!/bin/bash

VIDEO_FILE_NAME=`date +%Y-%m-%d.%H:%M:%S`.mp4
AUDIO_FILE_NAME=`date +%Y-%m-%d.%H:%M:%S`.mp4

gst-launch-1.0 -v \
	udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5001 ! application/x-rtp ! rtph264depay ! tee name=v \
	udpsrc multicast-group=224.1.1.1 port=5002 caps="application/x-rtp,channels=(int)2,media=(string)audio,payload=(int)96,clock-rate=(int)32000" ! rtppcmudepay ! queue ! mulawdec ! tee name=a \
	v. ! queue ! vaapih264dec ! autovideosink sync=false \
	a. ! queue ! audioconvert ! autoaudiosink sync=false \
	v. ! queue ! h264parse ! mux. \
	a. ! queue ! audioconvert ! voaacenc ! aacparse ! mux. \
	mpegtsmux name=mux ! queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! filesink location=$VIDEO_FILE_NAME

