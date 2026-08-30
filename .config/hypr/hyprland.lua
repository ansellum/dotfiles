-- hyprland.lua
-- Converted from hyprland.conf to Hyprland 0.55+ Lua config format.
-- Refer to the wiki for more information:
-- https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "eDP-1",
	mode = "2256x1504@60",
	position = "0x0",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi -i --show drun"
local notes = "obsidian"
local discord = "discord"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- hl.exec_cmd() spawns an async process; no need for & or disown.
-- NOTE: workspace-targeting on launch (e.g. [workspace 1]) is not yet
-- directly supported in the Lua autostart API. As a workaround, a
-- workspace rule is applied per window class below.
hl.on("hyprland.start", function()
	hl.exec_cmd("zen-browser")
	-- hl.exec_cmd(notes)
	-- hl.exec_cmd(discord)
	-- hl.exec_cmd("spotify-launcher")

	-- Hyprland utilities
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpaper")
	-- hl.exec_cmd("swww-daemon")

	-- Authentication polkit
	-- hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Screensharing
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Dark Mode (GTK)
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-lavender-standard+default"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("DISPLAY", ":0")
-- hl.env("XDG_RUNTIME_DIR",        "/run/user/$UID")
-- hl.env("DBUS_SESSION_BUS_ADDRESS","unix:path=${XDG_RUNTIME_DIR}/bus")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	cursor = {
		no_hardware_cursors = true,
	},

	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,

		col = {
			-- Catppuccin Mocha: blue → mauve gradient at 45°
			active_border = { colors = { "rgba(b4befeee)", "rgba(cba6f7ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		-- pseudotile    = true,  -- bound to mainMod + D below
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		accel_profile = "flat",
		-- scroll_factor = 2.0,

		touchpad = {
			disable_while_typing = true,
			scroll_factor = 1,
			natural_scroll = true,
			tap_to_click = false,
		},
	},

	gestures = {
		-- workspace_swipe        = true,
		workspace_swipe_distance = 500,
	},
})

-----------------------
---- ANIMATIONS -------
-----------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-----------------
---- DEVICES ----
-----------------

-- Laptop w/ MX Anywhere 3
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name = "logitech-mx-anywhere-3",
	-- sensitivity = -0.5,
	accel_profile = "flat",
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- Core actions
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + D", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + H", hl.dsp.layout("togglesplit")) -- dwindle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9], move window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-----------------------------
-- MARCHE'S BINDS
-----------------------------

-- Screenshots
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprshot -m window -r - | swappy -f -"))
hl.bind("SHIFT + " .. mainMod .. " + P", hl.dsp.exec_cmd("hyprshot -m region -r - | swappy -f -"))

-- Applications
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))

-- Waybar visibility
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- Multimedia keys (locked = works on locked screen, repeating = held key repeats)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Media control (requires playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Power / Zoom
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("hypr-zoom -easing=OutBack -easingOut=OutExpo"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Floating rules (uncomment to enable)
-- hl.window_rule({ name = "float-prismlauncher", match = { class = "prismlauncher" }, float = true })
-- hl.window_rule({ name = "float-ark",           match = { class = "ark"           }, float = true })
-- hl.window_rule({ name = "float-via",           match = { class = "via"           }, float = true })
-- hl.window_rule({ name = "float-kitty",         match = { class = "kitty"         }, float = true })
-- hl.window_rule({ name = "float-localsend",     match = { class = "localsend"     }, float = true })
-- hl.window_rule({ name = "float-puddletag",     match = { class = "puddletag"     }, float = true })
-- hl.window_rule({ name = "float-love",          match = { class = "love"          }, float = true })

-- Opacity rules (uncomment to enable)
-- hl.window_rule({ name = "opacity-kitty",  match = { class = "kitty"  }, active_opacity = 0.9, inactive_opacity = 0.9 })
-- hl.window_rule({ name = "opacity-thunar", match = { class = "thunar" }, active_opacity = 0.9, inactive_opacity = 0.9 })
-- hl.window_rule({ name = "opacity-ark",    match = { class = "ark"    }, active_opacity = 0.9, inactive_opacity = 0.9 })

-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     name       = "fix-xwayland-drags",
--     match      = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus   = true,
-- })

-- Workspace assignments
-- hl.workspace_rule({ workspace = 1, monitor = "eDP-1" }) -- $left
-- hl.workspace_rule({ workspace = 2, monitor = "eDP-1" }) -- $left
-- hl.workspace_rule({ workspace = 3, monitor = "HDMI-A-1" }) -- $right
-- hl.workspace_rule({ workspace = 4, monitor = "HDMI-A-1" }) -- $right
-- hl.workspace_rule({ workspace = 5, monitor = "HDMI-A-1" }) -- $right

-- Autostart workspace hints (replaces [workspace N silent] from exec-once)
-- zen-browser → workspace 1, discord → workspace 5 (silent)
-- hl.window_rule({ name = "ws1-zen", match = { class = "zen%-browser" }, workspace = "1" })
-- hl.window_rule({ name = "ws5-discord", match = { class = "discord" }, workspace = "5 silent" })
