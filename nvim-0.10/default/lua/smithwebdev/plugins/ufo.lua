return {
  'kevinhwang91/nvim-ufo', -- https://github.com/kevinhwang91/nvim-ufo
  dependencies = {
    'kevinhwang91/promise-async',
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate'
    }
  },
  event = "bufReadPost",
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return {'treesitter', 'indent'}
    end
  },
  keys = {
    {
      'zR',
      function()
        require('ufo').openAllFolds()
      end,
      desc = "Open all Folds (UFO)"
    },
    {
      'zM',
      function()
        require('ufo').closeAllFolds()
      end,
      desc = "Close all Folds (UFO)"
    },
    --{
    --  'K',
    --  function()
    --    local winid = require('ufo').peekFoldedLinesUnderCursor()
    --    if not winid then
    --      vim.lsp.buf.hover()
    --    end
    --  end,
    --  desc = 'View the closed fold content'
    --},
  }
}

