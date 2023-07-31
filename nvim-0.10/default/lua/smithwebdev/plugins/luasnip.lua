return {
  {
    'L3MON4D3/LuaSnip',                               -- https://github.com/L3MON4D3/LuaSnip
    event = "VeryLazy",
    build = 'make install_jsregexp',
    dependencies = {
      'honza/vim-snippets',                           -- https://github.com/honza/vim-snippets
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    config = function()
      local ls = require('luasnip')
      local types = require('luasnip.util.types')


      ls.config.set_config {
        history = true,
        updateevents = "TextChanged, TextChangedI",
        ext_base_prio = 200,
        ext_prio_increase = 1,
        enable_autosnippets = true,
        store_selection_keys = "<c-s>",
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "●", "#1b1d2b" } }, -- { '<- Current Choice', 'NonTest' }
            },
          },
        },
      }


      --require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/snippets/" })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/utilities/" })

      ls.filetype_extend("all", { '_' })
      ls.filetype_extend("eruby", { "html", "ruby" })
      ls.filetype_extend("html", { "eruby" })
      ls.filetype_extend("ruby", { "eruby", 'rspec' })
      ls.filetype_extend("vimwiki", { "markdown" })
      ls.filetype_extend("markdown", { "vimwiki" })
      --[[ keybinds ]]
      --
      --------------------------------------------------------------------------------
      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
      vim.keymap.set({ "i", "s" }, "<C-h>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end)

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(1) then
          ls.expand_or_jump()
        end
      end)
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end)

      vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])
      vim.keymap.set("n", "<leader>se", ":LuaSnipEdit<CR>", { desc = 'Edit LuaSnip', silent = true })
      --vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
    end
  },
  {
    'ziontee113/SnippetGenie',                        -- https://github.com/ziontee113/SnippetGenie
    config = function ()
      require('SnippetGenie').setup({
        snippets_directory = '~/.config/nvim/lua/smithwebdev/snippets/'
      })
    end
  },
}

