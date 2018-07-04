#!/bin/bash

OUTPUT_FILE_NAME=`date +%Y-%m-%d.%H:%M:%S`.mp4

gst-launch-1.0 -v \
	udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5001 ! application/x-rtp ! rtph264depay ! tee name=v \
	udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5002 ! application/x-rtp, media=audio, clock-rate=32000, encoding-name=MP4A-LATM, payload=96 ! rtpmp4adepay ! tee name=a \
	v. ! queue ! vaapih264dec ! autovideosink sync=false \
	a. ! queue ! avdec_aac ! audioconvert ! autoaudiosink sync=false \
	v. ! queue ! h264parse ! mux. \
	a. ! aacparse ! mux. \
	mpegtsmux name=mux ! queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! filesink location=$OUTPUT_FILE_NAME

