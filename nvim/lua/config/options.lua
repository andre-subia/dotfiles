local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- ui
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
-- crosshair cursor: horizontal + vertical guide on the cursor position.
-- autocmds.lua keeps it to the active window only.
opt.cursorline = true
opt.cursorcolumn = true
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- indent
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- editing
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true

-- windows
opt.winminwidth = 5

vim.o.laststatus = 3
