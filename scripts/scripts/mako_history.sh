#!/bin/bash

# Check for any active notifications.
# makoctl list returns content only if there are notifications currently visible.
active_notifs=$(makoctl list)

# Check for any notifications in the history.
# makoctl history returns content if there are notifications to be restored.
history_notifs=$(makoctl history)

# Check if there are notifications to restore.
# The script prioritizes restoring from history if the history is not empty and no notifications are active.
if [ -n "$history_notifs" ] && [ -z "$active_notifs" ]; then
    # Case 1: Notifications are in history and none are currently active.
    # We can restore the last 3.
    for i in {1..3}; do
        makoctl restore
    done
elif [ -n "$active_notifs" ]; then
    # Case 2: Notifications are currently active.
    # We will dismiss the last 3 active ones.
    active_ids=$(makoctl list | jq '.[].id' | head -n 3)
    for i in {1..3}; do
	makoctl dismiss
        done
    fi
else
    # Case 3: No notifications in history or active.
    notify-send "Mako Notifications" "No notifications to restore or dismiss."
fi
