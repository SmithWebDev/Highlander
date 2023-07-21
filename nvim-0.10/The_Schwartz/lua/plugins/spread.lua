return {
  'aarondiel/spread.nvim',                          -- https://github.com/aarondiel/spread.nvim
  event = "VeryLazy",
  --opts = function()
  --  local spread = require("spread")
  --end,
  keys = {
    { '<leader>aj', function() require("spread").out() end, desc = 'Spread arguments' },
    { '<leader>ak', function() require("spread").combine() end, desc = 'Combine arguments' },
  }
}
