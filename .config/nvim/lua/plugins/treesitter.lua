local Plugin = {"nvim-treesitter/nvim-treesitter"}

Plugin.main = "nvim-treesitter.configs"

Plugin.dependencies = {
  {"nvim-treesitter/nvim-treesitter-textobjects"}
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
  auto_install = true,

  highlight = {
    enable = true,
    disable = function(lang, buf)
    local max_filesize = 1024 * 1024 -- 1MB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
    end,
  },

  -- :help nvim-treesitter-textobjects-modules
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
  },

  ensure_installed = "all",
}

return Plugin
