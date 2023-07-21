return {
  {
    'ludovicchabant/vim-gutentags', -- https://github.com/ludovicchabant/vim-gutentags
    event = "VeryLazy",
    init = function()
      vim.o['statusline'] = "%{gutentags#statusline('[', ']')}"
      vim.g.gutentags_generate_on_missing = 1

    end,
    --commands = {
      -- :GutentagsUpdate,   desc = 'Update tag file with current buffer info'
      -- :GutentagsUpdate!,   desc = 'Update tag file with whole project info'
      -- :GutentagsToggleEnabled,  desc = 'Disables and re-enables Gutentags'
      -- :GutentagsToggleEnabled,  desc = 'Disables and re-enables Gutentags'
    --},
    config = function() end,
  },
  --{
  --  'skywind3000/gutentags_plus', -- https://github.com/skywind3000/gutentags_plus
  --  event = "VeryLazy",
  --  keys = {},
  --  init = function()
  --    vim.g.gutentags_modules = 'ctags'
  --    vim.g.gutentags_cache_dir = expand('~/.cache/tags')
  --  end
  --},
  {
    'skywind3000/vim-preview', -- https://github.com/skywind3000/vim-preview
    event = "VeryLazy",
  }
}
