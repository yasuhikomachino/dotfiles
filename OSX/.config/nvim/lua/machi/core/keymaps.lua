vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits window size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Clipboard
keymap.set("v", "<Leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
keymap.set("v", "<Leader>d", '"+d', { noremap = true, silent = true, desc = "Cut to system clipboard" })
keymap.set("v", "<Leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard (after cursor)" })
keymap.set("v", "<Leader>P", '"+P', { noremap = true, silent = true, desc = "Paste from system clipboard (before cursor)" })
keymap.set("n", "<Leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard (after cursor)" })
keymap.set("n", "<Leader>P", '"+P', { noremap = true, silent = true, desc = "Paste from system clipboard (before cursor)" })

-- Indent
keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Move the current line up or down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines up or down in visual mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
