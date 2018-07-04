#!/bin/bash

OUTPUT_FILE_NAME=`date +%Y-%m-%d.%H:%M:%S`.mp4

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5001 ! application/x-rtp ! rtph264depay ! tee name=t \
	t. ! queue ! vaapih264dec ! autovideosink sync=false \
	t. ! queue ! h264parse ! mpegtsmux name=mux ! queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! filesink location=$OUTPUT_FILE_NAME


