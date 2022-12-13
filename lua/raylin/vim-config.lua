require('nvim-treesitter.configs').setup {
	ensure_installed = {'html', 'css', 'vim', 'lua', 'go', 'java', 'javascript', 'typescript'},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.clipboard=unnamed

vim.g.mapleader=" "

vim.keymap.set("n", "<C-p>", string.format(":Files %s<CR>", string.match(vim.fn.getcwd(),".*Projects/[%w_]*")))
vim.keymap.set("n", "<leader>e", "<cmd>:NERDTreeToggle<CR>")
vim.keymap.set("n", "gD", "<cmd>:lua require('raylin.util').GoToImplementation()<CR>")
vim.keymap.set("i", "<tab>", "<C-R>=v:lua.require('raylin.util').tab_complete()<CR>" ,{silent = true, noremap = false})
vim.keymap.set("i", "<s-tab>", "<C-R>=v:lua.require('raylin.util').s_tab_complete()<CR>" ,{silent = true, noremap = true})
vim.keymap.set('i', '<enter>', "<C-R>=v:lua.require('raylin.util').enter_key()<CR>" ,{silent = true, noremap = true})
