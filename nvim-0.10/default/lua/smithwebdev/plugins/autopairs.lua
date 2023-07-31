return {
  'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs
  event = 'InsertEnter',
  config = function()
    local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
    if not autopairs_status then
      return
    end

    autopairs.setup({
      --check_ts = true,
      --ts_config = {
      --	lua = { "string" },
      --	javascript = { "template_string" },
      --	java = false,
      --},
      ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
      disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
      --fast_wrap = {
      --  map = '<c-e>',
      --  chars = { '{', '[', '(', '"', "'" },
      --  pattern = [=[[%'%"%>%]%)%}%,]]=],
      --  end_key = '$',
      --  keys = 'qwertyuiopzxcvbnmasdfghjkl',
      --  check_comma = true,
      --  highlight = 'Search',
      --  highlight_grey='Comment'
      --},
    })

    -- If statement to ensure that Nvim-Autopairs doesnt interfere with
    -- Navigation.lua plugin
    if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
      require("cmp").setup.buffer { completion = { enable = false }}
    end

    local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not cmp_autopairs_status then
      return
    end

    local cmp_setup, cmp = pcall(require, "cmp")
    if not cmp_setup then
      return
    end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  end,
  --config = function()
  --  local pair = require('nvim-autopairs')
  --  local Rule = require('nvim-autopairs.rule')
  --  local cond = require('nvim-autopairs.conds')

  --  pair.setup({
  --    enable_check_bracket_line = false -- Don't add pairs if close pair is in the same line
  --  })
  --  pair.add_rules {
  --    -- function() | end pair for lua
  --    Rule('function() ', ' end', { 'lua' }),
  --    -- #include <|> pair for c and cpp
  --    Rule('#include <', '>', { 'c', 'cpp' }),
  --    -- Add spaces in pair after parentheses
  --    -- (|) --> space --> ( | )
  --    -- ( | ) --> ) --> ( )|
  --    Rule(' ', ' ')
  --    :with_pair(function (opts)
  --      local pair_set = opts.line:sub(opts.col - 1, opts.col)
  --      return vim.tbl_contains({ '()', '[]', '{}' }, pair_set)
  --    end)
  --    :with_del(cond.none()),
  --    Rule('( ', ' )')
  --    :with_pair(function() return false end)
  --    :with_move(function(opts)
  --      return opts.prev_char:match('.%)') ~= nil
  --    end)
  --    :use_key(')'),
  --    Rule('{ ', ' }')
  --    :with_pair(function() return false end)
  --    :with_move(function(opts)
  --      return opts.prev_char:match('.%}') ~= nil
  --    end)
  --    :use_key('}'),
  --    Rule('[ ', ' ]')
  --    :with_pair(function() return false end)
  --    :with_move(function(opts)
  --      return opts.prev_char:match('.%]') ~= nil
  --    end)
  --    :use_key(']'),
  --    -- Auto add space on =
  --    Rule('=', '')
  --    :with_pair(cond.not_inside_quote())
  --    :with_pair(function(opts)
  --      local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
  --      if last_char:match('[%w%=%s]') then
  --        return true
  --      end
  --      return false
  --    end)
  --    :replace_endpair(function(opts)
  --      local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
  --      local next_char = opts.line:sub(opts.col, opts.col)
  --      next_char = next_char == ' ' and '' or ' '
  --      if prev_2char:match('%w$') then
  --        return '<bs> =' .. next_char
  --      end
  --      if prev_2char:match('%=$') then
  --        return next_char
  --      end
  --      if prev_2char:match('=') then
  --        return '<bs><bs>=' .. next_char
  --      end
  --      return ''
  --    end)
  --    :set_end_pair_length(0)
  --    :with_move(cond.none())
  --    :with_del(cond.none())
  --  }
  --  -- Insert `()` after select function or method item
  --  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  --  local cmp = require('cmp')
  --  cmp.event:on(
  --  'confirm_done',
  --  cmp_autopairs.on_confirm_done()
  --  )
  --end,
}
