local Plugin = { 'williamboman/mason.nvim' }

Plugin.lazy = false

Plugin.opts = {
  ui = { border = 'rounded' }
}

function Plugin.config()
  require('mason').setup()
end

return Plugin

