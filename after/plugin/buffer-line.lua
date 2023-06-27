require("bufferline").setup()

vim.keymap.set('n', '<leader>h', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>l', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>tp', ':BufferLineGoToBuffer ')
