#!/bin/sh

sketchybar --set $NAME label="$(df / | grep -E '^(/dev/disk3s1).' | awk '{ printf ("%s\n", $5) }')"
