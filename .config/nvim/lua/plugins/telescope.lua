local Plugin = {'nvim-telescope/telescope.nvim'}
local is_unix = vim.fn.has('unix') == 1 or vim.fn.has('mac') == 1

Plugin.branch = '0.1.x'

Plugin.dependencies = {
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    enabled = is_unix
  },
}

Plugin.cmd = { 'Telescope' }

function Plugin.init()
  local builtin = require('telescope.builtin')
  local actions = require('telescope.actions')
  -- See :help telescope.builtin
  vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
  vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
  vim.keymap.set('n', '<leader>fx', builtin.lsp_references, {})
  vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
end

function Plugin.config()
  if is_unix then
    require('telescope').load_extension('fzf')
  end
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<M-j>'] = 'move_selection_next',
          ['<M-k>'] = 'move_selection_previous',
          ['<M-u>'] = 'preview_scrolling_down',
          ['<M-i>'] = 'preview_scrolling_up',
        }
      }
    }
  })
end

return Plugin
