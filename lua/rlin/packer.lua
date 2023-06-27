vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'SmiteshP/nvim-navic'
	use "windwp/nvim-autopairs"
	use 'akinsho/toggleterm.nvim'
	use 'numToStr/Comment.nvim'
	use {
	    'fatih/vim-go',
	    run = ':GoUpdateBinaries',
	}
	use {
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
		  "SmiteshP/nvim-navic",
		  "nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
	}
	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		-- or,
		-- branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
	    'williamboman/mason.nvim',
	    run = ':MasonUpdate' -- :MasonUpdate updates registry contents
	}
	use {
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'onsails/lspkind-nvim'
	}
end)

