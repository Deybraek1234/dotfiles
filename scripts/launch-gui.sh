#!/bin/bash
# Execute the command in the background, disown it, and silence output
nohup "$@" > /dev/null 2>&1 & disown
