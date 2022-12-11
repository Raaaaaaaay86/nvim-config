vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'sainnhe/gruvbox-material'
	use 'fatih/vim-go'
	use { "junegunn/fzf", run = ":call fzf#install()" }
	use 'junegunn/fzf.vim'
end)

