vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
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

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- adjust expand tabs and tabstop
local nvim_create_autocmd = vim.api.nvim_create_autocmd

nvim_create_autocmd("FileType", {
  pattern = "c,h,cpp,hpp,go",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = false
    vim.opt_local.autoindent = true
  end,
})

nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
  end,
})
