local wezterm = require("wezterm")

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

return {
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
		-- pane navigation (Leader + h,j,k,l)
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		-- enter resize mode
		{
			key = "r",
			mods = "LEADER",
			action = wezterm.action({ ActivateKeyTable = { name = "resize_pane", one_shot = false } }),
		},
		-- scroll
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
		{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n") },
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
		{ key = "]", mods = "SUPER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "[", mods = "SUPER", action = wezterm.action({ ActivateTabRelative = -1 }) },
	},
	key_tables = {
		resize_pane = {
			{ key = "h", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
			{ key = "j", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
			{ key = "k", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
			{ key = "l", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	},
}
