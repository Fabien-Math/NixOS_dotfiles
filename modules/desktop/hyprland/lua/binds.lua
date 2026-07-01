-- Resize windows
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Resize windows with hjkl keys
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Move/Resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Functional keybinds
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 2%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +2%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 2"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 2"), { repeating = true })
hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend")) -- Put computer into sleep mode
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t")) -- mute mic
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t")) -- mute audio
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause")) -- Play/Pause media
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause")) -- Play/Pause media
hl.bind("xf86AudioNext", hl.dsp.exec_cmd("playerctl next")) -- go to next media
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd("playerctl previous")) -- go to previous media


-- =========================
-- HELP / UTILITIES
-- =========================

hl.bind(mainMod .. " + question", hl.dsp.exec_cmd("keybinds-yad"))
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd("keybinds-yad"))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("keybinds-yad"))
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.exec_cmd("keybinds-inputrc"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("keybinds-kitty"))

hl.bind(mainMod .. " + F8",
    hl.dsp.exec_cmd("kill $(cat /tmp/auto-clicker.pid) 2>/dev/null || autoclicker --cps 40"))

hl.bind(mainMod .. " + F9",
    hl.dsp.exec_cmd("hyprsunset --temperature 3500"))

hl.bind(mainMod .. " + F10",
    hl.dsp.exec_cmd("pkill hyprsunset"))

-- =========================
-- WINDOW / SESSION
-- =========================

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.kill())
hl.bind(mainMod .. " + delete", hl.dsp.exit()) -- kill hyperland session
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" })) -- toggle the window on focus to float
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.toggle()) -- toggle the window on focus to group
hl.bind("ALT + return", hl.dsp.window.fullscreen()) -- toggle the window on focus to fullscreen
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + backspace", hl.dsp.exec_cmd("pkill -x wlogout || wlogout -b 4"))
hl.bind("CTRL + ESCAPE", hl.dsp.exec_cmd("pkill waybar || waybar"))

hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.exec_cmd("zoom in"))
hl.bind(mainMod .. " + CTRL + mouse_up", hl.dsp.exec_cmd("zoom out"))

-- =========================
-- APPLICATIONS
-- =========================

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code_editor .. " --password-store=basic"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(term .. " -e ros2-base-attacher"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser .. " -P Work"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(browser .. " -P Home"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("spotify"))


hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(term .. " -e btop"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("hyprpicker --autocopy --format=hex"))

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("launcher drun"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("launcher drun"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("launcher wallpaper"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("launcher emoji"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("launcher symbols"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("launcher tmux"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("launcher games"))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("launcher window"))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd(keyboardswitch))

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("swaync-client -t -sw"))

hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("gamemode"))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipmanager))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(monitorswitch))

-- =========================
-- LAYOUT CHANGE
-- =========================

local layouts = { "dwindle", "scrolling" }
local workspace_layouts = {}

local function next_layout()
    local special = hl.get_active_special_workspace()
    local ws = special or hl.get_active_workspace()
    local ws_key = ws.id

    local current = workspace_layouts[ws_key] or 1
    local next_idx = (current % #layouts) + 1
    workspace_layouts[ws_key] = next_idx
    hl.dispatch(hl.dsp.exec_raw(
        "hyprctl eval 'hl.workspace_rule({ workspace = \"" ..
        ws.name .. "\", layout = \"" .. layouts[next_idx] .. "\" })'"
    ))
end
hl.bind(mainMod .. " + F1", next_layout)


-- =========================
-- SCREENSHOTS
-- =========================

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("screen-record a"))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("screen-record m"))
hl.bind(mainMod .. " + P",  hl.dsp.exec_cmd(screenshot .. " s"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd(screenshot .. " sf"))
hl.bind(mainMod .. " + print", hl.dsp.exec_cmd(screenshot .. " m"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(screenshot .. " p"))

-- =========================
-- FLOATING WINDOW CYCLING
-- =========================

hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("hyprctl dispatch bringactivetotop"))

-- =========================
-- WORKSPACES
-- =========================
local workspaceKeys = {
    { 1,  "ampersand"  },
    { 2,  "eacute"     },
    { 3,  "quotedbl"   },
    { 4,  "apostrophe" },
    { 5,  "parenleft"  },
    { 6,  "minus"      },
    { 7,  "egrave"     },
    { 8,  "underscore" },
    { 9,  "ccedilla"   },
    { 10, "agrave"     },
}

for _, ws in ipairs(workspaceKeys) do
    local i = ws[1]
    local key = ws[2]

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))

    hl.bind(mainMod .. " + CTRL + " .. key,
        hl.dsp.window.move({ workspace = i, follow = false }))
end

-- =========================
-- FOCUS MOVEMENT
-- =========================

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

hl.bind("ALT + Tab", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))


-- =========================
-- WORKSPACE SCROLL (mouse)
-- =========================

hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }))


-- =========================
-- RELATIVE WINDOW MOVES
-- =========================

hl.bind(mainMod .. " + CTRL + ALT + right",
    hl.dsp.window.move({ workspace = "r+1" }))

hl.bind(mainMod .. " + CTRL + ALT + left",
    hl.dsp.window.move({ workspace = "r-1" }))

-- Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "r-1" }))

-- move to the first empty workspace instantly with mainMod + CTRL + [↓]
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }))


-- =========================
-- WINDOW MOVEMENT
-- =========================

hl.bind(mainMod .. " + SHIFT + CTRL + left",
    hl.dsp.window.move({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + CTRL + right",
    hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + CTRL + up",
    hl.dsp.window.move({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + CTRL + down",
    hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + CTRL + h",
    hl.dsp.window.move({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + CTRL + l",
    hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + CTRL + k",
    hl.dsp.window.move({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + CTRL + j",
    hl.dsp.window.move({ direction = "d" }))


-- =========================
-- SCRATCHPAD
-- =========================
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))


-- =========================
-- MOUSE BINDS
-- =========================

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Rebuild NixOS with a KeyBind
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(term .. " -e rebuild"))
