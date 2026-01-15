return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = false,
        show_close_icon = false,
        close_command = function(bufnum)
          require("mini.bufremove").delete(bufnum, false)
        end,
      },
    },
    keys = {
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    },
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
