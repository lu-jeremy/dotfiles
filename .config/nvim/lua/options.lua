local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.wrap = true
opt.linebreak = true
opt.laststatus = 3

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Behavior
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
opt.updatetime = 250
opt.timeoutlen = 500

-- Clipboard (use system clipboard via OSC 52 — works over SSH + tmux)
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Misc
opt.mouse = "a"
opt.iskeyword:append("-")

-- Create undodir if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/undodir"), "p")
