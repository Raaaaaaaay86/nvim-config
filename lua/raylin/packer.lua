 vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'folke/tokyonight.nvim'
 	use 'sainnhe/gruvbox-material'
 	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
 	use 'wbthomason/packer.nvim'
 	use 'fatih/vim-go'
 	use 'junegunn/fzf.vim'
 	use 'preservim/nerdtree'
	use 'neovim/nvim-lspconfig'
	use 'ray-x/lsp_signature.nvim'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
end)

