#!/bin/bash
trap 'exit;' INT
love . &
while true; do
  find . -name "*.lua" | xargs -- inotifywait --event modify
  killall love
  love . &
done



