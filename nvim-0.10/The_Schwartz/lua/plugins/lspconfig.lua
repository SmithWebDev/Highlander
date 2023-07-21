return {
  "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(_, bufnr)
      local function map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end
      local map_opts = { noremap = true, silent = true }
    end

    --lspconfig.efm.setup({})
    lspconfig.efm.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "elixir" },
    })
  end,
}
