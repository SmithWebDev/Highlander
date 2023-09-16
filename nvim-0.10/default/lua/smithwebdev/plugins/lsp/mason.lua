return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        'cssls',
        'cssmodules_ls',
        'elixirls',
        'emmet_ls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'rubocop',
        'ruby_ls',
        --'solargraph',
        --'standardrb',
        'tailwindcss',
        'tsserver',
        'yamlls',
      },

      automatic_installation = true,
    })
  end
}
