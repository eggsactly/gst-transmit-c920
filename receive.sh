#!/bin/bash

OUTPUT_FILE_NAME=`date +%Y-%m-%d.%H:%M:%S`.mp4

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5001 ! application/x-rtp ! rtpjitterbuffer ! rtph264depay ! tee name=v \
	v. ! queue ! vaapih264dec ! autovideosink sync=false \
	udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5002 ! application/x-rtp, media=audio, clock-rate=8000, encoding-name=PCMU ! rtpjitterbuffer ! rtppcmudepay ! queue ! mulawdec ! tee name=a \
	a. ! audioconvert ! autoaudiosink \
#	a. ! audioconvert ! queue ! voaacenc ! aacparse ! queue ! mux. \
	v. ! queue ! h264parse ! mux. \
	mpegtsmux name=mux ! queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! filesink location=$OUTPUT_FILE_NAME sync=false

