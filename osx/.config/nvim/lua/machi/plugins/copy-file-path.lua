return {
  "mogulla3/copy-file-path.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>cp", "<Cmd>CopyRelativeFilePath<CR>", { noremap = true, silent = true, desc = "Copy relative file path" } },
  },
}
