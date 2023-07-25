return {
  'stevearc/oil.nvim', -- https://github.com/stevearc/oil.nvim
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      keymaps = {
        ["g?"] = 'actions.show_help',
        ["<CR>"] = 'actions.select',
        ["<Space>\\"] = 'actions.select_vsplit',
        ["<Space>-"] = 'actions.select_split',
        ["<Space><Tab>"] = 'actions.select_tab',
        ["<C-p>"] = 'actions.preview',
        ["<C-e>"] = 'actions.close',
        ["<Space>r"] = 'actions.refresh',
        ["-"] = 'actions.parent',
        ["_"] = 'actions.open_cwd',
        ["`"] = 'actions.cd',
        ["~"] = 'actions.tcd',
        ["g."] = 'actions.toggle_hidden',
      },
      use_default_keymaps = false
    })
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end
}
