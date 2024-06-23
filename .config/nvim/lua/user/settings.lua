vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.cursorline = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true

vim.opt.colorcolumn = '80'

vim.g.show_whitespace = 1

local autocmd = vim.api.nvim_create_autocmd

autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = { '*.asm' },
    callback = function()
      vim.opt.filetype = 'nasm'
    end,
  }
)

autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = { '*.c.inc' },
    callback = function()
      vim.opt.filetype = 'c'
    end,
  }
)

