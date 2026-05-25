#!/bin/bash
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

for ((i = 0; i < 8; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

cava -p ~/.config/cava/polybar.conf | while read -r line; do
    echo "$line" | sed "$dict"
done

