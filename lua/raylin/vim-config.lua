vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.keymap.set('n', '<C-p>', string.format(':Files %s<CR>', string.match(vim.fn.getcwd(),".*Projects/[%w_]*")))

