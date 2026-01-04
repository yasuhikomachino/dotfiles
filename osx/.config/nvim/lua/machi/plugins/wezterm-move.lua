return {
  "letieu/wezterm-move.nvim",
  keys = {
    { "<C-h>", function() require("wezterm-move").move("h") end, desc = "Move to left pane" },
    { "<C-j>", function() require("wezterm-move").move("j") end, desc = "Move to lower pane" },
    { "<C-k>", function() require("wezterm-move").move("k") end, desc = "Move to upper pane" },
    { "<C-l>", function() require("wezterm-move").move("l") end, desc = "Move to right pane" },
  },
}
