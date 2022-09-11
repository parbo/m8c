#!/bin/sh

pulseaudio -k
pulseaudio --start
pactl load-module module-loopback latency_msec=1 source=1 sink=1
SDL_VIDEODRIVER=x11 LD_PRELOAD=/usr/local/lib/libserialport.so.0 ./m8c
