#!/bin/bash

# ================================================================
# Script to generate a starship.toml configuration from a Pywal theme.
# This script requires 'jq' to be installed for JSON processing.
# ================================================================

# --- Configuration ---
# Path to your Pywal colors.json file
pywal_colors_path="${HOME}/.cache/wal/colors.json"

# Path where you want to save the generated starship.toml file
starship_config_path="${HOME}/.config/starship.toml"

# --- Starship.toml Template (multiline string) ---
# This is a basic template. You can customize it with more modules and settings.
# The placeholders will be replaced with Pywal's hex codes.
# This uses a 'here document' to define the template.
starship_template=$(cat <<'EOF'
# ~/.config/starship.toml

# Use custom format
format = """\
[]({color8})\
[ ](bg:{color8} fg:{color7})\
$directory\
[](fg:{color8} bg:{color5})\
$username\
[](fg:{color5})\
$hostname\
$cmd_duration\
$jobs\
$fill\
$time\
$sudo
$character"""
command_timeout = 2000
scan_timeout = 500
add_newline = true


[character]
success_symbol = '[λ](bold {color7}) '
error_symbol = ' [Δ](bold {color9}) '

[directory]
truncation_length = 3
truncation_symbol = '.../'
read_only = '  '
format = '[$path](fg:{color7} bg:{color8})'

[fill]
symbol = " "

[cmd_duration]
min_time = 5
format = "[  $duration ]($style)"
style = "{color15}"

[hostname]
ssh_only=false
ssh_symbol= ''
format = ' [$ssh_symbol$hostname]({color15}) in'

[jobs]
symbol_threshold = 1
number_threshold = 2
symbol = '󱐌'
format = '[$symbol$number]({color15})'

[username]
style_root = '{color15}'
style_user = '{color0}'
show_always = true
format = '[$user]($style bg:{color13})'

[time]
disabled = false
format = '[$time]({color7})'
use_12hr = true
time_format = '%T'
utc_time_offset = 'local'

[sudo]
symbol = ' 󰐼 '
disabled = false
format = '[$symbol]($style)'
style = '{color3}'

EOF
)

# --- Script Logic ---

# Check if the pywal colors file exists
if [ ! -f "$pywal_colors_path" ]; then
    echo "Error: Pywal colors file not found at ${pywal_colors_path}"
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' is not installed. Please install it to use this script."
    exit 1
fi

# Read all 16 colors from the JSON file into an array
# We use 'jq -r' to get raw strings without quotes.
for i in {0..15}; do
    color_hex=$(jq -r ".colors.color${i}" "$pywal_colors_path")
    if [ -z "$color_hex" ]; then
        echo "Error: Could not extract color${i} from ${pywal_colors_path}"
        exit 1
    fi
    # Create an associative array to store the colors
    declare -A colors
    colors["color${i}"]="$color_hex"
done

# Replace the placeholders in the template with the actual colors
new_config="$starship_template"
for i in {0..15}; do
    new_config=$(echo "$new_config" | sed "s/{color${i}}/${colors["color${i}"]}/g")
done

# Write the new configuration to the starship.toml file
echo "$new_config" > "$starship_config_path"
echo "Successfully generated new starship.toml at ${starship_config_path}"
