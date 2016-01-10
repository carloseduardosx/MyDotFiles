#!/bin/bash

PID=$(ps -fe | grep "[A]ndroid File Transfer Agent" | awk '{print $2}')

if [[ -n $PID ]]; then
  kill $PID
fi

mv "/Applications/Android File Transfer.app/Contents/Resources/Android File Transfer Agent.app" "/Applications/Android File Transfer.app/Contents/Resources/Android File Transfer Agent DISABLED.app"
mv "${HOME}/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app" "${HOME}/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent DISABLED.app"

osascript -e 'tell application "System Events" to delete every login item whose name is "Android File Transfer Agent"'
