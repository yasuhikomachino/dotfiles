local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = false
config.colors = {
	background = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}
config.audible_bell = "Disabled"
config.scrollback_lines = 4096
config.use_ime = true
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 16

return config
