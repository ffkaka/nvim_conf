vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
-- opt.expendtab = true
opt.autoindent = true

-- search
-- opt.ignorecase = true
-- opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guifont = "Monaco"

-- split window
opt.splitright = true
opt.splitbelow = true
