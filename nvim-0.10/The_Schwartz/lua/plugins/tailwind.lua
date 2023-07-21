return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {}
      },
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    }
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true }
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  --{
  --  'razak17/tailwind-fold.nvim', -- https://github.com/razak17/tailwind-fold.nvim
  --  lazy = true,
  --  init = function()
  --    vim.cmd('set conceallevel=2')
  --    vim.cmd('concealcursor= ...')
  --  end,
  --  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --  ft = { 'html', 'eruby', 'tyescriptreact', 'javascriptreact' },
  --},
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm i && npm run build',
    opts = {
      on_save_enabled = true,
      on_save_pattern = { '*.html.erb' },
      node_path = 'node'
    }
  },
}
