return {
  {'echasnovski/mini.surround', enabled = false },
  {'neovim/nvim-lspconfig', init = function()
    local keys = require('lazyvim.plugins.lsp.keymaps').get()
    keys[#keys + 1] = {'<c-k>', false}
  end},
  {"ggandor/leap.nvim", enabled = false}
}

