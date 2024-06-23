local Plugin = {'nvim-tree/nvim-tree.lua'}

Plugin.dependencies = {
    {'nvim-tree/nvim-web-devicons'},
}

function Plugin.init()
  -- Disable netrw for nvim-tree
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end
  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

function Plugin.config()
  require("nvim-tree").setup({
    actions = {
      open_file = {
        quit_on_open = true
      },
    },
    on_attach = my_on_attach,
  })
  vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
end

return Plugin

