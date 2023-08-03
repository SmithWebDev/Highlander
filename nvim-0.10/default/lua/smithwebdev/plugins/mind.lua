return{
  'smithwebdev/mind.nvim',
  branch = 'v2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('mind').setup({
      normal = {
        ["<cr>"] = "open_data",
        ["<s-cr>"] = "open_data_index",
        ["<tab>"] = "toggle_node",
        ["<s-tab>"] = "toggle_node",
        ["/"] = "select_path",
        ["$"] = "change_icon_menu",
        c = "add_inside_end_index",
        I = "add_inside_start",
        i = "add_inside_end",
        l = "copy_node_link",
        L = "copy_node_link_index",
        d = "delete",
        D = "delete_file",
        O = "add_above",
        o = "add_below",
        q = "quit",
        r = "rename",
        R = "change_icon",
        u = "make_url",
        x = "select",
      },
      selection = {
        ["<cr>"] = "open_data",
        ["<s-tab>"] = "toggle_node",
        ["/"] = "select_path",
        I = "move_inside_start",
        i = "move_inside_end",
        O = "move_above",
        o = "move_below",
        q = "quit",
        x = "select",
      }

    })
    -- TODO: Keymap Strategy
    vim.keymap.set('n', '<Tab>mP', ':MindOpenMain<CR>',          { desc = 'Open the main Mind tree. ', silent = true })
    vim.keymap.set('n', '<Tab>mp', ':MindOpenProject<CR>',       { desc = 'Open the project tree. ', silent = true })
    vim.keymap.set('n', '<Tab>ms', ':MindOpenSmartProject<CR>', { desc = ' open the project tree, either local, global, or prompt the user for which kind of project tree to create ', silent = true })
    vim.keymap.set('n', '<Tab>mr', ':MindReloadState<CR>',       { desc = ' Reload Mind state for global and local trees. ', silent = true })
    vim.keymap.set('n', '<Tab>mc', ':MindClose<CR>',             { desc = ' Close project or main mind tree if open. Resets ui cache. ', silent = true })
  end
}
