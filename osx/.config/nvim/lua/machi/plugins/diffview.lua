return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>hd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
    { "<leader>hh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>hH", "<cmd>DiffviewFileHistory<cr>", desc = "All history" },
    { "<leader>hc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
  },
  opts = {},
}
