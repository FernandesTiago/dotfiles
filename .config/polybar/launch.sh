#!/bin/bash
killall polybar 2>/dev/null
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar mybar 2>&1 | tee -a /tmp/polybar.log &
