-- # Simple neovim playground

-- {{{ Initial Options

vim.opt.foldmethod = 'marker'

-- }}} Initial Options

-- {{{ Plugin Free Key mappings

local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end

---@diagnostic disable-next-line: unused-function, unused-local
local function toggle_quickfix()
  if vim.fn.empty(vim.fn.getqflist()) == 1 then
    print("Quickfix list is empty!")
    return
  end
  local quickfix_open = false
  local windows = vim.api.nvim_list_wins()
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

-- vim.api.nvim_create_user_command('CToggle', toggle_quickfix, {})

mymap('n', '<Space>cc', '<CMD>CodeCompanionActions<CR>')
-- mymap('n', '<Space>cc', '<CMD>CToggle<CR>')
mymap('n', '<Space>co', '<CMD>CToggle<CR>')
-- mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
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
-- mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
-- mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
-- These only work in gvim.... :(
mymap('n', '<C-tab>', '<CMD>tabnext<CR>')
mymap('n', '<C-S-tab>', '<CMD>tabprevious<CR>')

-- }}} Base Key mappings

mymap('n', 'g:', '<CMD>term<CR>')
mymap('n', '<C-A-return>', '<CMD>echo "TODO"<CR>')

-- {{{ General Options

-- {{{ Statusline active/not_active behavior
vim.cmd('highlight StatusLine guifg=#FF33FF guibg=#00FFFFBB')     -- Active buffer colors
-- vim.cmd('highlight StatusLineNC guifg=#888888 guibg=#DFDFF1')     --  guibg=#000000'Inactive buffer colors
vim.cmd('highlight StatusLineNC guifg=#888888 guibg=#000000')     --  guibg=#000000'Inactive buffer colors
vim.cmd('highlight StatusLineActive guifg=#FF33FF guibg=#003366') -- Different color for active buffer

-- Set highlight for window separators
vim.cmd('highlight WinSeparatorActive guifg=#FF33FF') -- Color for active window separator
vim.cmd('highlight WinSeparatorNC guifg=#444444')     -- Color for inactive window separators

-- Function to update all status lines and separators
function UpdateAll()
  local current_win = vim.api.nvim_get_current_win()
  -- Update status line colors
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    -- local width = vim.fn.winwidth(win)
    -- local status_line = string.rep("─", width)
    -- Update the status line based on window focus
    if win == current_win then
      -- vim.api.nvim_set_option_value('statusline', '%#StatusLineActive#' .. status_line, { win = win })
      vim.api.nvim_set_option_value('winhighlight', 'WinSeparator:WinSeparatorActive', { win = win })
    else
      -- vim.api.nvim_set_option_value('statusline', '%#StatusLineNC#' .. status_line, { win = win })
      vim.api.nvim_set_option_value('winhighlight', 'WinSeparator:WinSeparatorNC', { win = win })
    end
  end
end

-- Autocommand to refresh status lines and separators on resize
vim.api.nvim_create_autocmd("VimResized", { callback = UpdateAll })
-- Autocommand to update status lines and separators on window focus changes
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, { callback = UpdateAll })
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, { callback = UpdateAll })

-- Initial setup to set status lines and separators for all windows
UpdateAll()

vim.cmd('highlight EndOfBuffer guifg=#881188') -- Customize color as needed

-- }}} Statusline active/not_active behavior

vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.g.slime_target = 'neovim'

vim.g.mapleader = " "
vim.g.maplocalleader = ";"

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
vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz =
  '╋',
}
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
vim.opt.number = false
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
vim.wo.number = false
vim.wo.signcolumn = 'yes'
vim.g['gtest#gtest_command'] = './build/tests/tests'
vim.g['test#cpp#runner'] = 'ctest'
vim.g['test#cpp#catch2#bin_dir'] = '../build/tests/'

-- }}} General Options

-- {{{ Utility functions


---@diagnostic disable-next-line: lowercase-global
function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

---@diagnostic disable-next-line: lowercase-global
read_file = function(path)
  local file = io.open(path, "r") -- Open the file in read mode
  if not file then
    return nil, "Could not open file: " .. path
  end
  local content = file:read("*a") -- Read the entire file content
  return content
end

---@diagnostic disable-next-line: lowercase-global
function extract_time_points(input)
  local start_time, end_time = input:match("CLOCK:%s*%[([^%]]+)%]%s*%-%-%s*%[([^%]]+)%]")
  if not end_time then
    start_time, end_time = input:match("CLOCK:%s*%[([^%]]+)%]")
  end
  return start_time, end_time
end

---@diagnostic disable-next-line: lowercase-global
function parse_timers(content)
  local content_tbl = {}
  for line in string.gmatch(content, "[^\n]+") do
    table.insert(content_tbl, line)
  end
  local found_open_timer = false
  local task_text = ""
  local time_diff_str = ""
  for linum, line in ipairs(content_tbl) do
    local tp1, tp2 = extract_time_points(line)
    if tp1 and not tp2 then
      found_open_timer = true
      task_text = content_tbl[linum - 2]
      local start_time_epoch = os.time({
        year = tp1:sub(1, 4),
        month = tp1:sub(6, 7),
        day = tp1:sub(9, 10),
        hour = tonumber(tp1:sub(16, 17)),
        min = tonumber(tp1:sub(19, 21))
      })
      local current_time = os.time()
      local time_diff = current_time - start_time_epoch
      if time_diff < 60 then
        time_diff_str = time_diff .. "s"
      else
        time_diff_str = math.floor(time_diff / 60) .. "min"
      end
      return found_open_timer, task_text, time_diff_str
    end
  end
  return found_open_timer, task_text, time_diff_str
end

---@diagnostic disable-next-line: lowercase-global
function locate_org_files(directories)
  local ret = {}
  local files = {}
  for _, dir in ipairs(directories) do
    files = vim.fn.globpath(dir, '*.org', false, true)
    if #files > 0 then
      for _, file in ipairs(files) do
        table.insert(ret, file)
      end
    end
  end
  return ret
end

---@diagnostic disable-next-line: lowercase-global
get_running_timer_text = function(folders)
  local org_files = locate_org_files(folders)
  for _, file in ipairs(org_files) do
    local content = read_file(file)
    if content then
      local found_timer, task_text, time_diff = parse_timers(content)
      if found_timer then
        return "Current Task: " .. task_text:sub(8, #task_text) .. " (" .. time_diff .. ")"
      end
    end
  end
  return "No current task"
end


-- }}} Utility functions

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
  energos = '#cded49',          -- #cded49 Pantone 380C
  jazzercise = '#bde225',       --#bde225 Pantone 2290C
  indiaGreen = '#1c890a',       -- Pantone 2424C
  appleIiLime = '#28d10c',      -- Pantone

  -- Greys
  pigIron = '#484747',

  -- Blacks
  midnightBlack = '#000000', -- Pantone Black 3c
  underworld = '#1f211c',    -- Pantone Black 3c
  velvetBlack = '#1d1818',   -- Pantone Neutral Black C

  -- Yellows
  sizzlingSunrise = '#fedb00', -- Pantone 108C

  -- Blues
  pastelFirstSnow = '#e2ebf7', -- #e2ebf7 Pantone 2707C
  vibrantMint = '#02fce3',
  bluePartyParrot = '#7b7eff', -- Pantone 292C
  palatinateBlue = '#3845df',  -- Pantone 2727C

  -- Oranges
  lightSalmon = '#ffa47b', -- #ffa47b Pantone 7410C
  phillipineOrange = '#ff7300',

  -- Browns
  moussaka = '#6f3014',          -- Pantone 732C
  donJuan = '#594e4e',           -- Pantone 411C
  matterhorn = '#574e4e',        -- Pantone 411C
  chinotto = '#564949',          -- Pantone 438C
  rhodoniteBrown = '#4c4141',    -- Pantone 438C
  smokedBlackCoffee = '#3e3333', -- Pantone 439C
  chocolatePlum = '#3c2e2e',     -- #3c2e2e Pantone 440C

  -- Pinks
  munchOnMelon = '#f23f72',    -- Pantone 191C
  crumblyLipstick = '#ef6abf', -- Pantone 224C

  -- Purples
  plasmaTrail = '#cd95fa',          -- Pantone 2717 C
  crashPink = '#cd88fd',            -- #cd88fd Pantone 2717C
  piscesVividAmethyst = '#a753ec',  -- Pantone 265C
  veronica = '#9715ff',             -- Pantone 2592C
  eineKleineNachtmusik = '#4f1f91', -- Pantone 267C
  middleRedPurple = '#230839',      -- Pantone 2627 C
}
-- }}} mycolors

-- {{{ Plugins

--ultisnips ultisnips source =  Neovim plugins (managed by lazy)

---@diagnostic disable: missing-fields
require("lazy").setup({
  spec = {


    -- {{{ CodeCompanion
    {
      "olimorris/codecompanion.nvim",
      config = true,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
    -- }}} CodeCompanion

    -- {{{ Noice
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        command_palette = true,
        lsp = {
          progress = {
            enabled = false,
            -- add any options here
          },
        },
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          enabled = false,             -- enables the Noice messages UI
          view = "notify",             -- default view for messages
          view_error = "notify",       -- view for errors
          view_warn = "notify",        -- view for warnings
          view_history = "messages",   -- view for :messages
          view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        -- :Noice errors
        errors = {
          -- options for the message history that you get with `:Noice`
          view = "popup",
          opts = { enter = true, format = "details" },
          filter = { error = true },
          filter_opts = { reverse = true },
        },
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      }
    },
    -- }}} Noice
    -- {{{ Luadev
    {
      'bfredl/nvim-luadev',
      config = function()
        vim.api.nvim_set_keymap('n', '<Leader>r', '<Plug>(Luadev-Run)', { noremap = false, silent = true })      -- Execute Lua code
        vim.api.nvim_set_keymap('n', '<Leader>rl', '<Plug>(Luadev-RunLine)', { noremap = false, silent = true }) -- Execute current line
        vim.api.nvim_set_keymap('n', '<Leader>rw', '<Plug>(Luadev-RunWord)', { noremap = false, silent = true }) -- Evaluate word
        vim.api.nvim_set_keymap('i', '<C-Space>', '<Plug>(Luadev-Complete)', { noremap = false, silent = true }) -- Complete Lua fields
      end
    },
    -- }}} Luadev

    -- {{{ todo comments

    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
      keys = {
        { "<Space>tt", "<CMD>TodoTelescope<CR>", desc = "Todos" },
      }
    },
    -- }}} todo comments

    -- {{{ heirline

    {
      "rebelot/heirline.nvim",
      -- You can optionally lazy-load heirline on UiEnter
      -- to make sure all required plugins and colorschemes are loaded before setup
      -- event = "UiEnter",
      config = function()
        local conditions = require 'heirline.conditions'
        local utils = require 'heirline.utils'

        local Align = { provider = '%=' }

        -- {{{ Utility functions
        local function filepath_to_filename(filepath)
          if filepath == nil then
            return nil
          end
          local separator = package.config:sub(1, 1) -- Get the platform-specific directory separator
          local parts = {}
          for part in string.gmatch(filepath, '[^' .. separator .. ']+') do
            table.insert(parts, part)
          end
          return parts[#parts] -- Return the last part (the filename)
        end

        local function bufs_in_tab(tabpage)
          tabpage = tabpage or 0
          local buf_set = {}
          local success, wins = pcall(vim.api.nvim_tabpage_list_wins, tabpage)
          if success then
            for _, winid in ipairs(wins) do
              local bufnr = vim.api.nvim_win_get_buf(winid)
              buf_set[bufnr] = true
            end
            return buf_set
          else
            return { 1 }
          end
        end

        local function get_first_key(table)
          for key, _ in pairs(table) do
            return key
          end
        end

        -- }}} Utility functions

        -- {{{ Task


        ---@diagnostic disable-next-line: unused-local
        local Task = {
          init = function()
            -- do nothing
          end,
          provider = function()
            local timer_text = get_running_timer_text({
              -- '~/orgfiles/**',
              -- '~/orgfiles/**/*',
              -- '~/dev/CHARM-3.0/**',
              -- '~/dev/charm/',
              '~/dev/templates/**/*',
              '~/.config/nvim-playground/**',
              -- '~/papers/tmc/**'
            })
            -- local timer_text = "Current Task: "
            return timer_text
          end,
          update = 'CursorMoved',
        }

        --}}} Task


        -- {{{ PlayButton
        local PlayButton = {
          -- require('nvim-web-devicons').get_icon()
          on_click = {
            callback = function()
              vim.cmd("CompilerOpen")
            end,
            name = 'PlayButton',
          },
          init = function(self)
            local filename = self.filename
            local extension = vim.fn.fnamemodify(filename, ':e')
            self.icon, self.icon_color =
                require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
          end,
          provider = function()
            return ''
          end,
          hl = function()
            return { fg = mycolors.appleIiLime, underline = true }
          end,
        }
        -- }}} PlayButton


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

        -- {{{ Plain

        local Plain = {
          init = function(self)
            self.width = vim.fn.winwidth(vim.api.nvim_get_current_win())
          end,
          provider = function(self)
            -- local timer_text = get_running_timer_text({
            --     '~/orgfiles/**',
            --     '~/orgfiles/**/*',
            --     '~/dev/**/*',
            --     '~/.config/nvim-playground/**'
            -- })
            -- local timer_length = #timer_text
            -- if timer_length > self.width then
            --     timer_text = timer_text:sub(1, self.width)
            --     timer_length = self.width
            -- end
            -- local result_string = string.rep("─", self.width - timer_length - 5) .. " " .. timer_text .. " ───"
            -- return result_string
            return string.rep("─", self.width)
          end,
        }

        local PlainInactive = {
          init = function(self)
            self.width = vim.fn.winwidth(vim.api.nvim_get_current_win())
          end,
          provider = function(self)
            return string.rep("─", self.width)
          end,
        }




        -- }}} Plain

        -- {{{ Tabpage

        local Tabpage = {
          provider = function(self)
            local bufnr = bufs_in_tab(self.tabpage)
            local filestring = filepath_to_filename(vim.fn.bufname(get_first_key(bufnr)))
            if filestring == nil then
              filestring = '[No Name]'
            end
            return '' .. '' .. filestring .. ' '
          end,
          hl = function(self)
            if not self.is_active then
              return 'TabLine'
            else
              return 'TabLineSel'
            end
          end,
          update = 'CursorMoved',
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

        -- {{{ Tabline
        local Tabline = {
          { TabPages },
          { Align },
          { Task },
          { Align },
          { PlayButton },
          { Space },
          { Space },
          { Space },
        }
        -- }}} Tabline

        -- {{{ Statuslines
        local DefaultStatusLine = {
          Plain,
        }

        local InactiveStatusline = {
          condition = conditions.is_not_active,
          PlainInactive,
        }


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
          InactiveStatusline,
          DefaultStatusLine,
        }
        -- }}} Statuslines

        require("heirline").setup({
          statusline = StatusLines,
          tabline = Tabline,
        })
      end
    },

    -- }}} heirline

    -- {{{ Bookmarks
    -- {
    --   'tomasky/bookmarks.nvim',
    --   config = function()
    --     require('bookmarks').setup {
    --       -- sign_priority = 8,  --set bookmark sign priority to cover other sign
    --       save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
    --       keywords =  {
    --         ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
    --         ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
    --         ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    --         ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
    --       },
    --       ---@diagnostic disable-next-line: unused-local
    --       on_attach = function(bufnr)
    --         local bm = require "bookmarks"
    --         local map = vim.keymap.set
    --         map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
    --         map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
    --         map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
    --         map("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
    --         map("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
    --         map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
    --         map("n","mx",bm.bookmark_clear_all) -- removes all bookmarks
    --       end
    --     }
    --   end
    --
    --   -- tag = 'release' -- To use the latest release
    -- },




    {
      "LintaoAmons/bookmarks.nvim",
      -- pin the plugin at specific version for stability
      -- backup your bookmark sqlite db when there are breaking changes
      -- tag = "v2.3.0",
      dependencies = {
        { "kkharji/sqlite.lua" },
        { "nvim-telescope/telescope.nvim" },
        { "stevearc/dressing.nvim" } -- optional: better UI
      },
      config = function()
        local opts = {}                  -- check the "./lua/bookmarks/default-config.lua" file for all the options
        require("bookmarks").setup(opts) -- you must call setup to init sqlite db
      end,
    },




    -- }}} Bookmarks

    -- {{{ Sidebar

    {
      'sidebar-nvim/sidebar.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
      },
      lazy = false,
      config = function()
        local opts = {
          disable_default_keybindings = 0,
          bindings = nil,
          open = false,
          side = "right",
          initial_width = 35,
          hide_statusline = false,
          update_interval = 1000,
          sections = { "todos", "diagnostics" },
          section_separator = { "", "-----", "" },
          section_title_separator = { "" },
          containers = {
            attach_shell = "/bin/sh", show_all = true, interval = 5000,
          },
          datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
          todos = { ignored_paths = { "~" } },
        }
        require('sidebar-nvim').setup(opts)
      end,
      keys = {
        { '<Space>ll', '<CMD>SidebarNvimToggle<CR>', desc = 'Toggle Sidebar' },
      }
    },

    -- }}} Sidebar

    -- {{{ Nvim-ide
    {
      'ldelossa/nvim-ide',
      lazy = false,
      config = function()
        -- local bufferlist      = require('ide.components.bufferlist')
        local explorer        = require('ide.components.explorer')
        local outline         = require('ide.components.outline')
        -- local callhierarchy   = require('ide.components.callhierarchy')
        local timeline        = require('ide.components.timeline')
        local terminal        = require('ide.components.terminal')
        local terminalbrowser = require('ide.components.terminal.terminalbrowser')
        local changes         = require('ide.components.changes')
        local commits         = require('ide.components.commits')
        local branches        = require('ide.components.branches')
        local bookmarks       = require('ide.components.bookmarks')
        local opts            = {
          components = {
            global_keymaps = {},
            Explorer = {
              show_file_permissions = false,
              -- keymaps = {
              --     hide = "x",
              -- }
            }
          },
          panels = {
            left = "explorer",
            right = "info"
          },
          panel_groups = {
            explorer = { explorer.Name, bookmarks.Name, outline.Name, terminalbrowser.Name },
            terminal = { terminal.Name },
            git = { changes.Name, commits.Name, timeline.Name, branches.Name },
            info = { changes.Name, }
          },
          workspaces = {
            auto_open = 'none',
          },
        }
        require('ide').setup(opts)
      end,
      keys = {
        { '<Space>ff', '<CMD>Workspace LeftPanelToggle<CR>', desc = "Left Sidebar (files)" },
      },
    },
    -- }}} Nvim-ide

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
        require 'gitblame'.setup({
          -- your configuration comes here
          -- for example
          enabled = true, -- if you want to enable the plugin
          message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
          date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
          virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
        })
      end
    },
    -- }}} Git blame

    -- {{{ Orgmode
    {
      'nvim-orgmode/orgmode',
      dependencies = {
        -- https://github.com/danilshvalov/org-modern.nvim
        "danilshvalov/org-modern.nvim",
      },
      event = 'VeryLazy',
      ft = { 'org' },
      config = function()
        local Menu = require("org-modern.menu")

        require("orgmode").setup({
          org_agenda_files = {
            '~/orgfiles/**/*',
            -- '~/dev/**/*',
            '~/.config/nvim-playground/*',
          },
          org_default_notes_file = '~/orgfiles/refile.org',
          ui = {
            menu = {
              ---@diagnostic disable-next-line: redundant-parameter
              handler = function(data)
                Menu:new({
                  window = {
                    margin = { 1, 0, 1, 0 },
                    padding = { 0, 1, 0, 1 },
                    title_pos = "center",
                    border = "single",
                    zindex = 1000,
                  },
                  icons = {
                    separator = "➜",
                  },
                }):open(data)
              end,
            },
          },
        })


        -- require('orgmode').setup({
        --   org_agenda_files = {
        --     '~/orgfiles/**/*',
        --     '~/dev/**/*',
        --     '~/.config/nvim-playground/*',
        --   },
        --   org_default_notes_file = '~/orgfiles/refile.org',
        -- })
      end,
      keys = {
        { '<leader>oci', "<CMD>lua require('orgmode').clock:org_clock_in()<CR>",  desc = "Clock in" },
        { '<leader>oco', "<CMD>lua require('orgmode').clock:org_clock_out()<CR>", desc = "Clock out" },
        { '<leader>ci',  "<CMD>lua require('orgmode').clock:org_clock_in()<CR>",  desc = "Clock in" },
        { '<leader>co',  "<CMD>lua require('orgmode').clock:org_clock_out()<CR>", desc = "Clock out" },
      },
    },
    -- }}} Orgmode

    -- {{{ Better-whitespace
    { 'ntpeters/vim-better-whitespace' },
    -- }}} Better-whitespace

    -- {{{ Flash.nvim
    {
      "folke/flash.nvim",
      keys = {
        { 's', '<CMD>lua require("flash").jump()<CR>',       desc = "Flash Jump" },
        { 'S', '<CMD>lua require("flash").treesitter()<CR>', desc = "Flash lsp" }
      }
    },
    -- }}} Flash.nvim

    -- {{{ AsyncRun
    {
      'skywind3000/asyncrun.vim',
      lazy = false,
      keys = {
        { '<A-S-Return>',    '<CMD>AsyncRun make<CR>', desc = "Run make" },
        { '<Space><Return>', '<CMD>AsyncRun make<CR>', desc = "Run Make" },
      },
    },
    -- }}} AsyncRun

    -- {{{ fzf
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      -- or if using mini.icons/mini.nvim
      -- dependencies = { "echasnovski/mini.icons" },
      opts = {}
    },

    -- }}} fzf

    -- {{{ smart-splits
    {
      'mrjones2014/smart-splits.nvim',
      lazy = false,
      opts = {
        cursor_follows_swapped_bufs = true,
      },
      keys = {
        { '<A-C-h>', '<CMD>lua require("smart-splits").swap_buf_left()<CR>',  mode = { "i", "n", "t" }, desc = "Swap left" },
        { '<A-C-j>', '<CMD>lua require("smart-splits").swap_buf_down()<CR>',  mode = { "i", "n", "t" }, desc = "Swap down" },
        { '<A-C-k>', '<CMD>lua require("smart-splits").swap_buf_up()<CR>',    mode = { "i", "n", "t" }, desc = "Swap up" },
        { '<A-C-l>', '<CMD>lua require("smart-splits").swap_buf_right()<CR>', mode = { "i", "n", "t" }, desc = "Swap right" },
      },
    },
    -- }}} smart-splits

    -- {{{ Project.nvim
    {
      'ahmedkhalf/project.nvim',
      lazy = true,
    },
    -- }}} Project.nvim

    -- {{{ Copilot.vim
    {
      'github/copilot.vim',
      lazy = false,
    },
    -- }}} Copilot.vim

    -- {{{ friently-snippets
    {
      "rafamadriz/friendly-snippets",
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
      lazy = false,
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
    {
      'stevearc/aerial.nvim',
      lazy = false,
      keys = { { '<Space>aa', '<CMD>AerialToggle<CR>', desc = 'Aerial' }, },
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
          -- Disable auto brackets... some LSPs may add auto brackets themselves anyway
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
          per_filetype = { codecompanion = { "codecompanion" }, },
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
          signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
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
          status_formatter             = nil,   -- Use default
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
      lazy = true,
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
    {
      "williamboman/mason.nvim",
      lazy = false,
      config = function()
        require 'mason'.setup()
      end,
    },

    {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      dependencies = { "williamboman/mason.nvim", },
      config = function()
        local function get_lua_files_from_config()
          local lua_files = {}
          local config_dir =
          "/home/jordan/.config/nvim-playground/" -- vim.fn.stdpath('config') .. '/lua' -- Assumes ~/.config/nvim/lua
          local function recursive_gather(dir)
            local items = vim.fn.globpath(dir, '*', false, true)
            for _, item in ipairs(items) do
              if vim.fn.isdirectory(item) == 1 then
                recursive_gather(item)
              elseif item:match('%.lua$') then
                table.insert(lua_files, item)
              end
            end
          end
          recursive_gather(config_dir)
          return lua_files
        end

        local lua_files = get_lua_files_from_config()

        local ensured_servers = {
          jdtls = {
            filetyptes = { 'java' },
          },
          pyright = {},
          rust_analyzer = {},
          r_language_server = {
            cmd = { 'R', '--slave', '-e', "options(lintr = list(trailing_blank_lines_linter = NULL, snake_case_linter = NULL)); languageserver::run()" },
            filetypes = { 'R', 'r', 'rmd', 'Rmd' },
          },
          cmakelang = {},
          cmake_language_server = {},
          cmake = {},
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
                    vim.env.VIMRUNTIME,
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
          cmake_language_server = {},
          cmakelang = {},
          cmake = {},
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
                  library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), lua_files, {
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
          automatic_installation = true,
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
      -- command = { "Mason" }
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
      lazy = false,
      keys = {
        -- { '<Space>ff', '<CMD>Neotree toggle<CR>', desc = 'File Tree' },
      },
    },
    -- }}} Neotree

    -- {{{ Treesitter

    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
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
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = false,
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = function()
        require 'nvim-treesitter.configs'.setup {
          textobjects = {
            select = {
              enable = true,
              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
              },
              -- You can choose the select mode (default is charwise 'v')
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * method: eg 'v' or 'o'
              -- and should return the mode ('v', 'V', or '<c-v>') or a table
              -- mapping query_strings to modes.
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
              },
              -- If you set this to `true` (default is `false`) then any textobject is
              -- extended to include preceding or succeeding whitespace. Succeeding
              -- whitespace has priority in order to act similarly to eg the built-in
              -- `ap`.
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * selection_mode: eg 'v'
              -- and should return true or false
              include_surrounding_whitespace = true,
            },
          },
        }
      end
    },


    -- }}} Treesitter

    -- {{{ Lspsaga

    {
      'nvimdev/lspsaga.nvim',
      lazy = false,
      dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
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
      event = "VeryLazy",
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

        -- 'tomasky/bookmarks.nvim',
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
          print(entry['value']:gsub("/+$", ""))
          if entry['value']:gsub("/+$", ""):match("([^/]+)$") == "nvim-playground" then
            vim.cmd('edit ' .. entry['value'] .. '/init.lua')
          else
            if file_exists('' .. entry['value'] .. '/README.org') then
              vim.cmd('edit ' .. entry['value'] .. '/README.org')
            else
              vim.cmd('edit ' .. entry['value'] .. '/README.md')
            end
          end
          -- Toggle the NvimTree buffer
          -- vim.cmd 'split'
          -- vim.cmd 'terminal'
          -- vim.cmd 'Neotree toggle'
          vim.cmd 'Workspace LeftPanelToggle'
          vim.cmd 'wincmd l'
          vim.cmd('cd ' .. entry["value"])
          vim.cmd 'SidebarNvimToggle'
          if file_exists('' .. entry['value'] .. '/TODO.org') then
            vim.cmd 'split'
            vim.cmd('edit ' .. entry['value'] .. '/TODO.org')
            vim.api.nvim_win_set_height(0, 8)
            vim.cmd 'wincmd k'
          end
          -- vim.cmd('cd ')
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
              sync_with_nvim_tree = false, -- default false
              -- default for on_project_selected = find project files
              on_project_selected = function(prompt_bufnr)
                on_project_selected(prompt_bufnr)
              end,
            },
          },
        }
        require 'telescope'.load_extension('make')
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ultisnips')
        pcall(require('telescope').load_extension, 'project')
        pcall(require('telescope').load_extension, 'luasnip')
        -- pcall(require('telescope').load_extension, 'bookmarks')
      end,
      keys = {
        { '<Space>bb', '<CMD>Telescope buffers<CR>',                             desc = 'Help Tags' },
        { '<Space>hh', '<CMD>Telescope help_tags<CR>',                           desc = 'Help Tags' },
        { '<A-x>',     '<CMD>Telescope commands<CR>',                            desc = 'Commands' },
        { '/',         '<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>', desc = 'Buffer Search' },
        { '<Space>pf', '<CMD>Telescope find_files<CR>',                          desc = 'Files' },
        { '<Space>pr', '<CMD>Telescope live_grep<CR>',                           desc = 'Search' },
        { '<Space>po', '<CMD>Telescope project<CR>',                             desc = 'Open' },
        { '<Space>tf', '<CMD>Telescope find_files<CR>',                          desc = 'Files' },
        { '<Space>tr', '<CMD>Telescope live_grep<CR>',                           desc = 'Search (grep)' },
        { '<Space>to', '<CMD>Telescope project<CR>',                             desc = 'Projects' },
        { '<Space>tc', '<CMD>Telescope commands<CR>',                            desc = 'Commands' },
        { '<Space>th', '<CMD>Telescope help_tags<CR>',                           desc = 'Help' },
        { '<Space>t/', '<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>', desc = 'Open' },
        { '<Space>td', '<CMD>Telescope diagnostics<CR>',                         desc = 'Diagnostics' },

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

    --    -- Current unused (in favor of luasnip  (lua config))
    --    -- -- {{{ Ultisnips
    --    -- { 'SirVer/ultisnips',
    --    --   keys = {
    --    --     {'<Space>yy', '<CMD>Telescope ultisnips<CR>', desc = 'Snippets'}
    --    --   },
    --    -- },
    --    -- -- }}} Ultisnips

    -- {{{ nvim-slime

    {
      "jpalardy/vim-slime",
      lazy = false,
      config = function()
        vim.g.slime_target = "neovim"
      end,
      keys = {
        { '<A-return>', '<CMD>SlimeSend<CR>', desc = 'Send to REPL', mode = { "v", "n" } }
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
          { "<Space>a",        group = "Aerial" },
          { "<Space>b",        group = "Buffer" },
          { "<Space>c",        group = "Code" },
          { "<Space>d",        group = "Debug" },
          { "<Space>e",        group = "Errors" },
          { "<leader>f",       group = "File" },
          { "<Space>g",        group = "Git" },
          { "<Space>m",        group = "Make" },
          { "<Space>l",        group = "Lsp" },
          { "<Space>o",        group = "Open" },
          { "<Space>p",        group = "Project" },
          { "<Space>q",        group = "Quit" },
          { "<Space>r",        group = "Reload" },
          { "<Space>s",        group = "Strip" },
          { "<Space>t",        group = "Telescope" },
          { "<Space>x",        group = "Edit/Errors" },
          { "<Space>w",        group = "Window" },
          { "<Space>h",        group = "Help" },
          { "<Space>y",        group = "Snippets" },
          { "<Space><Return>", group = "Make" },
          { "<Space>z",        group = "Zen" },
        })
      end,
    },
    -- }}} Which-key

    -- {{{ Compiler.nvim

    { -- This plugin
      "Zeioth/compiler.nvim",
      cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
      dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
      opts = {},
      lazy = true,
      keys = {
        { '<Space>c<Return>', '<CMD>CompilerOpen<CR>',          desc = 'Compile' },
        { '<Space>cr',        '<CMD>CompilerToggleResults<CR>', desc = 'Results' },
        { '<Space>cx',        '<CMD>CompilerRedo<CR>',          desc = 'Redo' },
        { '<Space>cd',        '<CMD>CompilerStop<CR>',          desc = 'Redo' },
      },
    },
    -- }}} Compiler.nvim

    -- {{{ Overseer
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
    -- }}} Overseer

    -- {{{ GP
    {
      "robitx/gp.nvim",
      lazy = false,
      config = function()
        local conf = {}
        require("gp").setup(conf)
      end,
      keys = {
        { '<Space>L', '<CMD>GpChatToggle<CR>', desc = 'LLM' },
      }
      -- commands = { }
    },
    -- }}} GP

    -- {{{ NvimTree
    {
      'kyazdani42/nvim-tree.lua',
      lazy = false,
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
        -- { '<Space>ff', '<CMD>NvimTreeToggle<CR>', desc = 'File Tree' },
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

-- }}} Lua

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

-- {{{ R

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.r", "*.R" },
  callback = function()
    mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
    mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
    mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
  end
})

-- }}} Javascript

-- }}} Filetype configs

---@diagnostic disable-next-line: unused-local
local playround = require 'playground'

mymap('n', '<A-return>', '<CMD>SlimeSendCurrentLine<CR>')
mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')

mymap('n', '<A-return>', '<CMD>SlimeSendCurrentLine<CR>')
mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')

vim.api.nvim_set_keymap('n', 'gl', '<Plug>(Luadev-Run)', { noremap = false, silent = true })

-- TODO: make format key binding instead of autocmd on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function() vim.lsp.buf.format({ async = true }) end,
-- })




-- ---@diagnostic disable-next-line: lowercase-global
-- function hello_world()
--   print("Hello, World!")
-- end
--
-- ---@diagnostic disable-next-line: lowercase-global
-- function read_file(file_path)
--   local file = io.open(file_path, "r") -- Open the file in read mode
--   if not file then
--     return nil, "Could not open file"
--   end
--   local content = file:read("*a") -- Read the entire file content
--   file:close()                    -- Close the file
--   return content
-- end
