return {
  "terryma/vim-expand-region",

  config = function()
    local keymap = vim.keymap
    keymap.set("v", "v", "<Plug>(expand_region_expand)", { silent = true })
    keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)", { silent = true })
  end,
}
