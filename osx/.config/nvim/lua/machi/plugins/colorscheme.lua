return {
  "craftzdog/solarized-osaka.nvim",
  priority = 1000,
  config = function()
    require("solarized-osaka").setup({
      style = "night",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
      -- on_colors = function(colors)
      --   colors.bg = "#000000"
      -- end,
    })

    vim.cmd("colorscheme solarized-osaka")
  end,
}
