--local octo = require "plugins.octo"
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'benfowler/telescope-luasnip.nvim',             -- https://github.com/benfowler/telescope-luasnip.nvim
    'erlingur/telescope-rails-related-files',       -- https://github.com/erlingur/telescope-rails-related-files
    'ElPiloto/telescope-vimwiki.nvim',              -- https://github.com/ElPiloto/telescope-vimwiki.nvim
    'xiyaowong/telescope-octo-commands.nvim',       -- https://github.com/xiyaowong/telescope-octo-commands.nvim
    'asbjornhaland/telescope-send-to-harpoon.nvim', -- https://github.com/asbjornhaland/telescope-send-to-harpoon.nvim
    'debugloop/telescope-undo.nvim', -- https://github.com/debugloop/telescope-undo.nvim
  },
  config = function()
    local telescope = require("telescope")
    require('telescope').setup({
      defaults = {
        layout_config = { prompt_position = 'bottom' },
        layout_strategy = 'horizontal',
        sorting_strategy = 'descending',
        mappings = {
          ['i'] = {
            ['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon
            --['<esc>'] = require("telescope.actions").close,
            --['<C-s>'] = require('telescope.actions').add_selection,
            --['<C-x>'] = require('telescope.actions').remove_selection,
            --['<C-j>'] = require('telescope.actions').move_selection_next,
            --['<C-k>'] = require('telescope.actions').move_selection_previous,
            --['<C-v>'] = require('telescope.actions').move_selection_previous,
            --['<leader>-'] = require('telescope.actions').select_horizontal,
            --['<leader>\\'] = require('telescope.actions').select_vertical,
            --['<C-h>'] = require('telescope.actions').add_to_qflist,
            --['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
            --['<C-q>'] = require('telescope.actions').send_selected_to_qflist,
          },
          ['n'] = {
            ['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon
            --['<esc>'] = require("telescope.actions").close,
            --['<C-s>'] = require('telescope.actions').add_selection,
            --['<C-x>'] = require('telescope.actions').remove_selection,
            --['<C-j>'] = require('telescope.actions').move_selection_next,
            --['<C-k>'] = require('telescope.actions').move_selection_previous,
            --['-'] = require('telescope.actions').select_horizontal,
            --['\\'] = require('telescope.actions').select_vertical,
            --['t'] = require('telescope.actions').select_tab,
            --['<C-h>'] = require('telescope.actions').add_to_qflist,
            --['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
            --['<C-q>'] = require('telescope.actions').send_selected_to_qflist,
            --['q'] = require('telescope.actions').open_qflist,
            --['?'] = require('telescope.actions').which_key,
          }
        },
      },
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      }
    })
  end,
  opts = function(_, opts)
    local telescope = require("telescope")
    telescope.load_extension('luasnip')
    telescope.load_extension('octo_commands')
    telescope.load_extension('rails_related_files')
    telescope.load_extension('send_to_harpoon')
    telescope.load_extension('undo')
    telescope.load_extension('vimwiki')
  end,
  -- TODO: Keymap Strategy
  keys = {
    {
      '<leader>ff',
      function() require('telescope.builtin').find_files() end,
      desc = 'Telescope Find Files'
    },
    {
      '<leader>fF',
      function() require('telescope.builtin').find_files({hidden=true}) end,
      desc = 'Telescope Find Files'
    },
    {
      '<leader>fF',
      function() require('telescope.builtin').find_files({hidden=true}) end,
      desc = 'Telescope Find Files'
    },
    {
      '<leader>fF',
      function() require('telescope.builtin').find_files({hidden=true}) end,
      desc = 'Telescope Find Files'
    },
    {
      '<leader>fR', -- rails rails_related_files
      ':Telescope rails_related_files',
      desc = 'Telescope Rails Related Files',
    },
    {
      '<leader>sh', -- luasnip
      ':Telescope help_tags<CR>',
      desc = 'Telescope LuaSnip',
    },
    {
      '<leader>sl', -- luasnip
      ':Telescope luasnip<CR>',
      desc = 'Telescope LuaSnip',
    },
    --{
    --  "<leader>sp",
    --  function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
    --  desc = "Find Plugin File",
    --},
    --{
    --  '<leader>su', -- undo list
    --  ':Telescope undo,
    --  desc = 'Undo Tree visualization',
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
