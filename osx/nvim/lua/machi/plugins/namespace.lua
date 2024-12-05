return {
  "ccaglak/namespace.nvim",
  keys = {
    { "<leader>la", "<cmd>Php classes<cr>", desc = "GetClasses", silent = true },
    { "<leader>lc", "<cmd>Php class<cr>", desc = "GetClass", silent = true },
    { "<leader>ln", "<cmd>Php namespace<cr>", desc = "Namespace", silent = true },
    { "<leader>ls", "<cmd>Php sort<cr>", desc = "Sort Classes", silent = true },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("namespace").setup({
      ui = true,
      cacheOnload = false,
      dumpOnload = false,
      sort = {
        on_save = false,
        sort_type = "natural",
      },
    })
  end,
}
