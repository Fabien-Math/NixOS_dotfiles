{ pkgs, ... }:

pkgs.writeShellScriptBin "screen-record" ''
  XDG_VIDEOS_DIR="''${XDG_VIDEOS_DIR:-$HOME/Videos}"
  DIR="$XDG_VIDEOS_DIR/screen-record"

  mkdir -p "$DIR"

  print_error() {
    ${pkgs.libnotify}/bin/notify-send -e -t 2500 -u low \
    "Error while executing the script"
    cat <<EOF
  Usage: $(basename "$0") <action>
  Valid actions:
    a  : Select area
    m  : Select monitor
  EOF
    exit 1
  }

  timestamp=$(date +"%Y%m%d_%Hh%Mm%Ss")
  OUTPUT="$DIR/recording_$timestamp.mp4"

  if ${pkgs.procps}/bin/pidof wf-recorder > /dev/null; then
    ${pkgs.procps}/bin/pkill -INT wf-recorder
    ${pkgs.libnotify}/bin/notify-send -e -t 2500 -u low \
      "Recording Stopped" "Recording stop requested."
    exit 0
  fi

  case "$1" in
    a) REGION=$(${pkgs.slurp}/bin/slurp) || exit 1 ;;
    m) REGION=$(${pkgs.slurp}/bin/slurp -o) || exit 1 ;;
    *) print_error ;;
  esac

  [ -n "$REGION" ] || exit 1

  ${pkgs.wf-recorder}/bin/wf-recorder \
    --audio \
    -g "$REGION" \
    -f "$OUTPUT"

  ${pkgs.libnotify}/bin/notify-send -e -t 2500 -u low \
    "Recording Started" "Recording to $OUTPUT"
''
