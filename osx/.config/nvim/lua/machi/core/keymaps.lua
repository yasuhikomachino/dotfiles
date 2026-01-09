vim.g.mapleader = " "
vim.g.winresizer_start_key = "<leader>r"

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode" })
keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("i", "っｊ", "<ESC>", { desc = "Exit insert mode" })
keymap.set("t", "っｊ", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "q", "b", { silent = true, desc = "Move to the beginning of the previous word" })
keymap.set("n", "<C-s>", ":w<CR>", { silent = true, desc = "Save current buffer" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits window size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- clipboard
keymap.set("v", "<Leader>y", '"+y', { silent = true, desc = "Copy to system clipboard" })
keymap.set("v", "<Leader>d", '"+d', { silent = true, desc = "Cut to system clipboard" })
keymap.set("v", "<Leader>p", '"+p', { silent = true, desc = "Paste from system clipboard (after cursor)" })
keymap.set("v", "<Leader>P", '"+P', { silent = true, desc = "Paste from system clipboard (before cursor)" })
keymap.set("n", "<Leader>p", '"+p', { silent = true, desc = "Paste from system clipboard (after cursor)" })
keymap.set("n", "<Leader>P", '"+P', { silent = true, desc = "Paste from system clipboard (before cursor)" })
keymap.set("n", "<Leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative path to clipboard" })
keymap.set("n", "<Leader>yP", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy full path to clipboard" })
keymap.set("n", "<Leader>yf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy filename to clipboard" })

-- move the current line up or down
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { silent = true })
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { silent = true })

-- move selected lines up or down in visual mode
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })

-- window resize
keymap.set("n", "<A-h>", ":vertical resize -5<CR>", { silent = true, desc = "Resize window left" })
keymap.set("n", "<A-l>", ":vertical resize +5<CR>", { silent = true, desc = "Resize window right" })
keymap.set("n", "<A-k>", ":resize +5<CR>", { silent = true, desc = "Resize window up" })
keymap.set("n", "<A-j>", ":resize -5<CR>", { silent = true, desc = "Resize window down" })

-- buffer
keymap.set("n", "<Leader>bl", ":<C-u>ls<CR>:buffer<Space>", { silent = true })
keymap.set("n", "<Leader>bp", ":bprevious<CR>", { silent = true })
keymap.set("n", "<Leader>bn", ":bnext<CR>", { silent = true })
keymap.set("n", "<Leader>bb", ":b#<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Go to previous buffer" })
keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Go to next buffer" })
