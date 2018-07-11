#!/bin/bash

gst-launch-1.0 -v udpsrc multicast-group=224.1.1.1 auto-multicast=true port=5004 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, packetization-mode=(string)1, profile-level-id=(string)64001e, sprop-parameter-sets=(string)\"Z2QAHqzZQKA9sBagwCC0oAAAAwAgAAAFEeLFssA\=\,aOvssiw\=\", payload=(int)96, ssrc=(uint)787502953, timestamp-offset=(uint)382454587, seqnum-offset=(uint)15993, a-framerate=(string)20" ! rtpjitterbuffer ! rtph264depay ! h264parse ! queue ! omxh264dec ! fbdevsink 

