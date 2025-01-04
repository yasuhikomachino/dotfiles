local opt = vim.opt

-- basics
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitive

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, ent of line or insert mode start position

-- window opening direction
opt.splitright = true
opt.splitbelow = true

-- ignore automatic formatting and save
vim.api.nvim_create_user_command("W", "noautocmd w", {})
