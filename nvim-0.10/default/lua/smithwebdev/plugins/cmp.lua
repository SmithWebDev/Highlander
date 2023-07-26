return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',            -- https://github.com/saadparwaiz1/cmp_luasnip
    'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
    'jcha0713/cmp-tw2css',                 -- https://github.com/jcha0713/cmp-tw2css
    'hrsh7th/cmp-emoji',                   -- https://github.com/hrsh7th/cmp-emoji
    'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp-signature-help', -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
    'nvim-lua/plenary.nvim',
    'L3MON4D3/LuaSnip',
  },

  keys = { },

  opts = function(_, opts)
    local cmp = require('cmp')
    local luasnip = require('luasnip')


    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "nvim_lua" },
      { name = 'nvim_lsp_signature_help' },
      { name = 'cmp-tw2css' },
      { name = 'neorg' },
      { name = 'emoji' },
    }))
    opts.mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.jumpable() then
          luasnip.jump(1)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-k>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable() then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['jk'] = cmp.mapping.confirm({ select = true }),
      -- 	-- Accept currently selected item. If none selected, `select` first item.
      -- 	-- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- ["<Space><Space>"] = cmp.mapping.confirm({ select = false }),
    })
  end,
  --keys = function()
  --  return {

  --  }
  --end
  --vim.keymap.set({ "i", "s" }, "<C-h>", function()
  --  if ls.choice_active() then
  --    ls.change_choice(-1)
  --  end
  --end),

  --vim.keymap.set({ "i", "s" }, "<C-l>", function()
  --  if ls.choice_active() then
  --    ls.change_choice(-1)
  --  end
  --end),

  --vim.keymap.set({ "i", "s" }, "<C-j>", function()
  --  if ls.jumpable(1) then
  --    ls.expand_or_jump()
  --  end
  --end),
  --vim.keymap.set({ "i", "s" }, "<C-k>", function()
  --  if ls.jumpable(-1) then
  --    ls.jump(-1)
  --  end
  --end)

}

