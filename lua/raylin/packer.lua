 vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'folke/tokyonight.nvim'
 	use 'sainnhe/gruvbox-material'
	use { "junegunn/fzf", run = ":call fzf#install()" }
 	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
 	use 'wbthomason/packer.nvim'
 	use 'fatih/vim-go'
 	use 'junegunn/fzf.vim'
 	use 'preservim/nerdtree'
	use 'neovim/nvim-lspconfig'
end)

