#!/bin/sh

# Restart pulseaudio, setup loopback
pulseaudio -k
pulseaudio --start
pactl load-module module-loopback latency_msec=1 source=1 sink=1

# Run m8c
SCRIPTDIR=$(cd "$(dirname "$0")" ; pwd -P)
SDL_VIDEODRIVER=x11 LD_PRELOAD=/usr/local/lib/libserialport.so.0 "$SCRIPTDIR/m8c"

# Restart pulseaudio again
pulseaudio -k
pulseaudio --start
