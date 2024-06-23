local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

keymap('', '<Leader>h', '<C-w>h', opts)
keymap('', '<Leader>j', '<C-w>j', opts)
keymap('', '<Leader>k', '<C-w>k', opts)
keymap('', '<Leader>l', '<C-w>l', opts)
