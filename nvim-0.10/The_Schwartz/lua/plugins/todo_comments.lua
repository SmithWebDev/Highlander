return {
  'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
  event = 'VeryLazy',
  keys = {
    {'<leadersN', '<cmd>TodoTrouble keywords=NOTE<CR>', desc= "Note (Trouble)"},
  },
  --opts = function()
  --  vim.keymap.set('<leadersN', '<cmd>TodoTrouble keywords=NOTE<CR>', {desc= "Note (Trouble)"})
  --end
}
