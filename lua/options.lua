require "nvchad.options"

local o = vim.o

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 3

-- Navigation and editing
o.scrolloff = 8
o.sidescrolloff = 8
o.smoothscroll = true
o.inccommand = "split"
o.virtualedit = "block"
o.confirm = true

-- Appearance
o.winborder = "rounded"
o.colorcolumn = "80"
o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding (treesitter)
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
