 
-- {{{ Globals

vim.g.gitblame_enabled = 0
vim.g.gui_font_face = 'UbuntuMono Nerd Font Mono - Bold'
vim.g.gui_font_size = 12
vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_width = 2
vim.g.python_host_program = '/usr/bin/python'
vim.g.slime_target = 'neovim'

-- }}} Globals

-- {{{ Opts
vim.opt.backspace = { 'eol', 'start', 'indent' }
vim.opt.backup = false
vim.opt.belloff = 'all'
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 2
vim.opt.colorcolumn = '120'
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
vim.opt.foldmethod = 'marker'
vim.opt.formatoptions:append 'rn1'
vim.opt.formatoptions:remove 'oa2'
vim.opt.hlsearch = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = false
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = '»·', trail = '·', extends = '↪', precedes = '↩', }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.opt.relativenumber = false
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.spelllang = 'en_us'
vim.opt.splitbelow = true
-- vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wildignore = { '*.o', '*~', '*.pyc', '*pycache*' }
vim.opt.wrap = false
-- }}} Opts

-- {{{ Misc

vim.wildmode = { 'full', 'longest', 'lastused' }
vim.wildoptions = 'pum'

vim.wo.number = true
vim.wo.signcolumn = 'yes'

vim.g['gtest#gtest_command'] = './build/tests/tests'
vim.g['test#cpp#runner'] = 'ctest'
vim.g['test#cpp#catch2#bin_dir'] = '../build/tests/'

-- }}} Misc

vim.o.statusline = '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
