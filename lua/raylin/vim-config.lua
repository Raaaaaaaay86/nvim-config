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

require('nvim-treesitter.configs').setup {
	ensure_installed = {'html', 'css', 'vim', 'lua', 'go', 'java', 'javascript'},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

require('lspconfig').gopls.setup{}

diagnostic_config = {
    underline = true,
    virtual_text = {
        spacing = 2,
        prefix = '<',
    },
    signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
        if not ok then
            return true
        end

        return result
    end,
    update_in_insert = true,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',{silent = true, noremap = true})
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',{silent = true, noremap = true})
