return{
  --'jiaoshijie/undotree', -- https://github.com/jiaoshijie/undotree
  'mbbill/undotree', -- https://github.com/mbbill/undotree
  init = function ()
    vim.g.undotree_WindowLayout = 1
    vim.g.undotree_ShortIndicators = 1
  end,
  config = function ()
    vim.keymap.set('n', '<leader>ut', ':UndotreeToggle', { desc = 'Toggle Undo Tree', silent = true })
    vim.keymap.set('n', '<leader>uh', ':UndotreeHide',   { desc = 'Hide Undo Tree',   silent = true })
    vim.keymap.set('n', '<leader>us', ':UndotreeShow',   { desc = 'Show Undo Tree',   silent = true })
    vim.keymap.set('n', '<leader>uf', ':UndotreeFocus',  { desc = 'Focus Undo Tree',  silent = true })
    --local undotree = require('undotree')

    --undotree.setup({
    --  float_diff = true,  -- using float window previews diff, set this `true` will disable layout option
    --  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
    --  ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
    --  window = {
    --    winblend = 30,
    --  },
    --  keymaps = {
    --    ['j'] = "move_next",
    --    ['k'] = "move_prev",
    --    ['J'] = "move_change_next",
    --    ['K'] = "move_change_prev",
    --    ['<cr>'] = "action_enter",
    --    ['p'] = "enter_diffbuf",
    --    ['q'] = "quit",
    --  },
    --})
  end
}
