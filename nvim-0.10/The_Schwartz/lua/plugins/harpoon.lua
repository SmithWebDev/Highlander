return {
  'ThePrimeagen/harpoon', -- https://github.com/ThePrimeagen/harpoon
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'asbjornhaland/telescope-send-to-harpoon.nvim',  -- https://github.com/asbjornhaland/telescope-send-to-harpoon.nvim
  },
  event = 'VeryLazy',
  config = function()
    require('telescope').load_extension('harpoon')
    --require('telescope').load_extension('send_to_harpoon')
  end,
  keys = {
    { '<leader>sj', ':Telescope harpoon marks<CR>', desc = 'Show Harpoon Marks (Telescope)'},
    { '<leader>hm', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'View all Harpoon marks'},
    { '<leader>hf', function() require('harpoon.mark').add_file() end, desc = 'Add files to Harpoon'},
    { '<leader>h1', function() require("harpoon.ui").nav_file(1) end, desc = 'Move to Harpoon mark 1' },
    { '<leader>h2', function() require("harpoon.ui").nav_file(2) end, desc = 'Move to Harpoon mark 2' },
    { '<leader>h3', function() require("harpoon.ui").nav_file(3) end, desc = 'Move to Harpoon mark 3' },
    { '<leader>h4', function() require("harpoon.ui").nav_file(4) end, desc = 'Move to Harpoon mark 4' },
    { '<leader>h5', function() require("harpoon.ui").nav_file(5) end, desc = 'Move to Harpoon mark 5' },
    { '<leader>h6', function() require("harpoon.ui").nav_file(6) end, desc = 'Move to Harpoon mark 6' },
    { '<leader>h7', function() require("harpoon.ui").nav_file(7) end, desc = 'Move to Harpoon mark 7' },
    { '<leader>h8', function() require("harpoon.ui").nav_file(8) end, desc = 'Move to Harpoon mark 8' },
    { '<leader>h9', function() require("harpoon.ui").nav_file(9) end, desc = 'Move to Harpoon mark 9' },
  }

}
