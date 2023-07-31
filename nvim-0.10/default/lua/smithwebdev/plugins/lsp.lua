return {
  --  -- LSP Config
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
  },
  config = function()
    -- Base
    local mason = require('mason')
    local mason_lsp = require('mason-lspconfig')
    local lsp = require('lspconfig')
    local cmp_lsp = require('cmp_nvim_lsp')

    local signs = {}

    local auto_install_servers = {
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
      'solargraph',
      'standardrb',
      'tailwindcss',
      'tsserver',
      'yamlls',
    }

    -- TODO: Keymap Strategy
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
    end

    local server_settings = {
      ["lua_ls"] = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = vim.api.nvim_get_runtime_file("", true),
        },
      },
      ["yamlls"] = {
        yaml = {
          keyOrdering = false,
        }
      },
    },

    mason.setup()
    mason_lsp.setup({ ensure_installed = auto_install_servers })

    -- Formatting for hover window
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true


    lsp.cssls.setup({
      capabilities = capabilities
    })

    lsp.cssmodules_ls.setup({
      on_attach = on_attach,
      init_options = {
        camelCase = 'false'
      }
    })

    lsp.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = vim.api.nvim_get_runtime_file("", true),
          completion = {
            callSnippet = "Replace"
          },
        },
      }
    })

    for _, auto_install_server in pairs(auto_install_servers) do
      lsp[auto_install_server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        setting = server_settings[auto_install_server],
      })
    end
  end
}
