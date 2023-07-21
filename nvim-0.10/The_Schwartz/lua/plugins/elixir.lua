return {
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = true,
          }),
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<Tab>efp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<Tab>etp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<Tab>eem", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      })

      -- Edits to "Alternative" file in various locations
      vim.keymap.set('n', '<Tab>a',    ':A<CR>')
      vim.keymap.set('n', '<Tab>ae',   ':AE<CR>',          { desc = 'edit alternate file',                           silent = true  })
      vim.keymap.set('n', '<Tab>as',   ':AS<CR>',          { desc = 'edit alternate in h split',                     silent = true  })
      vim.keymap.set('n', '<Tab>av',   ':AV<CR>',          { desc = 'edit alternate in v split',                     silent = true  })
      vim.keymap.set('n', '<Tab>at',   ':AT<CR>',          { desc = 'edit alternate in tab',                         silent = true  })


      -- Edits to "Relative" file in various locations
      vim.keymap.set('n', '<Tab>e',    ':R<CR>')
      vim.keymap.set('n', '<Tab>ee',   ':RE<CR>',          { desc = 'edit relative file',                            silent = true  })
      vim.keymap.set('n', '<Tab>es',   ':RS<CR>',          { desc = 'edit relative in h split',                      silent = true  })
      vim.keymap.set('n', '<Tab>ev',   ':RV<CR>',          { desc = 'edit relative in v split',                      silent = true  })
      vim.keymap.set('n', '<Tab>et',   ':RT<CR>',          { desc = 'edit relative in tab',                          silent = true  })

      vim.keymap.set('n', '<Tab>eco',  ':Econtroller ',    { desc = 'Create or edit a Phoenix controller module',    silent = true })
      vim.keymap.set('n', '<Tab>ech',  ':Echannel ',       { desc = 'Create or edit a Phoenix channel module',       silent = true })
      vim.keymap.set('n', '<Tab>eeC',  ':Ecomponent ',     { desc = 'Create or edit Phoenix.Component module',       silent = true })
      vim.keymap.set('n', '<Tab>eef',  ':Efeature ',       { desc = 'Create or edit a Wallaby test module',          silent = true })
      vim.keymap.set('n', '<Tab>eeh',  ':Ehtml ',          { desc = 'Create or edit a Phoenix HTML module',          silent = true })
      vim.keymap.set('n', '<Tab>eej',  ':Ejson ',          { desc = 'Create or edit a Phoenix JSON module',          silent = true })
      vim.keymap.set('n', '<Tab>eelv', ':Eliveview ',      { desc = 'Create or edit a Phoenix.LiveView module',      silent = true })
      vim.keymap.set('n', '<Tab>eelc', ':Elivecomponent ', { desc = 'Create or edit a Phoenix.LiveComponent module', silent = true })
      vim.keymap.set('n', '<Tab>ees',  ':ESource ',        { desc = 'Create or edit a regular source module',        silent = true })
      vim.keymap.set('n', '<Tab>eet',  ':Etest ',          { desc = 'Create or edit a regular test module',          silent = true })
      vim.keymap.set('n', '<Tab>eeT',  ':Etask ',          { desc = 'Create or edit a Mix task module',              silent = true })
      vim.keymap.set('n', '<Tab>eev',  ':Eview ',          { desc = 'Create or edit a Phoenix view module',          silent = true })

    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-dispatch", -- https://github.com/tpope/vim-dispatch
      "tpope/vim-projectionist", -- https://github.com/tpope/vim-projectionist
    },
  },
  {
    'elixir-editors/vim-elixir', -- https://github.com/elixir-editors/vim-elixir
  }
}

--require("elixir.elixirls").open_output_panel()
--require("elixir.elixirls").open_output_panel({ window = "split" })
--require("elixir.elixirls").open_output_panel({ window = "vsplit" })
--require("elixir.elixirls").open_output_panel({ window = "float" })
