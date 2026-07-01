{ pkgs, ... }:
pkgs.writeShellScriptBin "ros2-base-attacher" ''
  #!/usr/bin/env bash

  # Start a new kitty instance with a known socket
  kitty -o allow_remote_control=yes -o enabled_layouts=* --listen-on=unix:/tmp/mykitty --title 0 --single-instance &

  export KITTY_SOCKET=/tmp/mykitty

  KITTY_PID=$!
  # Wait for kitty socket to be initialized
  while [ ! -S /tmp/mykitty ]; do
      sleep 0.1
  done

  # Use the socket to launch kittens inside that instance
  kitty @ --to unix:/tmp/mykitty launch --title 1 --keep-focus bash
  kitty @ --to unix:/tmp/mykitty launch --title 2 --keep-focus bash
  kitty @ --to unix:/tmp/mykitty launch --title 3 --keep-focus bash

  # Set layout to fat (one large main line on the top and other windows stacked horizontally below)
  kitty @ --to unix:/tmp/mykitty goto-layout fat
  # Set layout to tall (one tall main column on the left and other windows stacked horizontally beside it)
  # kitty @ --to unix:/tmp/mykitty goto-layout tall

  # Send command to all windows
  kitty @ --to unix:/tmp/mykitty send-text --match all "attach_ros2_base\nclear\n"
  wait $KITTY_PID
''
