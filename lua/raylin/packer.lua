vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Package Management
 	use 'wbthomason/packer.nvim'
	-- Go Develop Toolkits
 	use 'fatih/vim-go'
	-- Color Scheme
	use 'folke/tokyonight.nvim'
 	use 'sainnhe/gruvbox-material'
	-- Syntax Highlight
 	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- File Side bar
 	use 'preservim/nerdtree'
	-- LSP 
	use 'neovim/nvim-lspconfig'
	-- LSP For Showing Function Signature
	use 'ray-x/lsp_signature.nvim'
	-- Core of Neovim Auto Completion
	use 'hrsh7th/nvim-cmp'
	-- nvim-cmp plugins
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	-- Git gutters
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}
	-- File Finder
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Auto pairs
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}
end)

