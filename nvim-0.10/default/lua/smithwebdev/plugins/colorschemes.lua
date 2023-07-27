return {
  {'vim-scripts/ScrollColors'},        -- https://github.com/vim-scripts/ScrollColors
  {'ray-x/starry.nvim'}, -- https://github.com/ray-x/starry.nvim
  {'yonlu/omni.vim'},                  -- https://github.com/yonlu/omni.vim
  {'flazz/vim-colorschemes'},          --https://github.com/flazz/vim-colorschemes
  {'rafi/awesome-vim-colorschemes'},   --https://github.com/rafi/awesome-vim-colorschemes
  {'numToStr/Sakura.nvim'},            --https://github.com/numToStr/Sakura.nvim
  --{'hardhackerlabs/themes'},           --https://github.com/hardhackerlabs/themes
  {
    'B4mbus/oxocarbon-lua.nvim',       --https://github.com/B4mbus/oxocarbon-lua.nvim
    init = function()
      vim.g.oxocarbon_lua_transparent = true
      vim.g.oxocarbon_lua_alternative_telescope = true
    end
  },
  {
    'folke/tokyonight.nvim',           --https://github.com/folke/tokyonight.nvim
    opts = {
      dim_inactive = true,
      style = {
        comments = { italic = true },
        keywords = { italic = true },
        floats = 'normal',
        functions = { italic = true },
        sidebars = 'normal',
        variables = {},
      },
      sidebars = {},
      terminal_colors = true,
      transparent = true,
    }
  },
}

