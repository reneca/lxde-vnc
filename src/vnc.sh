#!/bin/bash

rm -f /tmp/*

# Make default resolution if it's not set
if [ -z "$RESOLUTION" ]; then
  RESOLUTION="1440x900"
fi

# Start vncserver
vncserver :1 -geometry $RESOLUTION -depth 24 && tail -F /root/.vnc/*.log


# End of file
