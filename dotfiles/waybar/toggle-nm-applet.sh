#!/bin/bash

if pgrep -x "nm-applet" > /dev/null; then
    # If nm-applet is running, kill it
    pkill -x "nm-applet"
else
    # If not running, launch it
    nm-applet --indicator &
fi