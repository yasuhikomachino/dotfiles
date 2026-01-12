local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#001419"
	local foreground = "#cccccc"

	if tab.is_active then
		background = "#002D39"
		foreground = "#cccccc"
	end

	local title = tab.tab_title
	if title == "" then
		title = tab.active_pane.title
	end

	-- パディング分を引いた最大幅でタイトルを切り詰める
	local padding = 3
	local max_title_width = max_width - (padding * 2)
	if #title > max_title_width then
		title = wezterm.truncate_right(title, max_title_width - 1) .. "…"
	end
	title = string.rep(" ", padding) .. title .. string.rep(" ", padding)

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)
