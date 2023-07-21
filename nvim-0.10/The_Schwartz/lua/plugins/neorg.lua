return {
  'nvim-neorg/neorg', -- https://github.com/nvim-neorg/neorg
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              projects = "Volumes/Untitled/Neorg/projects",
              notes = "Volumes/Untitled/Neorg/notes",
              diary = "Volumes/Untitled/Neorg/diary",
            },
          },
        },
        --["core.completion"] = {
        --  engine = 'nvim-cmp'
        --},
        ["core.integrations.treesitter"] = {},
        --["core.export.markdown"] = {"all"},
      },
    }
  end,
}
