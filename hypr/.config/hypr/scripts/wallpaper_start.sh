#!/usr/bin/env bash

default="/home/drakcoder/Documents/wallpapers/vader_conflicted.jpg"

swww-daemon -q &
sleep 0.5
swww img $default
wal -i $default
