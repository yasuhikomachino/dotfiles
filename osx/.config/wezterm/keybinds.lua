local wezterm = require("wezterm")

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
		-- pane resize
		{ key = "H", mods = "SUPER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "L", mods = "SUPER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "K", mods = "SUPER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "J", mods = "SUPER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	},
}
