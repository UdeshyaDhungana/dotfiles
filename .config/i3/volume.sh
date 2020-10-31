#!/usr/bin/env bash

function get_volume {
  #Get volume
  amixer get Master | grep % | awk '{print $4}' | sed 's/[^0-9]//g'
}

function send_volume {
  icon=""
  volume=$(get_volume)
  bar=$(seq -s "─" 0 $((volume / 5)) | sed 's/[0-9]//g')
  # Send the notification
  dunstify -r 6666 -u normal -t 2000 "$icon $volume $bar"
}

send_volume
