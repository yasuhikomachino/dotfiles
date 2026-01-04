local wezterm = require("wezterm")

local function is_vim(pane)
	local process_name = pane:get_foreground_process_name()
	if process_name then
		local name = string.gsub(process_name, "(.*[/\\])(.*)", "%2")
		return name == "nvim" or name == "vim"
	end
	return false
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function pane_move(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action({ SendKey = { key = key, mods = "CTRL" } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			end
		end),
	}
end

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
		-- pane navigation (integrates with neovim via wezterm-move.nvim)
		pane_move("h"),
		pane_move("j"),
		pane_move("k"),
		pane_move("l"),
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
