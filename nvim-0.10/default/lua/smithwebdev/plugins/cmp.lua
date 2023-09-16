return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'saadparwaiz1/cmp_luasnip',            -- https://github.com/saadparwaiz1/cmp_luasnip
    'L3MON4D3/cmp-luasnip-choice',         -- https://github.com/L3MON4D3/cmp-luasnip-choice
    'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
    'jcha0713/cmp-tw2css',                 -- https://github.com/jcha0713/cmp-tw2css
    'hrsh7th/cmp-emoji',                   -- https://github.com/hrsh7th/cmp-emoji
    'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp-signature-help', -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
    'pontusk/cmp-sass-variables',          -- https://github.com/pontusk/cmp-sass-variables
    'wassimk/cmp-rails-fixture-names',     -- https://github.com/wassimk/cmp-rails-fixture-names
    'wassimk/cmp-rails-fixture-types',     -- https://github.com/wassimk/cmp-rails-fixture-types
    'wassimk/cmp-feature-flipper',         -- https://github.com/wassimk/cmp-feature-flipper
    'danymat/neogen',                      -- https://github.com/danymat/neogen
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
    'nvim-lua/plenary.nvim',
    'L3MON4D3/LuaSnip',
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local neogen = require("neogen")
    local luasnip_choice = require('cmp_luasnip_choice')

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

    luasnip_choice.setup({
      auto_open = true,
    })

    require('nvim-autopairs').setup({
      disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" }
    })

    --   פּ ﯟ   some other good icons
    local kind_icons = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable() then
            luasnip.jump(1)
          elseif neogen.jumpable() then
            neogen.jump_next()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable() then
            luasnip.jump(-1)
          elseif neogen.jumpable(true) then
            neogen.jump_prev()
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
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- ["<Space><Space>"] = cmp.mapping.confirm({ select = false }),
        -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      },
      formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          tw2css = '[Tailwind]',
          luasnip = '[LuaSnip]',
          luasnip_choice = '[LuaSnip_Choice]',
          nvim_lua = '[NVim Lua]',
          nvim_lsp = '[LSP]',
          buffer = '[Buffer]',
          path = '[Path]',
        })[entry.source.name]
        return vim_item
      end,
      },
      sources = {
        { name = 'luasnip' },
        { name = 'luasnip_choice' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'cmp-tw2css' },
        { name = 'cmp-sass-variables' },
        { name = 'cmp-feature-flipper' },
        { name = 'rails-fixture-names' },
        { name = 'rails-fixture-types' },
        { name = 'buffer', max_item_count = 6 },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', keyword_length = 5 },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
          { name = 'cmdline' },
        }),
    })
  end
  --opts = function(_, opts)
  --  local cmp = require('cmp')
  --  local luasnip = require('luasnip')


  --  local has_words_before = function()
  --    unpack = unpack or table.unpack
  --    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --  end

  --  opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
  --    { name = "nvim_lua" },
  --    { name = 'nvim_lsp_signature_help' },
  --    { name = 'cmp-tw2css' },
  --    { name = 'neorg' },
  --    { name = 'emoji' },
  --  }))
  --  opts.mapping = cmp.mapping.preset.insert({
  --    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
  --    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
  --    ['<C-j>'] = cmp.mapping(function(fallback)
  --      if cmp.visible() then
  --        cmp.select_next_item()
  --      elseif luasnip.jumpable() then
  --        luasnip.jump(1)
  --      elseif has_words_before() then
  --        cmp.complete()
  --      else
  --        fallback()
  --      end
  --    end, { 'i', 's' }),
  --    ['<C-k>'] = cmp.mapping(function(fallback)
  --      if cmp.visible() then
  --        cmp.select_prev_item()
  --      elseif luasnip.jumpable() then
  --        luasnip.jump(-1)
  --      else
  --        fallback()
  --      end
  --    end, { 'i', 's' }),
  --    ["<C-e>"] = cmp.mapping({
  --      i = cmp.mapping.abort(),
  --      c = cmp.mapping.close(),
  --    }),
  --    ['jk'] = cmp.mapping.confirm({ select = true }),
  --    -- 	-- Accept currently selected item. If none selected, `select` first item.
  --    -- 	-- Set `select` to `false` to only confirm explicitly selected items.
  --    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --    -- ["<Space><Space>"] = cmp.mapping.confirm({ select = false }),
  --  })
  --end,
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

