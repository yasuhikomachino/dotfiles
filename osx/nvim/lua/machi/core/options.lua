vim.cmd("let g:netrw_liststyle=3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, ent of line or insert mode start position

-- clipboard
opt.splitright = true
opt.splitbelow = true

-- Ignore automatic formatting and save
vim.api.nvim_create_user_command("W", "noautocmd w", {})
