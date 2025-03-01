-- # Simple neovim playground

-- {{{ Initial Options

vim.opt.foldmethod = 'marker'

-- }}} Initial Options

-- {{{ Plugin Free Key mappings

local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end


local function toggle_quickfix()
    if vim.fn.empty(vim.fn.getqflist()) == 1 then
        print("Quickfix list is empty!")
        return
    end

    local quickfix_open = false
    local windows = vim.api.nvim_list_wins()

    -- Check if any window is a quickfix window
    for _, win in ipairs(windows) do
        local wininfo = vim.fn.getwininfo(win)[1]
        if wininfo.loclist == 0 and wininfo.quickfix == 1 then
            quickfix_open = true
            break
        end
    end

    if quickfix_open then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

vim.api.nvim_create_user_command('CToggle', toggle_quickfix, {})



mymap('n', '<Space>cc', '<CMD>CToggle<CR>')
mymap('n', '<Space>co', '<CMD>CToggle<CR>')

mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
-- NOTE: move these two below to asyncrun plugin mapping
mymap('n', '<A-S-Return>', '<CMD>AsyncRun make<CR>')
mymap('n', '<Space><Return>', '<CMD>AsyncRun make<CR>')
mymap('n', '<Space>mm', '<CMD>silent make<CR>')
mymap('n', ']e', '<CMD>lua vim.diagnostic.goto_next()<CR>')
mymap('n', '<Space>ht', '<CMD>Tutor<CR>')
mymap('n', '<A-Tab>', '<CMD>bn<CR>')
mymap('n', '<A-S-Tab>', '<CMD>bp<CR>')
mymap('n', '<Space>oc', '<CMD>OpenConfig<CR>')
mymap('n', '<Space>bn', '<CMD>bn<CR>')
mymap('n', '<Space>bp', '<CMD>bp<CR>')
mymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
mymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
mymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
mymap('n', 'I', '<CMD>lua vim.diagnostic.show_line_diagnostics()<CR>')
mymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
mymap('n', 'ul', '<CMD>set number=true<CR>')
-- Window right
mymap('n', '<A-l>', '<CMD>wincmd l<CR>')
mymap('t', '<A-l>', '<CMD>wincmd l<CR>')
mymap('n', '<Space>wl', '<CMD>wincmd l<CR>')
mymap('t', '<Space>wl', '<CMD>wincmd l<CR>')
mymap('n', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")
mymap('t', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")
-- Window left
mymap('n', '<A-h>', '<CMD>wincmd h<CR>')
mymap('t', '<A-h>', '<CMD>wincmd h<CR>')
mymap('n', '<Space>wh', '<CMD>wincmd h<CR>')
mymap('t', '<Space>wh', '<CMD>wincmd h<CR>')
mymap('n', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")
mymap('t', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")
-- Window down
mymap('n', '<A-j>', '<CMD>wincmd j<CR>')
mymap('t', '<A-j>', '<CMD>wincmd j<CR>')
mymap('n', '<Space>wj', '<CMD>wincmd j<CR>')
mymap('t', '<Space>wj', '<CMD>wincmd j<CR>')
mymap('n', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")
mymap('t', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")
-- Window up
mymap('n', '<A-k>', '<CMD>wincmd k<CR>')
mymap('t', '<A-k>', '<CMD>wincmd k<CR>')
mymap('n', '<Space>wk', '<CMD>wincmd k<CR>')
mymap('t', '<Space>wk', '<CMD>wincmd k<CR>')
mymap('n', '<A-S-k>', "<CMD>lua require('smart-splits').resize_up()<CR>")
mymap('t', '<A-S-k>', "<CMD>lua require('smart-splits').resize_up()<CR>")
mymap('n', '<A-S-->',
	"<CMD>lua require('smart-splits').resize_up()<CR><CMD>lua require('smart-splits').resize_left()<CR>")
mymap('n', '<A-S-=>',
	"<CMD>lua require('smart-splits').resize_down()<CR><CMD>lua require('smart-splits').resize_right()<CR>")
-- Split pane horizontal
mymap('n', '<A-s>', '<CMD>split<CR>')
mymap('n', '<Space>ws', '<CMD>split<CR>')
mymap('t', '<A-s>', '<CMD>split<CR>')
-- Split pane vertical
mymap('n', '<A-v>', '<CMD>vsplit<CR>')
mymap('n', '<Space>wv', '<CMD>vsplit<CR>')
mymap('t', '<A-v>', '<CMD>vsplit<CR>')
-- Delete pane
mymap('n', '<A-d>', '<CMD>close<CR>')
mymap('n', '<Space>wd', '<CMD>close<CR>')
mymap('t', '<A-d>', '<CMD>close<CR>')
-- Project Shell
mymap('n', '<Space>ps', '<CMD>sp<CR> <CMD>wincmd j<CR> <CMD>terminal<CR> a')
mymap('t', '<Space>ps', '<CMD>sp<CR> <CMD>wincmd j<CR> <CMD>terminal<CR> a')
mymap('n', '<C-t>', '<CMD>tabnew<CR>')
-- NOTE: these dont work?
-- mymap('n', '<C-Tab>', '<CMD>tabnext<CR>')
-- mymap('n', '<C-S-Tab>', '<CMD>tabprevious<CR>')
mymap('n', '<A-1>', ':tabn1<CR>')
mymap('n', '<A-2>', ':tabn2<CR>')
mymap('n', '<A-3>', ':tabn3<CR>')
mymap('n', '<A-4>', ':tabn4<CR>')
mymap('n', '<A-5>', ':tabn5<CR>')
mymap('n', '<A-6>', ':tabn6<CR>')
mymap('n', '<A-7>', ':tabn7<CR>')
mymap('n', '<A-8>', ':tabn8<CR>')
mymap('n', '<A-9>', ':tabn9<CR>')
mymap('n', '<Space>qq', '<CMD>wa<CR><CMD>qa!<CR>')
mymap('n', '<Space>rr', '<CMD>luafile $MYVIMRC<CR><CMD>ReloadFTPlugins<CR><CMD>echo "Reloaded config"<CR>')
mymap('n', '<Space>tgc', '<CMD>Telescope git_commits<CR>')

mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')


-- }}} Base Key mappings

-- {{{ General Options

-- {{{ Statusline active/not_active behavior
vim.cmd('highlight StatusLine guifg=#FF33FF guibg=#00FFFFBB')    -- Active buffer colors
vim.cmd('highlight StatusLineNC guifg=#888888 guibg=#000000')    -- Inactive buffer colors
vim.cmd('highlight StatusLineActive guifg=#FF33FF guibg=#003366') -- Different color for active buffer

-- Set highlight for window separators
vim.cmd('highlight WinSeparatorActive guifg=#FF33FF')  -- Color for active window separator
vim.cmd('highlight WinSeparatorNC guifg=#444444')      -- Color for inactive window separators

-- Function to update all status lines and separators
function UpdateAll()
	local current_win = vim.api.nvim_get_current_win()
	-- Update status line colors
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local width = vim.fn.winwidth(win)
		local status_line = string.rep("─", width)
		-- Update the status line based on window focus
		if win == current_win then
			vim.api.nvim_set_option_value('statusline', '%#StatusLineActive#' .. status_line, { win = win })
			vim.api.nvim_set_option_value('winhighlight', 'WinSeparator:WinSeparatorActive', { win = win })
		else
			vim.api.nvim_set_option_value('statusline', '%#StatusLineNC#' .. status_line, { win = win })
			vim.api.nvim_set_option_value('winhighlight', 'WinSeparator:WinSeparatorNC', { win = win })
		end
	end
end
-- Autocommand to refresh status lines and separators on resize
vim.api.nvim_create_autocmd("VimResized", { callback = UpdateAll })

-- Autocommand to update status lines and separators on window focus changes
vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, { callback = UpdateAll })
vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, { callback = UpdateAll })

-- Initial setup to set status lines and separators for all windows
UpdateAll()

vim.cmd('highlight EndOfBuffer guifg=#881188')  -- Customize color as needed


-- }}} Statusline active/not_active behavior

vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.g.slime_target = 'neovim'
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- {{{ Unmerged options
-- -- Leader keys
--
-- -- Globals
-- vim.g.gui_font_face = 'UbuntuMono Nerd Font Mono - Bold'
-- vim.g.gui_font_size = 12
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ','
-- vim.g.minimap_auto_start = 0
-- vim.g.minimap_auto_start_win_enter = 1
-- vim.g.minimap_width = 2
-- vim.g.python_host_program = '/usr/bin/python'
--
-- -- Opts
-- vim.opt.backspace = { 'eol', 'start', 'indent' }
-- vim.opt.backup = false
-- vim.opt.belloff = 'all'
-- vim.opt.breakindent = true
-- vim.opt.cmdheight = 2
-- vim.opt.colorcolumn = '120'
-- vim.opt.completeopt = { 'menuone', 'noselect' }
-- vim.opt.conceallevel = 0
-- vim.opt.cursorline = true
-- vim.opt.expandtab = true
-- vim.opt.fileencoding = 'utf-8'
-- -- vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
-- vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
-- vim.opt.foldmethod = 'marker'
-- vim.opt.formatoptions:append 'rn1'
-- vim.opt.formatoptions:remove 'oa2'
-- vim.opt.hlsearch = false
-- vim.opt.hlsearch = true
-- vim.opt.ignorecase = true
-- vim.opt.incsearch = false
-- vim.opt.joinspaces = false
-- vim.opt.laststatus = 2
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '»·', trail = '·', extends = '↪', precedes = '↩', }
-- vim.opt.mouse = 'a'
vim.opt.number = true
-- vim.opt.pumblend = 0
-- vim.opt.pumheight = 15
-- vim.opt.relativenumber = false
-- vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 8
-- vim.opt.smartcase = true
-- vim.opt.smartindent = true
-- vim.opt.spell = false
-- vim.opt.spelllang = 'en_us'
-- vim.opt.splitbelow = true
-- -- vim.opt.splitright = true
-- vim.opt.swapfile = false
-- vim.opt.termguicolors = true
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 300
-- vim.opt.undofile = true
-- vim.opt.updatetime = 300
-- vim.opt.wildignore = { '*.o', '*~', '*.pyc', '*pycache*' }
-- vim.opt.wrap = false
--
-- -- Misc options
-- vim.wildmode = { 'full', 'longest', 'lastused' }
-- vim.wildoptions = 'pum'
-- vim.wo.number = true
-- vim.wo.signcolumn = 'yes'
-- vim.g['gtest#gtest_command'] = './build/tests/tests'
-- vim.g['test#cpp#runner'] = 'ctest'
-- vim.g['test#cpp#catch2#bin_dir'] = '../build/tests/'
--
--
-- -- vim.o.fillchars = '!'
-- -- vim.opt.fillchars = { eob = '' }  -- No character for end of buffer
--
-- -- vim.o.fillchars = "~"  -- Set end of buffer character to a space
-- }}} Unmerged options

-- }}} General Options

-- {{{ User Commands

-- Prototype (example) hello world command
vim.api.nvim_create_user_command('SayHello', function()
	require 'playground'.hello_world()
end, {})
-- Command to reload FTPlugins for dev purposes

vim.api.nvim_create_user_command('ReloadFTPlugins', 'execute "source" glob($MYVIMRC .. "ftplugin/*.vim")', {})

-- }}} User Commands

-- {{{ Lazy.nvim bootrap script

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- }}} Lazy.nvim bootrap script

-- {{{ mycolors
---@class PaletteColors
local mycolors = {

  -- Whites
  pastelSnow = '#fff7f7', -- #fff7f7 Pantone 182C

  -- Reds
  trackAndField = '#d71010', -- Pantone 186C

  -- Greens
  pastelOliveCreed = '#e5edc4', -- #e5edc4 Pantone 2309C
  energos = '#cded49', -- #cded49 Pantone 380C
  jazzercise = '#bde225', --#bde225 Pantone 2290C
  indiaGreen = '#1c890a', -- Pantone 2424C
  appleIiLime = '#28d10c', -- Pantone

  -- Greys
  pigIron = '#484747',

  -- Blacks
  midnightBlack = '#000000', -- Pantone Black 3c
  underworld = '#1f211c', -- Pantone Black 3c
  velvetBlack = '#1d1818', -- Pantone Neutral Black C

  -- Yellows
  sizzlingSunrise = '#fedb00', -- Pantone 108C

  -- Blues
  pastelFirstSnow = '#e2ebf7', -- #e2ebf7 Pantone 2707C
  vibrantMint = '#02fce3',
  bluePartyParrot = '#7b7eff', -- Pantone 292C
  palatinateBlue = '#3845df', -- Pantone 2727C

  -- Oranges
  lightSalmon = '#ffa47b', -- #ffa47b Pantone 7410C
  phillipineOrange = '#ff7300',

  -- Browns
  moussaka = '#6f3014', -- Pantone 732C
  donJuan = '#594e4e', -- Pantone 411C
  matterhorn = '#574e4e', -- Pantone 411C
  chinotto = '#564949', -- Pantone 438C
  rhodoniteBrown = '#4c4141', -- Pantone 438C
  smokedBlackCoffee = '#3e3333', -- Pantone 439C
  chocolatePlum = '#3c2e2e', -- #3c2e2e Pantone 440C

  -- Pinks
  munchOnMelon = '#f23f72', -- Pantone 191C
  crumblyLipstick = '#ef6abf', -- Pantone 224C

  -- Purples
  plasmaTrail = '#cd95fa', -- Pantone 2717 C
  crashPink = '#cd88fd', -- #cd88fd Pantone 2717C
  piscesVividAmethyst = '#a753ec', -- Pantone 265C
  veronica = '#9715ff', -- Pantone 2592C
  eineKleineNachtmusik = '#4f1f91', -- Pantone 267C
  middleRedPurple = '#230839', -- Pantone 2627 C
}
-- }}} mycolors

-- {{{ Plugins

--ultisnips ultisnips source =  Neovim plugins (managed by lazy)

---@diagnostic disable: missing-fields
require("lazy").setup({
  spec = {

		-- -- My dashboard
		--  { dir = '/home/jordan/.config/nvim-playground/plugins/mep-dash.nvim/',
		--  event = 'VimEnter',
		-- opts = {
		-- 	{a = "asdf",
		-- 	 b = {"c", 2}}
		--  },
		-- },


-- {
--     dir = '/home/jordan/.config/nvim-playground/plugins/mep-menu.nvim/',
--     event = 'VimEnter',
--     opts = {
--         buttons = {
--             {text = "Button 1", action = function() print("Hello") end},
--             {text = "Button 2", action = function() print("Goodbye") end},
--         },
--     },
-- },



{
    "f-person/git-blame.nvim",
    event = "VeryLazy",
		config = function()
			vim.g.gitblame_enabled = 0
			require'gitblame'.setup({
        -- your configuration comes here
        -- for example
        enabled = true,  -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    })
		end
},


  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },

{
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = {
				'~/orgfiles/**/*',
				'~/dev/**/*',
				'~/.config/nvim-playground/*',
			},
      org_default_notes_file = '~/orgfiles/refile.org',
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
},






-- {{{ Heirline
{
  'rebelot/heirline.nvim',
  -- You can optionally lazy-load heirline on UiEnter to make sure all required
  -- plugins and colorschemes are loaded before setup
  event = 'UiEnter',
  dependencies = {
    'glepnir/lspsaga.nvim',
    -- 'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    local conditions = require 'heirline.conditions'
    local utils = require 'heirline.utils'

    -- {{{ Colors
    local colors = {

      -- pylogo_bg = utils.get_highlight("PyLogo").bg,
      -- pylogo_fg = utils.get_highlight("PyLogo").fg,

      js_logo_bg = utils.get_highlight('JSLogo').bg,
      js_logo_fg = utils.get_highlight('JSLogo').fg,

      pylogo_bg = utils.get_highlight('PyLogo').bg,
      pylogo_fg = utils.get_highlight('PyLogo').fg,
      shell_logo_bg = utils.get_highlight('ShellLogo').bg,
      shell_logo_fg = utils.get_highlight('ShellLogo').fg,
      -- bright_bg = utils.get_highlight("Folded").bg,
      button_bg = utils.get_highlight('Folded').bg,
      lightdark_fg = utils.get_highlight('Normal').fg,
      lightdark_bg = utils.get_highlight('StatusLine').bg,
      statusline_bg = utils.get_highlight('StatusLine').bg,
      -- bright_fg = utils.get_highlight("Folded").fg,
      -- button_bg = utils.get_highlight("TabLineSel").fg,
      bright_bg = utils.get_highlight('NonText').fg,
      bright_fg = utils.get_highlight('NonText').fg,
      red = utils.get_highlight('DiagnosticError').fg,
      dark_red = utils.get_highlight('DiffDelete').bg,
      green = utils.get_highlight('String').fg,
      blue = utils.get_highlight('Function').fg,
      gray = utils.get_highlight('NonText').fg,
      orange = utils.get_highlight('Constant').fg,
      purple = utils.get_highlight('Statement').fg,
      cyan = utils.get_highlight('Special').fg,
      diag_warn = utils.get_highlight('DiagnosticWarn').fg,
      diag_error = utils.get_highlight('DiagnosticError').fg,
      diag_hint = utils.get_highlight('DiagnosticHint').fg,
      diag_info = utils.get_highlight('DiagnosticInfo').fg,
      git_del = utils.get_highlight('diffDeleted').fg,
      git_add = utils.get_highlight('diffAdded').fg,
      git_change = utils.get_highlight('diffChanged').fg,
    }

    local function setup_colors()
      return {
        -- bright_bg = utils.get_highlight("Folded").bg,
        -- bright_fg = utils.get_highlight("Folded").fg,
        bright_bg = utils.get_highlight('NonText').fg,
        bright_fg = utils.get_highlight('NonText').fg,
        red = utils.get_highlight('DiagnosticError').fg,
        dark_red = utils.get_highlight('DiffDelete').bg,
        green = utils.get_highlight('String').fg,
        blue = utils.get_highlight('Function').fg,
        gray = utils.get_highlight('NonText').fg,
        orange = utils.get_highlight('Constant').fg,
        purple = utils.get_highlight('Statement').fg,
        cyan = utils.get_highlight('Special').fg,
        diag_warn = utils.get_highlight('DiagnosticWarn').fg,
        diag_error = utils.get_highlight('DiagnosticError').fg,
        diag_hint = utils.get_highlight('DiagnosticHint').fg,
        diag_info = utils.get_highlight('DiagnosticInfo').fg,
        git_del = utils.get_highlight('diffDeleted').fg,
        git_add = utils.get_highlight('diffAdded').fg,
        git_change = utils.get_highlight('diffChanged').fg,
      }
    end

    -- }}} Colors

    -- {{{ Autos
    vim.api.nvim_create_augroup('Heirline', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        utils.on_colorscheme(setup_colors)
      end,
      group = 'Heirline',
    })
    -- }}} Autos

    --- {{{ Components

    -- {{{ Bufferline

    -- local TablineBufnr = {
    --   provider = function(self)
    --     return tostring(self.bufnr) .. ". "
    --   end,
    --   hl = "Comment",
    -- }

    -- -- -- we redefine the filename component, as we probably only want the tail and not the relative path
    -- local TablineFileName = {
    --   provider = function(self)
    --     -- self.filename will be defined later, just keep looking at the example!
    --     local filename = self.filename
    --     filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
    --     return filename
    --   end,
    --   hl = function(self)
    --     return { bold = self.is_active or self.is_visible, italic = true }
    --   end,
    -- }

    -- -- this looks exactly like the FileFlags component that we saw in
    -- -- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
    -- -- also, we are adding a nice icon for terminal buffers.
    -- local TablineFileFlags = {
    --   {
    --     condition = function(self)
    --       return vim.api.nvim_buf_get_option(self.bufnr, "modified")
    --     end,
    --     provider = "[+]",
    --     hl = { fg = "green" },
    --   },
    --   {
    --     condition = function(self)
    --       return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
    --           or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
    --     end,
    --     provider = function(self)
    --       if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
    --         return "  "
    --       else
    --         return ""
    --       end
    --     end,
    --     hl = { fg = "orange" },
    --   },
    -- }

    -- Here the filename block finally comes together
    -- local TablineFileNameBlock = {
    --   init = function(self)
    --     self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    --   end,
    --   hl = function(self)
    --     if self.is_active then
    --       return "TabLineSel"
    --       -- why not?
    --       -- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
    --       --     return { fg = "gray" }
    --     else
    --       return "TabLine"
    --     end
    --   end,
    --   on_click = {
    --     callback = function(_, minwid, _, button)
    --       if button == "m" then     -- close on mouse middle click
    --         vim.schedule(function()
    --           vim.api.nvim_buf_delete(minwid, { force = false })
    --         end)
    --       else
    --         vim.api.nvim_win_set_buf(0, minwid)
    --       end
    --     end,
    --     minwid = function(self)
    --       return self.bufnr
    --     end,
    --     name = "heirline_tabline_buffer_callback",
    --   },
    --   TablineBufnr,
    --   FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
    --   TablineFileName,
    --   TablineFileFlags,
    -- }

    -- a nice "x" button to close the buffer
    -- local TablineCloseButton = {
    --   condition = function(self)
    --     return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
    --   end,
    --   { provider = " " },
    --   {
    --     provider = "",
    --     hl = { fg = "gray" },
    --     on_click = {
    --       callback = function(_, minwid)
    --         vim.schedule(function()
    --           vim.api.nvim_buf_delete(minwid, { force = false })
    --           vim.cmd.redrawtabline()
    --         end)
    --       end,
    --       minwid = function(self)
    --         return self.bufnr
    --       end,
    --       name = "heirline_tabline_close_buffer_callback",
    --     },
    --   },
    -- }

    -- The final touch!
    -- local TablineBufferBlock = utils.surround({ "", "" }, function(self)
    --   if self.is_active then
    --     return utils.get_highlight("TabLineSel").bg
    --   else
    --     return utils.get_highlight("TabLine").bg
    --   end
    -- end, { TablineFileNameBlock, TablineCloseButton })

    -- and here we go
    -- local BufferLine = utils.make_buflist(
    --     TablineBufferBlock,
    --     { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
    --     { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    --     -- by the way, open a lot of buffers and try clicking them ;)
    -- )

    -- }}} Bufferline

    -- {{{ Diagnostics

    local Diagnostics = {

      on_click = {
        callback = function()
          vim.cmd 'TroubleToggle'
        end,
        name = 'Trouble',
      },

      condition = conditions.has_diagnostics,
      static = {
        error_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignError')[1].text,
        warn_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignWarn')[1].text,
        info_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignInfo')[1].text,
        hint_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignHint')[1].text,
      },

      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { 'DiagnosticChanged', 'BufEnter' },

      {
        provider = '![',
      },
      {
        provider = function(self)
          -- 0 is just another output, we can decide to print it or not!
          return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
        end,
        hl = { fg = 'diag_error', bold = true },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
        end,
        hl = { fg = 'diag_warn', bold = true },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. ' ')
        end,
        hl = { fg = 'diag_info', bold = true },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = 'diag_hint', bold = true },
      },
      {
        provider = ']',
      },
    }

    -- }}} Diagnostics

    -- {{{ FileType

    local FileType = {
      provider = function()
        return string.upper(vim.bo.filetype)
      end,
      hl = { fg = utils.get_highlight('Type').fg, bold = true },
    }

    -- }}} FileType

    -- {{{ FileNameBlock
    local FileNameBlock = {

      -- let's first set up some attributes needed by this component and it's children
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }
    -- We can now define some children separately and add them later

    -- local FileIcon = {

    --   on_click = {
    --     callback = function() vim.cmd("AerialToggle") end,
    --     name = "Trouble",
    --   },
    --   init = function(self)
    --     local filename = self.filename
    --     local extension = vim.fn.fnamemodify(filename, ':e')
    --     self.icon, self.icon_color =
    --         require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
    --   end,
    --   provider = function(self)
    --     return self.icon and (self.icon .. ' ')
    --   end,
    --   hl = function(self)
    --     return { fg = self.icon_color }
    --   end,
    -- }

    local FileName = {

      on_click = {
        callback = function()
          vim.cmd 'NvimTreeToggle'
        end,
        name = 'NvimTreeToggle',
      },

      provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ':.')
        if filename == '' then
          return '[No Name]'
        end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      -- hl = { fg = utils.get_highlight('Directory').fg },
      hl = { fg = '#ff0f00', bold = true },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = '[+]',
        hl = { fg = 'green' },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = '',
        hl = { fg = 'orange' },
      },
    }

    -- Now, let's say that we want the filename color to change if the buffer is
    -- modified. Of course, we could do that directly using the FileName.hl field,
    -- but we'll see how easy it is to alter existing components using a "modifier"
    -- component

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          -- use `force` because we need to override the child's hl foreground
          return { fg = 'cyan', bold = true, force = true }
        end
      end,
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(
      FileNameBlock,
      -- FileIcon,
      utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
      FileFlags,
      { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
    )

    -- }}} FileNameBlock

    -- {{{ Git
    local Git = {

      on_click = {
        callback = function()
          require('neogit').open { kind = 'vsplit' }
        end, --
        name = 'neogit',
      },

      condition = conditions.is_git_repo,

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      hl = { fg = 'orange', bold = true },

      { -- git branch name
        provider = function(self)
          return ' ' .. self.status_dict.head
        end,
        hl = { bold = true },
      },
      -- You could handle delimiters, icons and counts similar to Diagnostics
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = '(',
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ('+' .. count)
        end,
        hl = { fg = '#00dd00', bold = true },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ('-' .. count)
        end,
        hl = { fg = '#cc0000', bold = true },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ('~' .. count)
        end,
        hl = { fg = '#cccc00', bold = true },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = ')',
      },
    }
    -- }}} Git

    -- {{{ HelpFileName
    local HelpFileName = {
      condition = function()
        return vim.bo.filetype == 'help'
      end,
      provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ':t')
      end,
      hl = { fg = colors.blue },
    }
    -- }}} HelpFileName

    -- {{{ LspActive

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { 'LspAttach', 'LspDetach', 'BufEnter' },

      -- You can keep it simple,
      -- provider = " [LSP]",

      -- Or complicate things a bit and get the servers names
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        return ' [' .. table.concat(names, ' ') .. ']'
      end,
      hl = { fg = 'green', bold = true },
    }

    -- }}} LspActive

    -- {{{ LSPMessages
    -- I personally use it only to display progress messages!
    -- See lsp-status/README.md for configuration options.

    -- Note: check "j-hui/fidget.nvim" for a nice statusline-free alternative.
    -- local LSPMessages = {
    --   provider = require("lsp-status").status,
    --   hl = { fg = "gray" },
    -- }
    -- }}} LSPMessages

    -- {{{ Navic

    -- Awesome plugin

    -- The easy way.
    -- local Navic = {
    --   condition = function() return require("nvim-navic").is_available() end,
    --   provider = function()
    --     return require("nvim-navic").get_location({ highlight = true })
    --   end,
    --   update = 'CursorMoved'
    -- }

    -- -- Full nerd (with icon colors and clickable elements)!
    -- -- works in multi window, but does not support flexible components (yet ...)
    -- local Navic = {
    --   condition = function() return require("nvim-navic").is_available() end,
    --   static = {
    --     -- create a type highlight map
    --     type_hl = {
    --       File = "Directory",
    --       Module = "@include",
    --       Namespace = "@namespace",
    --       Package = "@include",
    --       Class = "@structure",
    --       Method = "@method",
    --       Property = "@property",
    --       Field = "@field",
    --       Constructor = "@constructor",
    --       Enum = "@field",
    --       Interface = "@type",
    --       Function = "@function",
    --       Variable = "@variable",
    --       Constant = "@constant",
    --       String = "@string",
    --       Number = "@number",
    --       Boolean = "@boolean",
    --       Array = "@field",
    --       Object = "@type",
    --       Key = "@keyword",
    --       Null = "@comment",
    --       EnumMember = "@field",
    --       Struct = "@structure",
    --       Event = "@keyword",
    --       Operator = "@operator",
    --       TypeParameter = "@type",
    --     },
    --     -- bit operation dark magic, see below...
    --     enc = function(line, col, winnr)
    --       return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
    --     end,
    --     -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
    --     dec = function(c)
    --       local line = bit.rshift(c, 16)
    --       local col = bit.band(bit.rshift(c, 6), 1023)
    --       local winnr = bit.band(c, 63)
    --       return line, col, winnr
    --     end
    --   },
    --   init = function(self)
    --     local data = require("nvim-navic").get_data() or {}
    --     local children = {}
    --     -- create a child for each level
    --     for i, d in ipairs(data) do
    --       -- encode line and column numbers into a single integer
    --       local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
    --       local child = {
    --         {
    --           provider = d.icon,
    --           hl = self.type_hl[d.type],
    --         },
    --         {
    --           -- escape `%`s (elixir) and buggy default separators
    --           provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ''),
    --           -- highlight icon only or location name as well
    --           -- hl = self.type_hl[d.type],

    --           on_click = {
    --             -- pass the encoded position through minwid
    --             minwid = pos,
    --             callback = function(_, minwid)
    --               -- decode
    --               local line, col, winnr = self.dec(minwid)
    --               vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
    --             end,
    --             name = "heirline_navic",
    --           },
    --         },
    --       }
    --       -- add a separator only if needed
    --       if #data > 1 and i < #data then
    --         table.insert(child, {
    --           provider = " > ",
    --           hl = { fg = 'bright_fg' },
    --         })
    --       end
    --       table.insert(children, child)
    --     end
    --     -- instantiate the new child, overwriting the previous one
    --     self.child = self:new(children, 1)
    --   end,
    --   -- evaluate the children containing navic components
    --   provider = function(self)
    --     return self.child:eval()
    --   end,
    --   hl = { fg = "gray" },
    --   update = 'CursorMoved'
    -- }

    -- }}} Navic

    -- {{{ Ruler & ScrollBar

    -- We're getting minimalists here!
    local Ruler = {
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %P = percentage through file of displayed window
      provider = '%7(%l/%3L%):%2c %P',
    }
    -- I take no credits for this! :lion:
    local ScrollBar = {
      static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
      end,
      hl = { fg = 'blue', bg = 'bright_bg' },
    }

    -- }}} Ruler & ScrollBar

    -- {{{ Separator |
    local Separator = {
      -- require('nvim-web-devicons').get_icon()
      provider = function()
        -- return "|"
        return '❘'
        -- return "⎞⎛"
        -- ⎞⎡⎛
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} Separator |

    -- {{{ Separator |
    local StatusLineSeparator = {
      -- require('nvim-web-devicons').get_icon()
      provider = function()
        -- return "|"
        return '❘'
        -- return "⎞⎛"
        -- ⎞⎡⎛
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} Separator |

    -- {{{ Space
    local Space = {
      -- require('nvim-web-devicons').get_icon()
      provider = function()
        return ' '
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} Space

    -- {{{ Space
    local StatusLineSpace = {
      -- require('nvim-web-devicons').get_icon()
      provider = function()
        return ' '
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} Space

    -- {{{ Space
    local StatusSpace = {
      -- require('nvim-web-devicons').get_icon()
      provider = function()
        return ' '
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} Space

    -- {{{ Tabpage

    local Tabpage = {
      provider = function(self)
        ---------------------------------------------------------------------?

        local bufnr = bufs_in_tab(self.tabpage)
        -- local bufnr = get_active_buffer_in_tabpage(self.tabpage)
        -- -- local bufnr = get_active_buffer_in_tab(self.tabpage)
        local filestring = filepath_to_filename(vim.fn.bufname(get_first_key(bufnr)))
        -- local filestring = filepath_to_filename(vim.fn.bufname(bufnr))
        if filestring == nil then
          filestring = '[No Name]'
        end
        -- return '' .. '⎛' .. bufnr .. '⎞'
        return '' .. '⎛' .. filestring .. '⎞'

        -- return '' .. '⎛'  ..  self.tabpage .. filestring .. '⎞'
        -- return '' .. '⎛' .. self.tabnr  ..  filestring .. '⎞'
      end,
      hl = function(self)
        if not self.is_active then
          return 'TabLine'
        else
          return 'TabLineSel'
        end
      end,
      update = 'CursorMoved', -- TODO: change to something else?
    }

    local TabpageClose = {
      provider = '%999X  %X',
      hl = 'TabLine',
    }

    local TabPages = {
      -- only show this component if there's 2 or more tabpages
      condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
      end,
      -- { provider = "%=" },
      utils.make_tablist(Tabpage),
      TabpageClose,
    }

    -- }}} Tabpage

    -- {{{ Tabline offset
    -- local TabLineOffset = {
    --   condition = function(self)
    --     local win = vim.api.nvim_tabpage_list_wins(0)[1]
    --     local bufnr = vim.api.nvim_win_get_buf(win)
    --     self.winid = win

    --     if vim.bo[bufnr].filetype == "NvimTree" then
    --       self.title = "NvimTree"
    --       return true
    --       -- elseif vim.bo[bufnr].filetype == "TagBar" then
    --       --     ...
    --     end
    --   end,

    --   provider = function(self)
    --     local title = self.title
    --     local width = vim.api.nvim_win_get_width(self.winid)
    --     local pad = math.ceil((width - #title) / 2)
    --     return string.rep(" ", pad) .. title .. string.rep(" ", pad)
    --   end,

    --   hl = function(self)
    --     if vim.api.nvim_get_current_win() == self.winid then
    --       return "TablineSel"
    --     else
    --       return "Tabline"
    --     end
    --   end,
    -- }

    -- }}} Tabline offset

    -- {{{ Venv
    -- local actived_venv = function()
    --   local venv_name = require('venv-selector').get_active_venv()
    --   if venv_name ~= nil then
    --     if string.match(venv_name, 'conda') then
    --       return string.gsub(venv_name, '/home/jordan/.conda/envs/', '(conda) ')
    --     end
    --     if string.match(venv_name, 'poetry') then
    --       return string.gsub(venv_name, '.*/pypoetry/virtualenvs/', '(poetry) ')
    --     end
    --   else
    --     return 'venv'
    --   end
    -- end

    -- local venv = {
    --   {
    --     provider = function()
    --       return '  [' .. actived_venv() .. '] '
    --     end,
    --   },
    --   on_click = {
    --     callback = function()
    --       vim.cmd.VenvSelect()
    --     end,
    --     name = 'heirline_statusline_venv_selector',
    --   },
    -- }

    -- }}} Venv

    -- Vi Mode {{{
    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string and color. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
          n = 'N',
          no = 'N?',
          nov = 'N?',
          noV = 'N?',
          ['no\22'] = 'N?',
          niI = 'Ni',
          niR = 'Nr',
          niV = 'Nv',
          nt = 'Nt',
          v = 'V',
          vs = 'Vs',
          V = 'V_',
          Vs = 'Vs',
          ['\22'] = '^V',
          ['\22s'] = '^V',
          s = 'S',
          S = 'S_',
          ['\19'] = '^S',
          i = 'I',
          ic = 'Ic',
          ix = 'Ix',
          R = 'R',
          Rc = 'Rc',
          Rx = 'Rx',
          Rv = 'Rv',
          Rvc = 'Rv',
          Rvx = 'Rv',
          c = 'C',
          cv = 'Ex',
          r = '...',
          rm = 'M',
          ['r?'] = '?',
          ['!'] = '!',
          t = 'T',
        },
        mode_colors = {
          n = 'red',
          i = 'green',
          v = 'cyan',
          V = 'cyan',
          ['\22'] = 'cyan',
          c = 'orange',
          s = 'purple',
          S = 'purple',
          ['\19'] = 'purple',
          R = 'orange',
          r = 'orange',
          ['!'] = 'red',
          t = 'red',
        },
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function(self)
        return '%2(' .. self.mode_names[self.mode] .. '%)'
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- Also allows the statusline to be re-evaluated when entering operator-pending mode
      update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
          vim.cmd 'redrawstatus'
        end),
      },
    }

    -- Vi Mode }}}

    local Align = { provider = '%=' }

    local actionHints = {
      provider = require('lsp-progress').progress, -- require("action-hints").statusline()
    }

    --- }}} Components

    -- {{{ Buttons
    -- 󰒪󰟔
    -- 
    -- │󱫫󱫤󱫡󱫐󱫠󱫪󱫬󱧡󱕱󱕜󱎯󱊡󱊢󱊣󱊤󱊥󱊦󱇪󱅥󰳤󰳦󰦐󰟔󰃤󰄵
    -- ◍󰂒󰂓󰂛󰂜󰂞󰂠󰂟󰃛󰃞󰃟󰅏󰅎󱇪󱏵󱏴󱏶󱏷󱪼
    -- 󰴭
    -- 󰀦󰀨󰀩❘❘
    -- 
    -- 
    -- 󰔦󰕃󰔦󰡟󰺛󰴭
    -- 󰎦󰎧󰎩󰎪󰎬󰎭󰎮󰎪󰎰󰎱󰎳󰎵󰎶󰎸󰎹󰎻󰎼󰎾󰎡󰎣󰛦󰟟󰧑󰦌󰬯󰯻󰯺󰻕󰻖󱀇󱍢󱑷󱓞󱓟󱗃󱢴󱢊󱢋󱩡󱩲󱨚

    -- {{{ CPPButton 
    local CPPButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_cpp_scratchpad()
        end,
        name = 'CPPButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.bluePartyParrot, underline = true }
      end,
    }
    -- }}} CPPButton 

    -- {{{ CButton 
    local CButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_c_scratchpad()
        end,
        name = 'CButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.bluePartyParrot, underline = true }
      end,
    }
    -- }}} CButton 

    -- {{{ DebugButton 
    local DebugButton = { -- 󰃤
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          require('dapui').toggle()
        end,
        name = 'dapui',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        -- return ""
        return ''
      end,
      hl = function()
        return { fg = mycolors.appleIiLime, underline = true }
      end,
    }
    -- }}} DebugButton 󰃤

    -- {{{ FileTreeButton 
    local FileTreeButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'NvimTreeToggle'
        end,
        name = 'FileTreeButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.bluePartyParrot, underline = true }
      end,
    }
    -- }}} FileTreeButton 

    -- {{{ Fortran Button 󰯺
    local FortranButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_fortran_scratchpad()
        end,
        name = 'FortranButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return '󰯺'
        -- 󰯺
      end,
      hl = function()
        -- return { fg = colors.bluePartyParrot, bg = colors.button_bg, underline = false, bold = true }
        return { fg = '#aa00ff', underline = true, bold = true }
      end,
    }
    -- }}} FortranButton 󰯺

    -- {{{ GitButton 
    local GitButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.toggle_neogit()
          -- vim.cmd 'Neogit kind=vsplit'
        end,
        name = 'git',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
        -- 󰊢
      end,
      hl = function()
        return { fg = mycolors.phillipineOrange, underline = true }
      end,
    }
    -- }}} GitButton 󰊢

    -- {{{ GithubButton 
    local GithubButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'e ~/.config/nvim/README.md'
        end,
        name = 'settingsbutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- return ""
      end,
      hl = function()
        return { fg = mycolors.trackAndField, underline = true }
      end,
    }
    -- }}} GithubButton 

    -- {{{ GoButton 
    local GoButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_cpp_scratchpad()
        end,
        name = 'GoButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        -- return { fg = colors.bluePartyParrot, bg = colors.button_bg, underline = false, bold = true }
        return { fg = '#0100ff', underline = true, bold = true }
      end,
    }
    -- }}} CPPButton 

    -- {{{ HomeButton 
    local HomeButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_haskell_scratchpad()
        end,
        name = 'HomeButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.crashPink, underline = true }
      end,
    }
    -- }}} HomeButton 

    -- {{{ HaskellButton 
    local HaskellButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_haskell_scratchpad()
        end,
        name = 'HaskellButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.crashPink, underline = true }
      end,
    }
    -- }}} HaskellButton 

    -- {{{ JavaButton 
    local JavaButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_java_scratchpad()
        end,
        name = 'JavaButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.phillipineOrange, underline = true }
      end,
    }
    -- }}} JavaButton 

    -- {{{ JavascriptButton 
    local JavascriptButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_cpp_scratchpad()
        end,
        name = 'GoButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = '#bbbb33', underline = true }
      end,
    }
    -- }}} Javascript Button 

    -- {{{ LightDarkButton 

    local LightDarkButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'ToggleDarkMode'
        end,
        name = 'lightdarkbutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = colors.lightdark_fg, underline = true }
      end,
    }

    -- }}} LightDarkButton 

    -- {{{ LuaButton 
    local LuaButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'Neotest summary'
        end,
        name = 'TestsButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.bluePartyParrot, underline = true }
      end,
    }
    -- }}} LuaButton 

    -- {{{ NotificationButton 󰂞
    local NotificationButton = { -- 󰂞
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'NvimTreeToggle'
        end,
        name = 'notification',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return '󰂞'
      end,
      hl = function()
        return { fg = mycolors.lightSalmon, underline = true }
      end,
    }

    -- }}} NotificationButton 󰂞

    -- {{{ OCamlButton 
    local OCamlButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_haskell_scratchpad()
        end,
        name = 'OCamlButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- ''
      end,
      hl = function()
        return { fg = mycolors.phillipineOrange, underline = true }
      end,
    }
    -- }}} HaskellButton 

    -- {{{ PomodoroButtonOne 
    local PomodoroButtonOne = { -- 
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'PomodoroStart'
        end,
        name = 'pomodorobutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return '󱫠'
      end,
      hl = function()
        return { fg = mycolors.trackAndField, underline = true }
      end,
    }
    -- }}} PomodoroButtonOne 

    -- {{{ PomodoroButtonTwo 
    local PomodoroButtonTwo = { -- 
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'PomodoroStart'
        end,
        name = 'pomodorobutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function(_)
        return '' .. require('pomodoro').statusline():sub(4)
      end,
      hl = function()
        return { fg = mycolors.trackAndField }
      end,
    }
    -- }}} PomodoroButtonTwo 

    -- {{{ PythonButton 
    local PythonButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_python_scratchpad()
        end,
        name = 'PythonButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = '#bbbb33', underline = true }
      end,
    }
    -- }}} FileTreeButton 

    -- {{{ RButton 󰟔
    local RButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_r_scratchpad()
        end,
        name = 'RButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return '󰟔'
      end,
      hl = function()
        return { fg = mycolors.bluePartyParrot, underline = true }
      end,
    }
    -- }}} RButton 󰟔

    -- {{{ RustButton 
    local RustButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'Neotest summary'
        end,
        name = 'TestsButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.trackAndField, underline = true }
      end,
    }
    -- }}} RustButton 

    -- {{{ SettingsButton 
    local SettingsButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'e ~/.config/nvim/README.md'
        end,
        name = 'settingsbutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.trackAndField, underline = true }
      end,
    }
    -- }}} SettingsButton 

    -- {{{ ShellButton 
    local ShellButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_bash_scratchpad()
        end,
        name = 'BashButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = '#999999', underline = true }
      end,
    }
    -- }}} ShellButton 

    -- {{{ SidebarButton 
    local SidebarButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'AerialToggle'
        end,
        name = 'sidebarbutton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.donJuan }
      end,
    }
    -- }}} SidebarButton 

    -- {{{ TestsButton 
    local TestsButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          vim.cmd 'Neotest summary'
        end,
        name = 'TestsButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
      end,
      hl = function()
        return { fg = mycolors.munchOnMelon, underline = true }
      end,
    }
    -- }}} FileTreeButton 󰂓

    -- {{{ TodoButton 󰄸
    local TodoButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.toggle_todo()
        end,
        name = 'todo',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return '󰄸'
      end,
      hl = function()
        return { fg = mycolors.moussaka, underline = true }
      end,
    }
    -- }}} TodoButton 󰄸

    -- {{{ ZigButton 
    local ZigButton = {
      -- require('nvim-web-devicons').get_icon()
      on_click = {
        callback = function()
          ju.start_java_scratchpad()
        end,
        name = 'ZigButton',
      },
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
          require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function()
        return ''
        -- 
      end,
      hl = function()
        return { fg = mycolors.phillipineOrange, underline = true }
      end,
    }
    -- }}} ZigButton 

    -- }}} Buttons

    -- {{{ Statusline

    local DefaultStatusline = {
      { Diagnostics },
      { StatusSpace },
      { Git },
      { Ruler },
      { StatusSpace },
      { FileNameBlock },
      { Align },

      { LSPActive },
      -- { venv },

      { NotificationButton },
      { StatusLineSpace },
      -- { PomodoroButtonOne },
      -- { PomodoroButtonTwo },
      { StatusLineSeparator },

      { StatusLineSpace },
      { StatusLineSeparator },
      { LightDarkButton },

      { StatusLineSpace },
      { StatusLineSeparator },
      { SettingsButton },

      { StatusLineSpace },
      { StatusLineSeparator },
      { SidebarButton },

      { StatusLineSpace },
      { StatusLineSeparator },

      -- { Ruler},
      -- { Space },
      -- { ScrollBar },
      -- { Space },
      -- { ViMode },
      -- { LSPMessages },
    }

    local InactiveStatusline = {
      condition = conditions.is_not_active,
      FileType,
      Space,
      FileName,
      Align,
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches {
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = { '^git.*', 'fugitive' },
        }
      end,

      FileType,
      Space,
      HelpFileName,
      Align,
    }

    local TerminalName = {
      -- we could add a condition to check that buftype == 'terminal'
      -- or we could do that later (see #conditional-statuslines below)
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
        return ' ' .. tname
      end,
      hl = { fg = 'blue', bold = true },
    }

    local TerminalStatusline = {
      condition = function()
        return conditions.buffer_matches { buftype = { 'terminal' } }
      end,
      hl = { bg = 'dark_red' },
      -- Quickly add a condition to the ViMode to only show it when buffer is active!
      { condition = conditions.is_active, ViMode, Space },
      FileType,
      Space,
      TerminalName,
      Align,
    }

    -- }}} Statusline

    -- {{{ Build Lines
    local StatusLines = {
      hl = function()
        if conditions.is_active() then
          return 'StatusLine'
        else
          return 'StatusLineNC'
        end
      end,
      -- the first statusline with no condition, or which condition returns true is used.
      -- think of it as a switch case with breaks to stop fallthrough.
      fallthrough = false,
      SpecialStatusline,
      TerminalStatusline,
      InactiveStatusline,
      DefaultStatusline,
    }

    local TabLine = {
      { Separator },
      { HomeButton },
      { Space },
      { Separator },
      { FileTreeButton },
      { Space },
      { Separator },
      { GitButton },
      { Space },
      { Separator },
      { GithubButton },
      { Space },
      { Separator },
      { TestsButton },
      { Space },
      { Separator },
      { DebugButton },
      { Space },
      { Separator },
      { TodoButton },
      { Space },
      { Separator },
      { Align },
      { Separator },
      { TabPages },
      { Separator },
      { Align },
      -- { ViMode },

      { Space },
      { Separator },
      { ShellButton },

      { Space },
      { Separator },
      { CButton },

      { Space },
      { Separator },
      { CPPButton },

      { Space },
      { Separator },
      { GoButton },

      { Space },
      { Separator },
      { FortranButton },

      { Space },
      { Separator },
      { HaskellButton },

      { Space },
      { Separator },
      { JavaButton },

      { Space },
      { Separator },
      { JavascriptButton },

      { Space },
      { Separator },
      { LuaButton },

      { Space },
      { Separator },
      { OCamlButton },

      { Space },
      { Separator },
      { PythonButton },

      -- { Space },
      -- { Separator },
      -- { CButton },

      { Space },
      { Separator },
      { RButton },

      { Space },
      { Separator },
      { RustButton },

      { Space },
      { Separator },
      { ZigButton },

      { Space },
      { Separator },
    }

    -- local WinBar = { { require(lspsaga.symbol.winbar).get_bar() }, { {}, {} } }
    local WinBar = {
      { FileNameBlock },
      {},
      -- { require('lspsaga.symbol.winbar').get_bar() },
      { Align },
      { actionHints },
    }

    local WinBarNC = {
      {},
      {},
      -- { require('lspsaga.symbol.winbar').get_bar() },
      -- {Align},
      -- {actionHints},
    }

    local InactiveWinBar = {
      condition = conditions.is_not_active,
      {},
      {},
    }

    local WinBars = {
      -- hl = function()
      --   if conditions.is_active() then
      --     return 'WinBar'
      --   else
      --     return 'WinBarNC'
      --   end
      -- end,
      -- the first statusline with no condition, or which condition returns true is used.
      -- think of it as a switch case with breaks to stop fallthrough.
      fallthrough = false,
      -- SpecialStatusline,
      -- TerminalStatusline,
      InactiveWinBar,
      WinBar,
    }

    -- local WinBar = { {Navic}, { {}, {} } }
    -- local WinBar = { {}, { {}, {} } }
    -- local TabLine = { {TabPages }, {}, {} }
    -- local TabLine = { {BufferLine}, {}, {} }

    -- }}} Build Lines

    -- {{{ Setup Heirline

    require('heirline').setup {
      statusline = StatusLines,
      winbar = WinBars,
      tabline = TabLine,
      opts = {
        colors = colors,
      },
    }

    -- }}} Setup Heirline
  end,
},

-- }}} Heirline


		-- https://github.com/ribelo/taskwarrior.nvim
		{'ribelo/taskwarrior.nvim',
			opts = { },
			config = true
		},


		-- https://github.com/ntpeters/vim-better-whitespace.git
		{ 'ntpeters/vim-better-whitespace' },

		-- {{{ AsyncRun

		{"folke/flash.nvim",
			keys = {
				{'s', '<CMD>lua require("flash").jump()<CR>', desc = "Flash Jump"},
				{'S', '<CMD>lua require("flash").treesitter()<CR>', desc = "Flash lsp"}
			}
		},

		{'skywind3000/asyncrun.vim'},
		-- }}} AsyncRun

		-- -- {{{ fzf
    -- {'junegunn/fzf',
		-- 	lazy = false,
		-- 	build = function()
		-- 		vim.fn['fzf#install']() -- TODO: fixme
		-- 	end
    -- },
		--

		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
			-- or if using mini.icons/mini.nvim
			-- dependencies = { "echasnovski/mini.icons" },
			opts = {}
		},


		-- -- }}} fzf

		-- {{{ smart-splits
    {
			'mrjones2014/smart-splits.nvim',
			lazy = false,
			opts = {
				cursor_follows_swapped_bufs = true,
			},
			keys = {
				{ '<A-C-h>', '<CMD>lua require("smart-splits").swap_buf_left()<CR>', mode = {"i", "n", "t" }, desc = "Swap left" },
				{ '<A-C-j>', '<CMD>lua require("smart-splits").swap_buf_down()<CR>', mode = {"i", "n", "t" }, desc = "Swap down" },
				{ '<A-C-k>', '<CMD>lua require("smart-splits").swap_buf_up()<CR>', mode = {"i", "n", "t" }, desc = "Swap up" },
				{ '<A-C-l>', '<CMD>lua require("smart-splits").swap_buf_right()<CR>', mode = {"i", "n", "t" }, desc = "Swap right" },
			},
		},
		-- }}} smart-splits

		-- {{{ Project.nvim
    { 'ahmedkhalf/project.nvim',
			lazy = true,
		},
		-- }}} Project.nvim

		-- {{{ Copilot.vim
    { 'github/copilot.vim',
		  lazy = true,
		},
		-- }}} Copilot.vim

		-- {{{ friently-snippets
    { "rafamadriz/friendly-snippets" ,
			lazy = true,
		},
		-- }}} friently-snippets

		-- {{{ nvim-bqf
		{
			'kevinhwang91/nvim-bqf',
			lazy = true,
			config = function()
				local fn = vim.fn
				function _G.qftf(info)
					local items
					local ret = {}
					-- The name of item in list is based on the directory of quickfix window.
					-- Change the directory for quickfix window make the name of item shorter.
					-- It's a good opportunity to change current directory in quickfixtextfunc :)
					--
					-- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
					-- local root = getRootByAlterBufnr(alterBufnr)
					-- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
					--
					if info.quickfix == 1 then
						items = fn.getqflist({ id = info.id, items = 0 }).items
					else
						items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
					end
					local limit = 31
					local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
					local validFmt = '%s │%5d:%-3d│%s %s'
					for i = info.start_idx, info.end_idx do
						local e = items[i]
						local fname = ''
						local str
						if e.valid == 1 then
							if e.bufnr > 0 then
								fname = fn.bufname(e.bufnr)
								if fname == '' then
									fname = '[No Name]'
								else
									fname = fname:gsub('^' .. vim.env.HOME, '~')
								end
								-- char in fname may occur more than 1 width, ignore this issue in order to keep performance
								if #fname <= limit then
									fname = fnameFmt1:format(fname)
								else
									fname = fnameFmt2:format(fname:sub(1 - limit))
								end
							end
							local lnum = e.lnum > 99999 and -1 or e.lnum
							local col = e.col > 999 and -1 or e.col
							local qtype = e.type == '' and '' or
									' ' .. e.type:sub(1, 1):upper()
							str = validFmt:format(fname, lnum, col, qtype, e.text)
						else
							str = e.text
						end
						table.insert(ret, str)
					end
					return ret
				end

				vim.o.qftf = '{info -> v:lua._G.qftf(info)}'
				-- Adapt fzf's delimiter in nvim-bqf
				require('bqf').setup({
					filter = {
						fzf = {
							extra_opts = { '--bind', 'ctrl-o:toggle-all', '--delimiter', '│' }
						}
					}
				})
			end,
		},
		-- }}} nvim-bqf

    -- {{{ Highlight colors
		{
			'brenoprata10/nvim-highlight-colors',
			lazy = true,
			config = function()
				require('nvim-highlight-colors').setup {
					---Render style
					---@usage 'background'|'foreground'|'virtual'
					render = 'background',
					---Set virtual symbol (requires render to be set to 'virtual')
					virtual_symbol = '■',
					---Highlight named colors, e.g. 'green'
					enable_named_colors = true,
					---Highlight tailwind colors, e.g. 'bg-blue-500'
					enable_tailwind = false,
					---Set custom colors
					---Label must be properly escaped with '%' to adhere to `string.gmatch`
					--- :help string.gmatch
					custom_colors = {
						{ label = '%-%-theme%-primary%-color',   color = '#0f1219' },
						{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
					},
				}
			end,
		},
    -- }}} Highlight colors

    -- {{{ Luasnip
		{
			"L3MON4D3/LuaSnip",
			lazy = true,
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			config = function()

				local ls = require("luasnip")
				ls.snippets = {
					all = {
						ls.parser.parse_snippet("fn", "function ${1:name}(${2:args})\n\t$0\nend"),
					},
					lua = {
						ls.parser.parse_snippet("for", "for ${1:var}, ${2:value} in pairs(${3:table}) do\n\t$0\nend"),
					},
				}

				-- require("luasnip/loaders/from_vscode").lazy_load()
				-- will exclude all javascript snippets
				require("luasnip.loaders.from_vscode").load {
					exclude = { "javascript" },
				}
			end,
			keys = {
				{ '<Space>yy', '<CMD>Telescope luasnip<CR>', desc = 'Snippets' }
			},
		},
    -- }}} Luasnip

    -- {{{ Aerial
    { 'stevearc/aerial.nvim',
			lazy = false,
			keys = { {'<Space>aa', '<CMD>AerialToggle<CR>', desc = 'Aerial'}, },
			opts = {},
		},
    -- }}} Aerial

    -- {{{ blink.cmp

		{
			"saghen/blink.cmp",
			lazy = true,
			dependencies = {
				"rafamadriz/friendly-snippets",
				"moyiz/blink-emoji.nvim",
			},
			version = 'v0.9.3',
			opts = {
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = 'mono'
				},
				completion = {
					-- 'prefix' will fuzzy match on the text before the cursor
					-- 'full' will fuzzy match on the text before *and* after the cursor
					-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
					keyword = { range = 'full' },
					-- Disable auto brackets
					-- NOTE: some LSPs may add auto brackets themselves anyway
					accept = { auto_brackets = { enabled = false }, },
					-- Don't select by default, auto insert on selection
					-- list = { selection = { preselect = false, auto_insert = true } },
					-- or set either per mode via a function
					-- list = { selection = { preselect = function(ctx) return ctx.mode ~= 'cmdline' end } },
					menu = {
						-- Don't (Do) automatically show the completion menu
						auto_show = true,
						-- nvim-cmp style menu
						draw = {
							columns = {
								{ "label",     "label_description", gap = 1 },
								{ "kind_icon", "kind" }
							},
						}
					},
					-- Show documentation when selecting a completion item
					documentation = { auto_show = true, auto_show_delay_ms = 500 },
					-- Display a preview of the selected item on the current line
					ghost_text = { enabled = true },
				},
				sources = {
					default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' }, -- , 'emoji'
					providers = {
						-- emoji = {
						--   module = "blink-emoji",
						--   name = "Emoji",
						--   score_offset = 15,
						--   opts = { insert = true },
						-- },
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							-- make lazydev completions top priority (see `:h blink.cmp`)
							score_offset = 100,
						},
					},
				},
				-- Experimental signature help support
				signature = { enabled = true }
			},
			opts_extend = { "sources.default" },
			preset = {}
		},
    -- }}} blink.cmp

    -- {{{ Dashboard

		-- {
		-- 	'nvimdev/dashboard-nvim',
		-- 	event = 'VimEnter',
		-- 	config = function()
		-- 		require('dashboard').setup {}
		-- 	end,
		-- 	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
		-- },

    -- }}} Dashboard

    -- {{{ Emoji.nvim

		{
			"allaman/emoji.nvim",
			lazy = true,
			version = "1.0.0", -- optionally pin to a tag
			-- ft = "markdown", -- adjust to your needs
			dependencies = {
				-- util for handling paths
				"nvim-lua/plenary.nvim",
				-- optional for nvim-cmp integration
				"hrsh7th/nvim-cmp",
				-- optional for telescope integration
				"nvim-telescope/telescope.nvim",
				-- optional for fzf-lua integration via vim.ui.select
				"ibhagwan/fzf-lua",
			},
			opts = {
				-- default is false, also needed for blink.cmp integration!
				-- enable_cmp_integration = true,
				-- optional if your plugin installation directory
				-- is not vim.fn.stdpath("data") .. "/lazy/
				-- plugin_path = vim.fn.expand("$HOME/plugins/"),
			},
			config = function(_, opts)
				require("emoji").setup(opts)
				-- optional for telescope integration
				local ts = require('telescope').load_extension 'emoji'
				vim.keymap.set('n', '<leader>se', ts.emoji, { desc = '[S]earch [E]moji' })
			end,
		},
    -- }}} Emoji.nvim

    -- {{{ Git signs

    -- https://github.com/lewis6991/gitsigns.nvim
		{
			'lewis6991/gitsigns.nvim',
			lazy = true,
			config = function()
				require('gitsigns').setup {
					signs                        = {
						add          = { text = '┃' },
						change       = { text = '┃' },
						delete       = { text = '_' },
						topdelete    = { text = '‾' },
						changedelete = { text = '~' },
						untracked    = { text = '┆' },
					},
					signs_staged                 = {
						add          = { text = '┃' },
						change       = { text = '┃' },
						delete       = { text = '_' },
						topdelete    = { text = '‾' },
						changedelete = { text = '~' },
						untracked    = { text = '┆' },
					},
					signs_staged_enable          = true,
					signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
					numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
					linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
					word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
					watch_gitdir                 = {
						follow_files = true
					},
					auto_attach                  = true,
					attach_to_untracked          = false,
					current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
					current_line_blame_opts      = {
						virt_text = true,
						virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
						delay = 1000,
						ignore_whitespace = false,
						virt_text_priority = 100,
						use_focus = true,
					},
					current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
					sign_priority                = 6,
					update_debounce              = 100,
					status_formatter             = nil, -- Use default
					max_file_length              = 40000, -- Disable if file is longer than this (in lines)
					preview_config               = {
						-- Options passed to nvim_open_win
						border = 'single',
						style = 'minimal',
						relative = 'cursor',
						row = 0,
						col = 1
					},
				}
			end,
		},
    -- }}} Git signs

    -- {{{ Incline

		{
			'b0o/incline.nvim',
			lazy=true,
			config = function()
				local devicons = require 'nvim-web-devicons'
				require('incline').setup {
					render = function(props)
						local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
						if filename == '' then
							filename = '[No Name]'
						end
						local ft_icon, ft_color = devicons.get_icon_color(filename)
						local function get_git_diff()
							local icons = { removed = '', changed = '', added = '' }
							local signs = vim.b[props.buf].gitsigns_status_dict
							local labels = {}
							if signs == nil then
								return labels
							end
							for name, icon in pairs(icons) do
								if tonumber(signs[name]) and signs[name] > 0 then
									table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
								end
							end
							if #labels > 0 then
								table.insert(labels, { '┊ ' })
							end
							return labels
						end
						local function get_diagnostic_label()
							local icons = { error = '', warn = '', info = '', hint = '' }
							local label = {}
							for severity, icon in pairs(icons) do
								local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
								if n > 0 then
									table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
								end
							end
							if #label > 0 then
								table.insert(label, { '┊ ' })
							end
							return label
						end
						return {
							{ get_diagnostic_label() },
							{ get_git_diff() },
							{ (ft_icon or '') .. ' ', guifg = ft_color,                                            guibg = 'none' },
							{ filename .. ' ',        gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
							-- { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
						}
					end,
				}
			end,
			event = 'VeryLazy',
		},
    -- }}} Incline

    -- {{{ Lazydev

		{
      "folke/lazydev.nvim",
			lazy = true,
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },

    -- }}} Lazydev

    -- {{{ Mason / LspConfig
    { "williamboman/mason.nvim",
		  lazy = false,
      config = function()
        require'mason'.setup()
      end,
    },

		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
			dependencies = { "williamboman/mason.nvim", },
			config = function()
				local ensured_servers = {
					-- typescript_language_server = {}, -- TODO: find out actual name...
					jdtls = {
						filetyptes = { 'java' },
					},
					pyright = {},
					rust_analyzer = {},
					r_language_server = {
						cmd = { 'R', '--slave', '-e', "options(lintr = list(trailing_blank_lines_linter = NULL, snake_case_linter = NULL)); languageserver::run()" },
						filetypes = { 'R', 'r', 'rmd', 'Rmd' },
					},
					clangd = {},
					ts_ls = {},
					lua_ls = {
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
									library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
										"${3rd}/luv/library",
										"${3rd}/busted/library",
										-- vim.env.VIMRUNTIME,
										"/usr/share/nvim/runtime",
										"/usr/share/awesome/lib",
										"/usr/share/lua",
									}),
								},
								diagnostics = {
									globals = {
										"vim",
										"awesome",
										"awful",
										"client",
										"screen",
										"tag",
										"root",
									},
								},
								runtime = { version = 'LuaJIT' },
								completion = { callSnippet = "Replace", },
								telemetry = { enable = false, },
							},
						},
					},
				} -- ensured_servers
				local servers = {
					clangd = {
						cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
						filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
						single_file_support = true,
					},
					ts_ls = {},
					jdtls = {},
					tsserver = {},
					phpactor = {},
					typescript_language_server = {},
					-- pyright = {},
					r_language_server = {
						cmd = { 'R', '--slave', '-e', "options(lintr = list(trailing_blank_lines_linter = NULL, snake_case_linter = NULL)); languageserver::run()" },
						filetypes = { 'R', 'r', 'rmd', 'Rmd' },
					},
					lua_ls = {
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
									library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
										"${3rd}/luv/library",
										"${3rd}/busted/library",
										-- vim.env.VIMRUNTIME
										"/usr/share/nvim/runtime",
										"/usr/share/awesome/lib",
										"/usr/share/lua",
									}),
								},
								diagnostics = {
									globals = {
										"vim",
										"awesome",
										"awful",
										"client",
										"screen",
										"tag",
										"root",
									},
								},
								runtime = { version = 'LuaJIT' },
								completion = { callSnippet = "Replace", },
								telemetry = { enable = false, },
							},
						},
					},
				}
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				-- capabilities = require('cmp_nvim_lsp').default_capabilities()
				capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
				local mason_lspconfig = require 'mason-lspconfig'
				mason_lspconfig.setup {
					automatic_installation = false, -- TODO: double check this value
					ensure_installed = vim.tbl_keys(ensured_servers),
				}
				mason_lspconfig.setup_handlers {
					function(server_name)
						require('lspconfig')[server_name].setup {
							capabilities = capabilities,
							settings = servers[server_name],
						}
					end,
				}
			end,
		},
		{
			"neovim/nvim-lspconfig",
			lazy = false,
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
			command = { "Mason" }
		},
    -- }}} Mason / LspConfig

    -- {{{ NerdIcons

		{
			'glepnir/nerdicons.nvim',
			cmd = 'NerdIcons',
			config = function()
				require('nerdicons').setup({
					border = 'single', -- Border
					prompt = '󰨭 ', -- Prompt Icon
					preview_prompt = ' ', -- Preview Prompt Icon
					width = 0.5, -- float window width
					down = '<C-n>', -- Move down in preview
					up = '<C-p>', -- Move up in preview
					copy = '<C-y>', -- Copy to the clipboard
					register = '+', -- Register to copy to
				})
			end
		},
    -- }}} NerdIcons

    -- {{{ Neotree

		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
			},
			lazy = true,
			keys = {
				-- { '<Space>ff', '<CMD>Neotree toggle<CR>', desc = 'File Tree' },
			},
		},
    -- }}} Neotree

    -- {{{ Lspsaga

		{
			'nvim-treesitter/nvim-treesitter',
			lazy=false,
			-- Use 'master' while monitoring updates in 'main'
			checkout = 'master',
			monitor = 'main',
			hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
			build = function()
				vim.cmd('TSUpdate')
			end,
			config = function()
				require 'nvim-treesitter.configs'.setup {
					ensure_installed = {
						"c",
						"lua",
						"markdown",
						"markdown_inline",
						"query",
						"vim",
						"vimdoc"
					},
					sync_install = false,
					auto_install = true,
					ignore_install = { "javascript" },
					highlight = {
						enable = true,
						disable = function(_, buf)
							local max_filesize = 100 * 1024 -- 100 KB
							local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
							if ok and stats and stats.size > max_filesize then
								return true
							end
						end,
						additional_vim_regex_highlighting = false,
					},
				}
			end,
		},

		{
			'nvimdev/lspsaga.nvim',
			lazy = true,
			dependencies = {
				'nvim-treesitter/nvim-treesitter',     -- optional
				'nvim-tree/nvim-web-devicons',         -- optional
			},
			keys = {
				{ '<Space>ca', '<CMD>Lspsaga code_action<CR>',          desc = "Code Action" },
				{ 'gk',        '<CMD>Lspsaga hover_docs<CR>',           desc = "Code Action" },
				{ '<Space>en', '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = "Next" },
				{ '<Space>ep', '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = "Previous" },
			},
			config = function()
				require('lspsaga').setup {
					ui = {
						border = 'single',
						devicon = true,
						title = true,
						expand = '⊞',
						collapse = '⊟',
						code_action = 'a',
						actionfix = ' ',
						lines = { '┗', '┣', '┃', '━', '┏' },
						kind = nil,
						imp_sign = '󰳛 ',
					},
					hover = {
						max_width = 0.9,
						max_height = 0.8,
						min_height = 0.5,
						min_width = 0.5,
						height = 0.5,
						width = 0.5,
						open_link = 'gx',
						open_cmd = '!chrome',
					},
					diagnostic = {
						show_code_action = false,
						show_layout = 'float',
						show_normal_height = 10,
						jump_num_shortcut = true,
						max_width = 0.8,
						max_height = 0.6,
						max_show_width = 0.9,
						max_show_height = 0.6,
						text_hl_follow = true,
						border_follow = true,
						extend_relatedInformation = false,
						diagnostic_only_current = false,
						keys = {
							exec_action = 'o',
							quit = 'q',
							toggle_or_jump = '<CR>',
							quit_in_show = { 'q', '<ESC>' },
						},
					},
					code_action = {
						num_shortcut = true,
						show_server_name = false,
						extend_gitsigns = false,
						only_in_cursor = true,
						max_height = 0.3,
						keys = {
							quit = 'q',
							exec = '<CR>',
						},
					},
					lightbulb = {
						enable = false,
						sign = true,
						debounce = 10,
						sign_priority = 40,
						virtual_text = false,
						enable_in_insert = true,
					},
					scroll_preview = {
						scroll_down = '<C-f>',
						scroll_up = '<C-b>',
					},
					request_timeout = 2000,
					finder = {
						max_height = 0.5,
						left_width = 0.3,
						right_width = 0.5,
						methods = {},
						default = 'ref+imp',
						layout = 'float',
						silent = false,
						filter = {},
						sp_inexist = false,
						keys = {
							shuttle = '[w',
							toggle_or_open = 'o',
							vsplit = 's',
							split = 'i',
							tabe = 't',
							tabnew = 'r',
							quit = 'q',
							close = '<C-c>k',
						},
					},
					definition = {
						width = 0.9,
						height = 0.5,
						keys = {
							edit = '<C-c>o',
							vsplit = '<C-c>v',
							split = '<C-c>i',
							tabe = '<C-c>t',
							quit = 'q',
							close = '<C-c>k',
						},
					},
					rename = {
						in_select = true,
						auto_save = false,
						project_max_width = 0.5,
						project_max_height = 0.5,
						keys = {
							quit = '<C-k>',
							exec = '<CR>',
							select = 'x',
						},
					},
					symbol_in_winbar = {
						enable = false,
						separator = ' › ',
						hide_keyword = false,
						show_file = true,
						folder_level = 1,
						color_mode = true,
						dely = 300,
					},
					outline = {
						win_position = 'right',
						win_width = 30,
						auto_preview = true,
						detail = true,
						auto_close = true,
						close_after_jump = false,
						layout = 'normal',
						max_height = 0.5,
						left_width = 0.3,
						keys = {
							toggle_or_jump = 'o',
							quit = 'q',
							jump = 'e',
						},
					},
					callhierarchy = {
						layout = 'float',
						left_width = 0.2,
						keys = {
							edit = 'e',
							vsplit = 's',
							split = 'i',
							tabe = 't',
							close = '<C-c>k',
							quit = 'q',
							shuttle = '[w',
							toggle_or_req = 'u',
						},
					},
					implement = {
						enable = false,
						sign = true,
						lang = {},
						virtual_text = true,
						priority = 100,
					},
					beacon = {
						enable = true,
						frequency = 7,
					},
				}
			end,
		},
    -- }}} Lspsaga

    -- {{{ Neogit

		{
			"NeogitOrg/neogit",
			event=VeryLazy,
			dependencies = {
				"nvim-lua/plenary.nvim",         -- required
				"sindrets/diffview.nvim",        -- optional - Diff integration
				-- Only one of these is needed.
				"nvim-telescope/telescope.nvim", -- optional
				-- "ibhagwan/fzf-lua",              -- optional
				-- "echasnovski/mini.pick",         -- optional
			},
			config = function()
        local neogit = require('neogit')
        neogit.setup {}
        mymap('n', '<Space>gg', '<CMD>Neogit kind=floating<CR>')
      end,

    },
    -- }}} Neogit

    -- {{{ Telescope

		{
			'nvim-telescope/telescope.nvim',
			lazy = false,
			dependencies = {
				'nvim-tree/nvim-web-devicons',
				'nvim-lua/plenary.nvim',
				'fhill2/telescope-ultisnips.nvim',
				{
					"benfowler/telescope-luasnip.nvim",
					dependencies = {
						"rafamadriz/friendly-snippets"
					},
					module = "telescope._extensions.luasnip",
				},
				{
					'sopa0/telescope-makefile',
					dependencies = {
						{ 'akinsho/toggleterm.nvim', version = "*", config = true },
					},
					keys = {
						{ '<Space><Space>', '<CMD>Telescope make<CR>', desc = 'Makefile targets' },
					}
				},
				'nvim-telescope/telescope-project.nvim',
				'nvim-telescope/telescope-symbols.nvim',
			},
			config = function()
				-- local utilities = require 'utilities'
				local actions = require 'telescope.actions'
				-- local finders = require 'telescope.finders'
				-- local pickers = require 'telescope.pickers'
				local actions_state = require 'telescope.actions.state'

				---@diagnostic disable-next-line: unused-function
				local function file_exists(filename)
					local file = io.open(filename, 'r')
					if file then
						io.close(file)
						return true
					else
						return false
					end
				end

				---@diagnostic disable-next-line: unused-local, unused-function
				local function on_project_selected(prompt_bufnr)
					local entry = actions_state.get_selected_entry()
					print("Hello from project selected")
					actions.close(prompt_bufnr)
          if file_exists('' .. entry['value'] .. '/README.org') then
            vim.cmd('edit ' .. entry['value'] .. '/README.org')
          else
            vim.cmd('edit ' .. entry['value'] .. '/README.md')
          end
          -- Toggle the NvimTree buffer
          vim.cmd 'split'
          vim.cmd 'terminal'
          vim.cmd 'Neotree toggle'
          -- vim.cmd 'SidebarNvimToggle'
          vim.cmd 'wincmd l'
					vim.cmd('cd ' .. entry["value"])
        end

        require('telescope').setup {
          defaults = {
            mappings = {
              i = { ['<C-d>'] = require('telescope.actions').delete_buffer },
              n = { ['<C-d>'] = require('telescope.actions').delete_buffer },
            },
          },
          prompt_prefix = ' ',
          selection_caret = '* ',
          path_display = { 'smart' },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore',
            '--hidden',
          },
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = 'smart_case',
            },
            project = {
              hidden_files = true, -- default: false
              theme = 'dropdown',
              order_by = 'asc',
              search_by = 'title',
              sync_with_nvim_tree = true, -- default false
              -- default for on_project_selected = find project files
              -- on_project_selected = function(prompt_bufnr)
              --   on_project_selected(prompt_bufnr)
              -- end,
            },
          },
        }
        require'telescope'.load_extension('make')
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ultisnips')
        pcall(require('telescope').load_extension, 'project')
        pcall(require('telescope').load_extension, 'luasnip')
      end,
      keys = {
        {'<Space>bb', '<CMD>Telescope buffers<CR>', desc = 'Help Tags'},
        {'<Space>hh', '<CMD>Telescope help_tags<CR>', desc = 'Help Tags'},
        {'<A-x>', '<CMD>Telescope commands<CR>', desc = 'Commands'},
        {'/', '<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>', desc = 'Buffer Search'},
        {'<Space>pf', '<CMD>Telescope find_files<CR>', desc = 'Files'},
        {'<Space>pr', '<CMD>Telescope live_grep<CR>', desc = 'Search'},
        {'<Space>po', '<CMD>Telescope project<CR>', desc = 'Open'},
      },
    },

    -- }}} Telescope

    -- {{{ Trouble

		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			keys = {
				{ '<Space>ee', '<CMD>Trouble diagnostics toggle focus=false filter.buf=0<CR>', desc = "Diagnostics (trouble)" },
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		},

    -- }}} Trouble

    -- -- {{{ Ultisnips
    -- { 'SirVer/ultisnips',
    --   keys = {
    --     {'<Space>yy', '<CMD>Telescope ultisnips<CR>', desc = 'Snippets'}
    --   },
    -- },
    -- -- }}} Ultisnips

    -- {{{ nvim-slime

		{
			"jpalardy/vim-slime",
			lazy = false,
			config = function()
				vim.g.slime_target = "neovim"
			end,
			keys = {
				{ '<A-Return>', '<CMD>SlimeSend<CR>', desc = 'Send to REPL', mode = {"v", "n"} }
			},
		},

    -- }}} nvim-slime

    -- {{{ Which-key

		{
			"folke/which-key.nvim",
			lazy = false,
			config = function()
				local wk = require("which-key")
				wk.add({
					{ "<Space>b",  group = "Buffer" },
					{ "<Space>c",  group = "Code" },
					{ "<Space>d",  group = "Debug" },
					{ "<Space>e",  group = "Errors" },
					{ "<leader>f", group = "File" },
					{ "<Space>g",  group = "Git" },
					{ "<Space>m",  group = "Make" },
					{ "<Space>l",  group = "Lsp" },
					{ "<Space>o",  group = "Open" },
					{ "<Space>p",  group = "Project" },
					{ "<Space>q",  group = "Quit" },
					{ "<Space>r",  group = "Reload" },
					{ "<Space>t",  group = "Telescope" },
					{ "<Space>w",  group = "Window" },
					{ "<Space>h",  group = "Help" },
					{ "<Space>y",  group = "Snippets" },
					{ "<Space>z",  group = "Zen" },
					{ "<Space><Return>",  group = "Make" },
				})
			end,
		},
    -- }}} Which-key

		-- {{{ Compiler.nvim

		{ -- This plugin
			"Zeioth/compiler.nvim",
			cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
			dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
			opts = {},
			lazy = true,
			keys = {
				{ '<Space>c<Return>', '<CMD>CompilerOpen<CR>', desc = 'Compile' },
				{ '<Space>cr', '<CMD>CompilerToggleResults<CR>', desc = 'Results' },
				{ '<Space>cx', '<CMD>CompilerRedo<CR>', desc = 'Redo' },
				{ '<Space>cd', '<CMD>CompilerStop<CR>', desc = 'Redo' },
			},
		},
		{ -- The task runner we use
			"stevearc/overseer.nvim",
			commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
			cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
			opts = {
				task_list = {
					direction = "bottom",
					min_height = 25,
					max_height = 25,
					default_detail = 1
				},
			},
		},

		-- }}} Compiler.nvim

		-- {{{ GP
		{
			"robitx/gp.nvim",
			lazy = false,
			config = function()
				local conf = { }
				require("gp").setup(conf)
			end,
			keys = {
				{'<Space>L', '<CMD>GpChatToggle<CR>', desc = 'LLM'},
			}
			-- commands = { }
		},
		-- }}} GP

		-- {{{ NvimTree
		{
			'kyazdani42/nvim-tree.lua',
			dependencies = {
				{
					'b0o/nvim-tree-preview.lua',
					dependencies = {
						'nvim-lua/plenary.nvim',
						'3rd/image.nvim', -- Optional, for previewing images
					},
				},
			},
			keys = {
				{ '<Space>ff', '<CMD>NvimTreeToggle<CR>', desc = 'File Tree' },
			},
			config = function()
				require('nvim-tree').setup {
					on_attach = function(bufnr)
						local api = require('nvim-tree.api')
						-- Important: When you supply an `on_attach` function, nvim-tree won't
						-- automatically set up the default keymaps. To set up the default keymaps,
						-- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
						api.config.mappings.default_on_attach(bufnr)
						local function opts(desc)
							return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
						end
						local preview = require('nvim-tree-preview')
						vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
						vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
						vim.keymap.set('n', '<C-f>', function() return preview.scroll(4) end, opts 'Scroll Down')
						vim.keymap.set('n', '<C-b>', function() return preview.scroll(-4) end, opts 'Scroll Up')
						-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
						vim.keymap.set('n', '<Tab>', function()
							local ok, node = pcall(api.tree.get_node_under_cursor)
							if ok and node then
								if node.type == 'directory' then
									api.node.open.edit()
								else
									preview.node(node, { toggle_focus = true })
								end
							end
						end, opts 'Preview')
						-- Option B: Simple tab behavior: Always preview
						-- vim.keymap.set('n', '<Tab>', preview.node_under_cursor, opts 'Preview')
					end,
				}
			end
		},
		-- }}} NvimTree

	},

  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },

})

-- }}} Plugins

-- {{{ Style

-- }}} Style

-- {{{ Filetype configs


-- {{{ C

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.c",
	callback = function()
		mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
	end
})

-- }}} C

-- {{{ lisp

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.lisp",
	callback = function()
		mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
	end
})

-- }}} lisp

-- {{{ Lua

-- Lua ftconfig:
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.lua",
	callback = function()
		mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
		mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
		mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
		-- print("Hello lua filetype")
	end
})

-- }}} Python

-- {{{ Python

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function()
		-- print("Hello python filetype")
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
	end
})

-- }}} Python

-- {{{ Javascript

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.js",
	callback = function()
		-- print("Hello javascript filetype")
	end
})

-- }}} Javascript

-- {{{ Go

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.go",
	callback = function()
		mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
	end
})

-- }}} Javascript


-- {{{ Go

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {"*.r", "*.R"},
	callback = function()
		mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
		mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
		mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
	end
})

-- }}} Javascript



-- }}} Filetype configs

---@diagnostic disable-next-line: unused-local
local playround = require'playground'

