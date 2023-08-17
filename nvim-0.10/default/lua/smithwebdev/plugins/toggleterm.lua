return {
  'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim
  version = '*',
  config = function ()
    require('toggleterm').setup({
      direction = 'float',
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      shade_terminals = false,
      size = function (term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border =  'curved',
        -- like `size`, width and height can be a number or function which is passed the current terminal
        width = 180,
        height = 40,
        winblend = 3,
        zindex = 4,
      },
    })

    local Terminal = require('toggleterm.terminal').Terminal
    local bin_dev = Terminal:new({
      cmd = 'bin/dev',
      hidden = true,
      direction = 'vertical',
      count = 1,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<esc>', '<esc>', { noremap = true, silent = true })
      end
    })

    local rails_console = Terminal:new({
      cmd = 'rails console',
      hidden = true,
      direction = 'vertical',
      count = 2,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<esc>', '<esc>', { noremap = true, silent = true })
      end
    })

    local spotify_player = Terminal:new({
      cmd = 'spotify_player',
      hidden = true,
      direction = 'horizontal',
      count = 4,
      width = 90,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<esc>', '<esc>', { noremap = true, silent = true })
      end
    })

    local git_dash = Terminal:new({
      cmd = 'gh dash',
      hidden = true,
      direction = 'tab',
      count = 3,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<esc>', '<esc>', { noremap = true, silent = true })
      end
    })

    function _bin_dev_toggle()
      bin_dev:toggle()
    end


    function _git_dash_toggle()
      git_dash:toggle()
    end

    function _rails_console_toggle()
      rails_console:toggle()
    end

    function _spotify_player_toggle()
      spotify_player:toggle()
    end


    -- TODO: Keymap Strategy
    -- keybindings
    vim.keymap.set('n', '<leader>tbd', '<cmd>lua _bin_dev_toggle()<CR>', { desc = 'Custom Terminal for Bin/Dev', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tgd', '<cmd>lua _git_dash_toggle()<CR>', { desc = 'Custom Terminal for GH Dash', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>trc', '<cmd>lua _rails_console_toggle()<CR>', { desc = 'Custom Terminal for Rails Console', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tsp', '<cmd>lua _spotify_player_toggle()<CR>', { desc = 'Custom Terminal for Spotify_Player', noremap = true, silent = true })
  end
}
--
