#!/bin/bash
gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5001 ! application/x-rtp ! rtph264depay ! vaapih264dec ! autovideosink sync=false

