#!/usr/bin/env bash

set -euo pipefail

WAL_COLORS_FILE="${HOME}/.cache/wal/colors.sh"

SPICETIFY_THEME_DIR="${HOME}/.config/spicetify/Themes/pywal-spicetify"
SPICETIFY_COLOR_INI="${SPICETIFY_THEME_DIR}/color.ini"

PRE_STATUS=""
if playerctl -p spotify status &> /dev/null; then
    PRE_STATUS=$(playerctl -p spotify status)
    echo "Initial Spotify status: $PRE_STATUS"
fi

set +u
source "$WAL_COLORS_FILE"
set -u

mkdir -p "$SPICETIFY_THEME_DIR"
cat > "$SPICETIFY_COLOR_INI" << EOF
[Setting]
current_theme           = pywal-spicetify
color_scheme            = pywal
inject_css              = 1
replace_colors          = 1
overwrite_assets        = 0

[Scheme:pywal]
main-fg                 = ${color7#\#}
secondary-fg            = ${color7#\#}
main-bg                 = ${color0#\#}
sidebar-bg              = ${color0#\#}
cover-overlay-and-shadow= ${color8#\#}
indicator-fg-and-button-bg= ${color1#\#}
pressing-fg             = ${color1#\#}
slider-bg               = ${color8#\#}
sidebar-indicator-and-hover-fg= ${color1#\#}
sidebar-navigation-fg   = ${color7#\#}
sidebar-text            = ${color7#\#}
player-bg               = ${color0#\#}
misc-bg                 = ${color8#\#}
shadow                  = ${color8#\#}
active-fg               = ${color1#\#}
pressing-button-fg      = ${color1#\#}
pressing-button-bg      = ${color8#\#}
selected-row            = ${color8#\#}
EOF

spicetify apply
sleep 6
if [[ "$PRE_STATUS" == "Playing" ]]; then
    echo "Resuming playback..."
    # Attempt to play. '|| true' prevents the script from failing if D-Bus is briefly unavailable.
    playerctl -p spotify play || true 
fi