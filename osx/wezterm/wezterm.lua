local wezterm = require("wezterm")

return {
	automatically_reload_config = true,
	colors = {
		background = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
	},
	audible_bell = "Disabled",
	scrollback_lines = 10000,
	use_ime = true,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 15,
	keys = {
		{
			key = "Enter",
			mods = "SUPER",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "Enter",
			mods = "SUPER|SHIFT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "h",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "u",
			mods = "SUPER",
			action = wezterm.action({ ScrollByPage = -0.25 }),
		},
		{
			key = "d",
			mods = "SUPER",
			action = wezterm.action({ ScrollByPage = 0.25 }),
		},
		-- tab
		{ key = "1", mods = "SUPER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "SUPER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "SUPER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "SUPER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "SUPER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "SUPER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "SUPER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "SUPER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "SUPER", action = wezterm.action({ ActivateTab = 8 }) },
	},
}
