local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

lspconfig.clangd.setup({
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  cmd = {
    'clangd',
    '--background-index',
    '--log=verbose'
  },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
  end,
  single_file_support = true,
  capabilities = lsp_capabilities,
})
