---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  Settings                   --
---[[---------------------------------------]]---

--[[ Completion Options ]]
--
vim.opt.completeopt = "menu,menuone,noselect"
--vim.opt.shortmess                     = 'csa'   --Adjust short system messages
vim.opt.shortmess = { W = true, I = true, c = true }
-- vim.opt.updatetime                   = 2000
vim.opt.timeout = true
vim.opt.timeoutlen = 1500

--[[ Fold Options ]]
--
--vim.opt.foldmethod                      = 'expr'
--vim.opt.foldexpr                        = 'nvim_treesitter#foldexpr()'
--vim.opt.foldnestmax                     = 3
--vim.opt.foldenable                      = true
--vim.opt.foldlevel                       = 99

--[[ Indentation Options ]]
--
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2

--[[ Line Options ]]
--
vim.opt.cursorline = false
vim.opt.formatoptions = "jcroqlnt"
vim.opt.list = true
vim.opt.listchars = "tab:→ ,trail:·,extends:…,eol:↩" --space:·,
vim.opt.scrolloff = 999
vim.opt.showbreak = "+++"
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 15
vim.opt.textwidth = 80

--[[ Search Options ]]
--
vim.opt.ignorecase = true
vim.opt.path = "**"
vim.opt.smartcase = true
vim.opt.wrap = false
--vim.opt.wildmode                        = 'longest:full, full'

--[[ File ]]
--
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.spelllang = { "en" }
vim.opt.swapfile = false
vim.opt.termguicolors = true
--vim.opt.t_Co                          = '256'
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 10000

--[[ Line Numbering ]]
--
vim.opt.number = true
vim.opt.relativenumber = true

--[[ Window/Buffer/Tab Options ]]
--
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.guifont = "FiraCode"
vim.opt.hidden = true
vim.opt.laststatus = 0
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.writebackup = false
--vim.opt.laststatus                    = 3
vim.cmd([[:highlight WinSeparator guibg = None]])
vim.opt.completefunc = "emoji#complete"

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

-- Fix markdown indentation Settings
