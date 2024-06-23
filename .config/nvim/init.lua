local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.settings')
load('user.keymap')
require('user.plugins')

pcall(vim.cmd.colorscheme, 'kanagawa-dragon')

vim.lsp.set_log_level('trace')
