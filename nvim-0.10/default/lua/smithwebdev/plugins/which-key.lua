return {
  'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require('which-key').setup({})
    local wk = require("which-key")

    wk.register({},{ prefix = "<leader>" })
    wk.register({},{ prefix = "<leader<leader>" })
    wk.register({},{ prefix = "<Tab>" })
  end
}
