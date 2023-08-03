return{
  'APZelos/blamer.nvim', -- https://github.com/APZelos/blamer.nvim

  init = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_prefix = ' > '
  end,
  config = function()
    ------------------------
    --   Blamer Keybind   --
    ------------------------

    vim.keymap.set('n', '<leader><leader>b', ':BlamerToggle<CR>', { desc = 'Toggle git blame messages', silent = true })
  end
}
