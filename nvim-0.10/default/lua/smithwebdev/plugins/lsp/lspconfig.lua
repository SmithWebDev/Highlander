return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require('lspconfig')

    local keymap = vim.keymap
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }
    local lsp_signature = require('lsp_signature')
    local on_attach = function(client, bufnr)

      lsp_signature.setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        }
      })
      ------------------------
      --    LSP Keymaps     --
      ------------------------
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "<leader>lR", function()
        builtin.lsp_references()
      end, opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "<leader>ld", function()
        builtin.lsp_definitions()
      end, opts)

      opts.desc = "LSP formatting"
      keymap.set("n", "<leader>lf",vim.lsp.buf.format, opts)

      opts.desc = "Show LSP impementations"
      keymap.set("n", "<leader>li", function()
        builtin.lsp_implementations()
      end, opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "<leader>lt", function()
        builtin.lsp_type_definitions()
      end, opts)

      opts.desc = ""
      keymap.set("n", "<leader>lK", function()
        lsp_signature.toggle_float_win()
      end, opts)

      opts.desc = "Show available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart Rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation for what is under curor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "[ALT] Show documentation for what is under curor"
      keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssmodules_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            }
          }
        }
      }
    })

    --lspconfig["rubocop"].setup({
    --  capabilities = capabilities,
    --  on_attach = on_attach,
    --})

    lspconfig["ruby_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    --lspconfig["solargraph"].setup({
    --  capabilities = capabilities,
    --  on_attach = on_attach,
    --  settings = {
    --    solargraph = {
    --      diagnostics = true,
    --      completion = true,
    --      flags = {
    --        debounce_text_changes = 150
    --      },
    --      initializationOptions = {
    --        formatting = true
    --      }
    --    }
    --  }
    --})

    --lspconfig["standardrb"].setup({
    --  capabilities = capabilities,
    --  on_attach = on_attach,
    --})

    lspconfig["syntax_tree"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        tailwindCSS = {
          classAttributes = { "class", "className", "class:list", "classList", "ngClass", "class: " },
          emmetCompletions = true,
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning"
          },
          validate = true
        }
      },
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        ruby = "rb",
        html = 'html',
        css = 'css'
      }
    })

    lspconfig['stimulus_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {

      }
    })


    -- cmd = { 'stimulus-language-server', '--stdio' },
    -- filetypes = { 'html', 'ruby', 'eruby', 'haml', 'slim', 'php' },

  end
}
