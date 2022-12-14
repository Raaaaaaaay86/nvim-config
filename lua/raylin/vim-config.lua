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

-- Syntax Highlight
require('nvim-treesitter.configs').setup {
	ensure_installed = {'html', 'css', 'vim', 'lua', 'go', 'java', 'javascript'},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}


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

-- Completion
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources(
		{
		  { name = 'nvim_lsp' },
		  { name = 'vsnip' },
		},
		{
		  { name = 'buffer' },
		}
	)
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources(
		{
		  { name = 'cmp_git' },
		},
		{
		  { name = 'buffer' },
		}
	)
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources(
		{
		  { name = 'path' }
		},
		{
		  { name = 'cmdline' }
		}
	)
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local golang_setup ={
	on_attach = function(client, bufnr)
		require('lsp_signature').on_attach({
			bind = true,
			handler_opts = {
				border = "rounded"
			}
		}, bufnr)
	end,
	capabilities = capabilities 
}

require('lspconfig').gopls.setup(golang_setup)
