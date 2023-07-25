--local octo = require "plugins.octo"
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'benfowler/telescope-luasnip.nvim',             -- https://github.com/benfowler/telescope-luasnip.nvim
    'erlingur/telescope-rails-related-files',       -- https://github.com/erlingur/telescope-rails-related-files
    'ElPiloto/telescope-vimwiki.nvim',              -- https://github.com/ElPiloto/telescope-vimwiki.nvim
    'xiyaowong/telescope-octo-commands.nvim',       -- https://github.com/xiyaowong/telescope-octo-commands.nvim
    'asbjornhaland/telescope-send-to-harpoon.nvim',  -- https://github.com/asbjornhaland/telescope-send-to-harpoon.nvim
  },
  opts = function(_, opts)
    local telescope = require("telescope")
    telescope.load_extension('luasnip')
    telescope.load_extension('rails_related_files')
    telescope.load_extension('vimwiki')
    telescope.load_extension('octo_commands')
    telescope.load_extension('send_to_harpoon')

    opts.defaults.mappings = {
      i = {
        --['<c-j>'] = require("telescope.actions")
        --['<c-k>'] =
        ['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon
      },
      n = {
        ['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon
      },
    }
  end,
  keys = {
    {
      '<leader>ff',
      function() require('telescope.builtin').find_files() end,
      desc = 'Telescope Find Files'
    },
    {
      '<leader>fR', -- rails rails_related_files
      ':Telescope rails_related_files',
      desc = 'Telescope Rails Related Files',
    },
    {
      '<leader>sl', -- luasnip
      ':Telescope luasnip<CR>',
      desc = 'Telescope LuaSnip',
    },
    {
      "<leader>sp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
    --{
    --  '<leader>', -- vimwiki
    --  ,
    --  desc = '',
    --},
    {
      '<Tab>ft',
      ':TodoTelescope<CR>',
      desc = 'Todo telescop list (All todos)'
    },
    {
      '<Tab>fT',
      ':TodoQuickFix<CR>',
      desc = 'Todo quickfix list (All todos)'
    },
  }
}

