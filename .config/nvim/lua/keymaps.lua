local map = vim.keymap.set

-- C-c acts as Esc everywhere
map("i", "<C-c>", "<Esc>")

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window resizing
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Keep visual selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- J keeps cursor position
map("n", "J", "mzJ`z")

-- Paste without overwriting register
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
map("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
map("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Quick close buffer
map("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

-- Quickfix navigation
map("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix" })
map("n", "[q", ":cprev<CR>zz", { desc = "Prev quickfix" })

-- Diagnostic navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Terminal (opens in a bottom split so :q doesn't kill nvim)
map("n", "<leader>tt", ":belowright split | terminal<CR>i", { desc = "Open terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
