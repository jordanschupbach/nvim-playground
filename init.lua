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
vim.g.gui_font_face = 'UbuntuMono Nerd Font Mono - Bold'
vim.g.gui_font_size = 12
vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_width = 2
vim.g.python_host_program = '/usr/bin/python'

-- Opts
vim.opt.backspace = { 'eol', 'start', 'indent' }
vim.opt.backup = false
vim.opt.belloff = 'all'
vim.opt.breakindent = true
vim.opt.cmdheight = 2
vim.opt.colorcolumn = '120'
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
-- vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
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
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.spelllang = 'en_us'
vim.opt.splitbelow = true
-- vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wildignore = { '*.o', '*~', '*.pyc', '*pycache*' }
vim.opt.wrap = false

-- Misc options
vim.wildmode = { 'full', 'longest', 'lastused' }
vim.wildoptions = 'pum'
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.g['gtest#gtest_command'] = './build/tests/tests'
vim.g['test#cpp#runner'] = 'ctest'
vim.g['test#cpp#catch2#bin_dir'] = '../build/tests/'


-- vim.o.fillchars = '!'
-- vim.opt.fillchars = { eob = '' }  -- No character for end of buffer

-- vim.o.fillchars = "~"  -- Set end of buffer character to a space
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

		-- {{{ My Dashboard
		-- -- My dashboard
		--  { dir = '/home/jordan/.config/nvim-playground/plugins/mep-dash.nvim/',
		--  event = 'VimEnter',
		-- opts = {
		-- 	{a = "asdf",
		-- 	 b = {"c", 2}}
		--  },
		-- },
		-- }}} My Dashboard

		-- {{{ My menu
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
		-- }}} My menu

		-- {{{ Git blame
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
		-- }}} Git blame

--- NOTE: seems kinda obnoxious
		-- -- {{{ Lsp Progress
		-- {
		-- 	'linrongbin16/lsp-progress.nvim',
		-- 	opts = {},
		-- },
		-- -- }}} Lsp Progress

		-- {{{ Orgmode
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
		-- }}} Orgmode

-- NOTE: Ideally unused?
		-- {{{ Taskwarrior
		-- https://github.com/ribelo/taskwarrior.nvim
		{'ribelo/taskwarrior.nvim',
			opts = { },
			config = true
		},
		-- }}} Taskwarrior

		-- {{{ Better-whitespace
		{ 'ntpeters/vim-better-whitespace' },
		-- }}} Better-whitespace

		-- {{{ Flash.nvim
		{"folke/flash.nvim",
			keys = {
				{'s', '<CMD>lua require("flash").jump()<CR>', desc = "Flash Jump"},
				{'S', '<CMD>lua require("flash").treesitter()<CR>', desc = "Flash lsp"}
			}
		},
		-- }}} Flash.nvim

		-- {{{ AsyncRun
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

