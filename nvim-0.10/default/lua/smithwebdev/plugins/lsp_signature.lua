return{
  'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
  config = function ()
    require("lsp_signature").setup()
  end
}
