local wezterm = require("wezterm")
local keybinds = require("keybinds")
require("events")

return {
	automatically_reload_config = true,
	window_background_opacity = 1.00,
	macos_window_background_blur = 0,
	window_decorations = "RESIZE",
	window_background_gradient = {
		colors = { "#000000" },
	},
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	colors = {
		background = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
		tab_bar = {
			background = "none",
			inactive_tab_edge = "none",
		},
	},
	leader = { key = "k", mods = "CTRL", timeout_milliseconds = 1000 },
	audible_bell = "SystemBeep",
	scrollback_lines = 10000,
	use_ime = true,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 15,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	keys = keybinds.keys,
	key_tables = keybinds.key_tables,
}
