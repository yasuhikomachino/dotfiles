return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
      skip_tags = {
        "area",
        "base",
        "br",
        "col",
        "command",
        "embed",
        "hr",
        "img",
        "slot",
        "input",
        "keygen",
        "link",
        "meta",
        "param",
        "source",
        "track",
        "wbr",
        "menuitem",
      },
    })
  end,
}