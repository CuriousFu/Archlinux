#!/bin/bash

# One of the following: xrandr, xbacklight, kernel
METHOD="xrandr"

MIN_VALUE=0.3
MAX_VALUE=1

device="${BLOCK_INSTANCE:-primary}"
xrandrOutput=$(xrandr --verbose)

if [[ "${device}" = "primary" ]]; then
  device=$(echo "${xrandrOutput}" | grep 'primary' | head -n 1 | awk -F ' ' '{print $1}')
fi

curBrightness=$(echo "${xrandrOutput}" | grep "${device}" -A 5 | grep -i "Brightness" | awk -F ':' '{print $2}')

# Scroll Up 
if [[ "${BLOCK_BUTTON}" -eq 4 ]]; then
  curBrightness=$(bc -l <<< "scale = 1 ; $curBrightness+0.1")
  if (( $(echo "$curBrightness > $MAX_VALUE" | bc -l) )); then
    curBrightness=${MAX_VALUE}
  fi
  xrandr --output LVDS-1 --brightness ${curBrightness}
# Scroll down
elif [[ "${BLOCK_BUTTON}" -eq 5 ]]; then
  curBrightness=$(bc -l <<< "scale = 1 ; $curBrightness-.1")
  if (( $(echo "$curBrightness < $MIN_VALUE" | bc -l) )); then
    curBrightness=${MIN_VALUE}
  fi
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
  if (( $(echo "$curBrightness >= $MAX_VALUE" | bc -l) )); then
    curBrightness=${MIN_VALUE}
  else
    curBrightness=${MAX_VALUE}
  fi
fi
  
xrandr --output LVDS-1 --brightness ${curBrightness} 

percent=$(echo "scale=0;${curBrightness} * 100" | bc -l)
percent=${percent%.*}

echo -e "\uf0eb ${percent}%"
echo "${percent}%"
echo ""