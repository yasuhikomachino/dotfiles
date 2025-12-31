local wezterm = require("wezterm")
local keybinds = require("keybinds")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local title = tab.tab_title
	if title == "" then
		title = tab.active_pane.title
	end
	title = "   " .. title .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

return {
	automatically_reload_config = true,
	window_background_opacity = 0.85,
	macos_window_background_blur = 20,
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
}
