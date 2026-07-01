{ pkgs, ... }:
pkgs.writeShellScriptBin "monitorswitch" ''
  #!/usr/bin/env bash
  set -euo pipefail

  MON0="Chimei Innolux Corporation 0x1521"
  MON1="Lenovo Group Limited P24QD-40 VKVK5787"
  MON2="Lenovo Group Limited P24q-30 V90EZ1NZ"
  MON3="Iiyama North America PL3484WQ 1251650400525"

  get_connected() {
    hyprctl monitors -j | jq -r '.[] | .description // .name'
  }

  has() {
    echo "$CONNECTED" | grep -Fxq "$1"
  }

  eval_monitor() {
    hyprctl eval "$1"
  }

  apply() {
    CONNECTED="$(get_connected)"

    has0=0; has1=0; has2=0; has3=0
    has "$MON0" && has0=1
    has "$MON1" && has1=1
    has "$MON2" && has2=1
    has "$MON3" && has3=1

    # reset baseline (enable all known outputs first)
    eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = false })'
    eval_monitor 'hl.monitor({ output = "desc:'"$MON1"'", disabled = false })'
    eval_monitor 'hl.monitor({ output = "desc:'"$MON2"'", disabled = false })'
    eval_monitor 'hl.monitor({ output = "desc:'"$MON3"'", disabled = false })'

    # 3-monitor layout
    if [[ $has0 -eq 1 && $has1 -eq 1 && $has2 -eq 1 ]]; then
      eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = false })'
      eval_monitor 'hl.monitor({ output = "desc:'"$MON1"'", disabled = false })'
      eval_monitor 'hl.monitor({ output = "desc:'"$MON2"'", disabled = false })'

    # laptop + 1 external
    elif [[ $has0 -eq 1 && $has1 -eq 1 ]]; then
      eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = false })'
      eval_monitor 'hl.monitor({ output = "desc:'"$MON1"'", disabled = false })'

    elif [[ $has0 -eq 1 && $has2 -eq 1 ]]; then
      eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = false })'
      eval_monitor 'hl.monitor({ output = "desc:'"$MON2"'", disabled = false })'

    # ultrawide only (disable laptop)
    elif [[ $has0 -eq 1 && $has3 -eq 1 ]]; then
      eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = true })'
      eval_monitor 'hl.monitor({ output = "desc:'"$MON3"'", disabled = false, mode = "preferred"})'

    # fallback laptop only
    else
      eval_monitor 'hl.monitor({ output = "desc:'"$MON0"'", disabled = false })'
    fi
  }

  apply
''
