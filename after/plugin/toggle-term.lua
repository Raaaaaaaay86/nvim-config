require("toggleterm").setup()

vim.keymap.set('n', '<C-`>', ":ToggleTerm<CR>")
vim.keymap.set('t', '<C-`>', "<C-\\><C-n>:ToggleTerm<CR>")

