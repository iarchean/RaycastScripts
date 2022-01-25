#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title IPCALC
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🖥
# @raycast.argument1 { "type": "text", "placeholder": "IP Address"}
# @raycast.argument2 { "type": "text", "placeholder": "Network Mask", "optional": true}
# @raycast.packageName IP Netmask Utils

# Documentation:
# @raycast.description Shows the information of IP address, if not specifed, shows your macOS's internal and internet IP.
# @raycast.author Archean Zhang 
# @raycast.authorURL https://archeanz.com

export LC_ALL=C
perl ipcalc $1 $2