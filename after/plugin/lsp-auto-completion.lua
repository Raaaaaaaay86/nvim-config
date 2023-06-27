local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
		},
		{
			{ name = 'buffer' },
			{ name = 'path' },
		}
	),
	mapping =cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item.menu = '['..string.upper(entry.source.name)..']'
				return vim_item
			end
		})
	},
}

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources(
		{
			{ name = 'path' }
		},
		{
			{ name = 'cmdline' }
		}
	),
	
})
