return {
  'danymat/neogen',                                 -- https://github.com/danymat/neogen
  dependencies = 'nvim-treesitter/nvim-treesitter',
  version = "*",
  config = function ()
    local neogen = require('neogen')
    neogen.setup({
      enabled = true,
      input_after_comment = true,
      snippet_engine = 'luasnip',
      languages = {
        ruby ={
          template = {
            annotation_convention = 'yard'
          }
        },
        lua = {
          template = {
            annotation_convention = 'emmylua'
          }
        }
      }
    })

    function _G.Neogen_Class()
      neogen.generate({type = 'class'})
    end

    function _G.Neogen_File()
      neogen.generate({type = 'file'})
    end

    function _G.Neogen_Function()
      neogen.generate({type = 'func'})
    end

    function _G.Neogen_Type()
      neogen.generate({type = 'type'})
    end

    -- TODO: Keymap Strategy
    vim.keymap.set('n', '<leader><leader>dc', '<Cmd> Neogen_Class()<CR>', { desc = 'Document Class', silent = true })
    vim.keymap.set('n', '<leader><leader>dF', '<Cmd> Neogen_File()<CR>', { desc = 'Document File', silent = true })
    vim.keymap.set('n', '<leader><leader>df', '<Cmd> Neogen_Function()<CR>', { desc = 'Document Function', silent = true })
    vim.keymap.set('n', '<leader><leader>dt', '<Cmd> Neogen_Type()<CR>', { desc = 'Document Type', silent = true })
  end,

}
