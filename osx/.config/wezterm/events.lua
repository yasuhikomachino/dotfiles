local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#001419"
	local foreground = "#cccccc"

	if tab.is_active then
		background = "#D79A22"
		foreground = "#282828"
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
