return {
  'ray-x/navigator.lua', -- https://github.com/ray-x/navigator.lua
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
    'ray-x/lsp_signature.nvim',
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    require 'navigator'.setup()
  end,
}
