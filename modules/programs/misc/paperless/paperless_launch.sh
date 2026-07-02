#!/usr/bin/env bash

firefox -P Paperless --kiosk http://localhost:28981 &
sleep 1 &&
hyprctl eval "
for _, w in pairs(hl.get_windows()) do
    if w.title and w.class
        and w.title:lower():find(\"paperless\")
        and w.class:lower() == \"firefox\" then

    print(\"MATCH:\", w.title, \"| class:\", w.class)

    hl.dispatch(
        hl.dsp.window.fullscreen_state({
        internal = 0,
        client = 0,
        window = w
        })
    )
    end
end
"
