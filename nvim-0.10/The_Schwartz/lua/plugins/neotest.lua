return {
  {
    'nvim-neotest/neotest', -- https://github.com/nvim-neotest/neotest
    init = function() end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-vim-test',   -- https://github.com/nvim-neotest/neotest-vim-test
      'olimorris/neotest-rspec',         -- https://github.com/olimorris/neotest-rspec
      'haydenmeade/neotest-jest',        -- https://github.com/haydenmeade/neotest-jest
      'vim-test/vim-test',               -- https://github.com/vim-test/vim-test
      'antoinemadec/FixCursorHold.nvim', -- https://github.com/antoinemadec/FixCursorHold.nvim
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require("neotest-vim-test"),
          require('neotest-rspec'),
          require("neotest-jest")({
            jestCommand = "npm test --"
          }),
        },
        diagnostic = {
          enabled = true
        },
        status = {
          virtual_text = true
        }
      })
    end,
    keys = {
      {
        "<Tab>Ta",
        function() require('neotest').run.attach() end,
        desc = "Attach Test"
      },
      {
        "<Tab>Tcf",
        function() require('neotest').run.run(vim.fn.expand('%')) end,
        desc = "Run All Test Current File"
      },
      {
        "<Tab>Tj",
        function() require('neotest').jump.next() end,
        desc = "Jump to Next Test"
      },
      {
        "<Tab>Tk",
        function() require('neotest').jump.prev() end,
        desc = "Jump to Previous Test"
      },
      {
        "<Tab>Tn",
        function() require('neotest').run.run() end,
        desc = "Run Nearest Test Current File"
      },
      {
        "<Tab>Tr",
        function() require('neotest').output.open() end,
        desc = "Toggle Test Result Window"
      },
      {
        "<Tab>Ts",
        function() require('neotest').summary.toggle() end,
        desc = "Toggle Summary Window"
      },
      {
        "<Tab>Tu",
        function() require('neotest').summary.clear_marked() end,
        desc = "Clear Marked Tests"
      },
      {
        "<Tab>Tx",
        function() require('neotest').run.stop() end,
        desc = "Stop Running Tests"
      },
      {
        "<Tab>Tz",
        function() require('neotest').summary.run_marked() end,
        desc = "Run Marked Tests"
      },
    },
  },
}
