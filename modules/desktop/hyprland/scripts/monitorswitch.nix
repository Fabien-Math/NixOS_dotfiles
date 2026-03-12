{ pkgs, ... }:
pkgs.writeShellScriptBin "monitorswitch" ''
  #!/usr/bin/env bash

  # Monitor defaults
  MON0="Chimei Innolux Corporation 0x1521"
  MON0_CONF="1920x1080@60.02"

  MON1="Lenovo Group Limited P24QD-40 VKVK5787"
  MON1_CONF="2560x1440@60.0"

  MON2="Lenovo Group Limited P24q-30 V90EZ1NZ"
  MON2_CONF="2560x1440@60.0"

  MON3="Iiyama North America PL3484WQ 1251650400525"
  MON3_CONF="3440x1440@60.0"

  # Function to detect connected monitors
  check_monitors() {

    connected=$(hyprctl monitors -j | jq -r '.[] | .description // .name')

    has0=$(echo "$connected" | grep -Fx "$MON0" > /dev/null && echo 1 || echo 0)
    has1=$(echo "$connected" | grep -Fx "$MON1" > /dev/null && echo 1 || echo 0)
    has2=$(echo "$connected" | grep -Fx "$MON2" > /dev/null && echo 1 || echo 0)
    has3=$(echo "$connected" | grep -Fx "$MON3" > /dev/null && echo 1 || echo 0)

    # Apply rules with fixed configurations
    if [ "$has0" -eq 1 ] && [ "$has1" -eq 1 ] && [ "$has2" -eq 1 ]; then
      hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto-center-left,1.0"
      hyprctl keyword monitor "desc:$MON1,$MON1_CONF,auto-center,1.0"
      hyprctl keyword monitor "desc:$MON2,$MON2_CONF,auto-center-right1.0"
    elif [ "$has0" -eq 1 ] && [ "$has1" -eq 1 ]; then
      hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto,1.0"
      hyprctl keyword monitor "desc:$MON1,$MON1_CONF,auto-center-up,1.0"
    elif [ "$has0" -eq 1 ] && [ "$has2" -eq 1 ]; then
      hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto,1.0"
      hyprctl keyword monitor "desc:$MON2,$MON2_CONF,auto-center-up,1.0"
    elif [ "$has0" -eq 1 ] && [ "$has3" -eq 1 ]; then
      hyprctl keyword monitor "desc:$MON0,disable"
      hyprctl keyword monitor "desc:$MON3,$MON3_CONF,1.0"
    else
      hyprctl keyword monitor "desc:$MON0,$MON0_CONF,1.0"
    fi
  }

  # Initial check at startup
  check_monitors

  # Listen for hotplug events
  # socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  #   case "$line" in
  #     monitoradded*|monitorremoved*)
  #       sleep 2.0
  #       check_monitors
  #       ;;
  #   esac
  # done

''


### DEBUG VERSION
# #!/usr/bin/env bash
# # Monitor defaults
# MON0="Chimei Innolux Corporation 0x1521"
# MON0_CONF="1920x1080@60.02"

# MON1="Lenovo Group Limited P24QD-40 VKVK5787"
# MON1_CONF="2560x1440@60.0"

# MON2="Lenovo Group Limited P24q-30 V90EZ1NZ"
# MON2_CONF="2560x1440@60.0"

# MON3="Iiyama North America PL3484WQ 1251650400525"
# MON3_CONF="3440x1440@60.0"

# # Function to detect connected monitors
# check_monitors() {
#   echo "=== Checking connected monitors ==="

#   connected=$(hyprctl monitors -j | jq -r '.[] | .description // .name')
#   echo "Connected monitors:"
#   echo "$connected"

#   has0=$(echo "$connected" | grep -Fx "$MON0" > /dev/null && echo 1 || echo 0)
#   has1=$(echo "$connected" | grep -Fx "$MON1" > /dev/null && echo 1 || echo 0)
#   has2=$(echo "$connected" | grep -Fx "$MON2" > /dev/null && echo 1 || echo 0)
#   has3=$(echo "$connected" | grep -Fx "$MON3" > /dev/null && echo 1 || echo 0)

#   echo "Detection flags: 0=$has0, 1=$has1, 2=$has2, 3=$has3"


#   # Apply rules with fixed configurations
#   if [ "$has0" -eq 1 ] && [ "$has1" -eq 1 ] && [ "$has2" -eq 1 ]; then
#     echo "Applying layout: 0,1,2"
#     hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto-center-left,1.0"
#     hyprctl keyword monitor "desc:$MON1,$MON1_CONF,auto-center,1.0"
#     hyprctl keyword monitor "desc:$MON2,$MON2_CONF,auto-center-right1.0"
#   elif [ "$has0" -eq 1 ] && [ "$has1" -eq 1 ]; then
#     echo "Applying layout: 0 and 1"
#     hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto,1.0"
#     hyprctl keyword monitor "desc:$MON1,$MON1_CONF,auto-center-up,1.0"
#   elif [ "$has0" -eq 1 ] && [ "$has2" -eq 1 ]; then
#     echo "Applying layout: 0 and 2"
#     hyprctl keyword monitor "desc:$MON0,$MON0_CONF,auto,1.0"
#     hyprctl keyword monitor "desc:$MON2,$MON2_CONF,auto-center-up,1.0"
#   elif [ "$has0" -eq 1 ] && [ "$has3" -eq 1 ]; then
#     echo "Applying layout: 0 and 3"
#     hyprctl keyword monitor "desc:$MON0,disable"
#     hyprctl keyword monitor "desc:$MON3,$MON3_CONF,1.0"
#   elif [ "$has0" -eq 1 ]; then
#     echo "Applying layout: only 0"
#     hyprctl keyword monitor "desc:$MON0,$MON0_CONF,1.0"
#   else
#     echo "No known monitors connected or no rules applied"
#   fi

#   echo "=== Layout applied ==="
# }

# # Initial check at startup
# echo "Running initial monitor check..."
# check_monitors

# # Listen for hotplug events
# echo "Listening for monitor hotplug events..."
# socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
#   case "$line" in
#     monitoradded*|monitorremoved*)
#       echo "Hotplug event detected: $line"
#       sleep 2.0
#       check_monitors
#       ;;
#   esac
# done
