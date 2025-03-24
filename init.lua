-- local nvp = require 'nvp'

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

---@diagnostic disable-next-line: lowercase-global
show_line_diagnostics = function()
  local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] })
  if line_diagnostics then
    vim.diagnostic.open_float(0, { severity_limit = 'Error' })
  end
end


mymap('n', 'g:', '<CMD>term<CR>')

mymap('n', '<Space>tn', '<CMD>lua toggle_number()<CR>')
mymap('n', '<Space>tt', '<CMD>lua toggle_todo()<CR>')


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
mymap('n', 'I', '<CMD>lua show_line_diagnostics()<CR>')
-- mymap('n', 'I', '<CMD>lua vim.diagnostic.show_line_diagnostics()<CR>')
mymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
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

-- {{{ General Options

-- {{{ Statusline active/not_active behavior
vim.cmd('highlight StatusLine guifg=#FF33FF guibg=#00FFFFBB')     -- Active buffer colors
-- vim.cmd('highlight StatusLineNC guifg=#888888 guibg=#DFDFF1')     --  guibg=#000000'Inactive buffer colors
vim.cmd('highlight StatusLineNC guifg=#888888 guibg=#88888888')   --  guibg=#000000'Inactive buffer colors
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
-- vim.opt.relativenumber = false
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
function toggle_number()
  if vim.wo.number then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = false -- Optional: set to true if you want relative numbers
  end
end

-- Optionally, create a command to call the toggle function
vim.api.nvim_create_user_command('ToggleNumber', toggle_number, {})


---@diagnostic disable-next-line: lowercase-global
function toggle_todo()
  local todo_buffer_name = 'TODO.org'
  local windows = vim.api.nvim_tabpage_list_wins(0)
  local current_win = vim.api.nvim_get_current_win()
  local found = false

  -- Check existing buffers in current windows
  for _, win in ipairs(windows) do
    local buffer = vim.api.nvim_win_get_buf(win)
    if vim.fn.fnamemodify(vim.fn.bufname(buffer), ':t') == todo_buffer_name then
      -- If found, close the buffer
      vim.api.nvim_win_close(win, true) -- Close the window with TODO.org
      found = true
      break
    end
  end

  -- If not found, open TODO.org in a horizontal split
  if not found then
    vim.cmd('split TODO.org')
    vim.cmd('wincmd w') -- Switch to the newly opened split
  else
    -- Restore the original window position
    vim.api.nvim_set_current_win(current_win)
  end
end

-- Command to call the function
vim.api.nvim_create_user_command('ToggleTODO', toggle_todo, {})








--- Open neorepl
-- opens the neorepl in a new split
---@diagnostic disable-next-line: lowercase-global
open_neorepl = function()
  vim.cmd 'split'
  local buf = vim.api.nvim_get_current_buf()
  require('neorepl').new { lang = 'lua', buffer = buf }
  vim.cmd 'resize 10 | setl winfixheight'
  buf = vim.api.nvim_get_current_buf()
  SendTo_Bufnr = buf
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

---@diagnostic disable-next-line: lowercase-global
register_sendto_buffer = function()
  local current_bufnr = tostring(vim.fn.bufnr '%')
  current_bufnr = vim.fn.input('SendTo bufnr: ', current_bufnr)
  SendTo_Bufnr = tonumber(current_bufnr)
end

--- Sends current line to SendTo buffer
-- @see register_sendto_buffer, send_lines_to_buffer
---@diagnostic disable-next-line: lowercase-global
send_line_to_buffer = function()
  local current_line = vim.api.nvim_get_current_line()
  local original_bufnr = vim.fn.bufnr('%')
  local original_cursor_pos = vim.api.nvim_win_get_cursor(0) -- Save cursor position

  if SendTo_Bufnr == nil then
    register_sendto_buffer()
  end

  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)

  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
    vim.cmd('startinsert') -- Enter insert mode
  else
    return
  end

  -- Move to the bottom and insert the line.
  vim.api.nvim_feedkeys(current_line, 'm', true)                                              -- Input the current line
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'm', true) -- Press Enter

  -- Use vim.schedule to ensure the following code runs after feedkeys
  vim.schedule(function()
    -- Return to the original window and restore the cursor position
    vim.api.nvim_set_current_win(vim.fn.bufwinid(original_bufnr))
    vim.api.nvim_win_set_cursor(0, original_cursor_pos) -- Restore cursor position
  end)
end

--- Gets the text in the visual selection
-- @return a text string of the current visual selection
---@diagnostic disable: lowercase-global
get_visual_selection = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

--- Gets the text in the visual selection
-- @return a table of lines of current visual selection
---@diagnostic disable: lowercase-global
get_visual_selection_lines = function()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  -- Adjust for zero-based indexing
  local start_line = s_start[2] - 1
  local end_line = s_end[2] - 1
  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line + 1, false)
  -- Trim the start of the first line if necessary
  if #lines > 0 then
    lines[1] = string.sub(lines[1], s_start[3], -1)
  end

  -- Trim the end of the last line if the selection spans multiple lines
  if #lines > 1 then
    lines[#lines] = string.sub(lines[#lines], 1, s_end[3])
  elseif #lines == 1 then
    lines[1] = string.sub(lines[1], s_start[3], s_end[3])
  end

  return lines
end

--- Sends visual selection to SendTo buffer
-- @see register_sendto_buffer, send_line_to_buffer
send_lines_to_buffer = function()
  local current_lines = get_visual_selection_lines()
  local original_bufnr = vim.fn.bufnr('%')
  local original_cursor_pos = vim.api.nvim_win_get_cursor(0)
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  -- dump(current_lines)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  vim.api.nvim_set_current_win(win_id)
  vim.cmd('startinsert') -- Enter insert mode
  -- vim.api.nvim_feedkeys('i', 'm', true) -- Input the current line
  for _, line in ipairs(current_lines) do
    vim.api.nvim_feedkeys(line, 'm', true) -- Input the current line
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'm', true)
  end
  -- Use vim.schedule to ensure the following code runs after feedkeys
  vim.schedule(function()
    -- Return to the original window and restore the cursor position
    vim.api.nvim_set_current_win(vim.fn.bufwinid(original_bufnr))
    vim.api.nvim_win_set_cursor(0, original_cursor_pos) -- Restore cursor position
  end)
end

-- function that extracts selected text
extract_selected_text = function()
  -- Get the start and end positions of the selected text
  local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos "'<" + vim.fn.getpos "'>")
  -- Extract the selected text using the range
  local selected_text = vim.fn.getline(start_line, end_line)
  -- If the selection spans multiple lines, adjust the text
  if start_line ~= end_line then
    selected_text[#selected_text] = selected_text[#selected_text]:sub(1, end_col)
    selected_text[1] = selected_text[1]:sub(start_col)
  else
    selected_text[1] = selected_text[1]:sub(start_col, end_col)
  end
  ---@diagnostic disable-next-line: discard-returns, param-type-mismatch
  table.concat(selected_text, '\n')
end

-- Make sure to require plenary.nvim at the beginning of your Lua configuration
-- local popup = require('plenary.popup')

function extract_selected_text_and_show_popup()
  local popup = require 'plenary.popup'
  -- Get the start and end positions of the selected text
  local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos "'<" + vim.fn.getpos "'>")

  -- Extract the selected text using the range
  local selected_text = vim.fn.getline(start_line, end_line)

  -- If the selection spans multiple lines, adjust the text
  if start_line ~= end_line then
    selected_text[#selected_text] = selected_text[#selected_text]:sub(1, end_col)
    selected_text[1] = selected_text[1]:sub(start_col)
  else
    selected_text[1] = selected_text[1]:sub(start_col, end_col)
  end

  -- Join the lines to create a single string
  ---@diagnostic disable-next-line: discard-returns, param-type-mismatch
  local textstring = table.concat(selected_text, '\n')

  -- Create a popup with the extracted text
  local popup_opts = {
    line = 10,
    col = 10,
    width = #textstring + 4,
    height = #textstring + 2,
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    padding = { 0, 1, 0, 1 },
  }

  local popup_bufnr = vim.api.nvim_create_buf(false, true)
  ---@diagnostic disable-next-line: discard-returns, param-type-mismatch
  vim.api.nvim_buf_set_lines(popup_bufnr, 0, -1, false, vim.fn.split(selected_text, '\n'))
  local popup_winid = popup.create(popup_bufnr, popup_opts)

  -- You can close the popup after a delay (e.g., 5 seconds) if needed
  vim.defer_fn(function()
    vim.api.nvim_win_close(popup_winid, true)
  end, 5000)
end

extract_paragraph_at_cursor = function()
  -- Get the current line number
  local current_line = vim.fn.line '.'

  -- Find the start and end lines of the paragraph
  local start_line = current_line
  local end_line = current_line

  -- Find the start line of the paragraph
  while start_line > 1 and vim.fn.trim(vim.fn.getline(start_line - 1)) ~= '' do
    start_line = start_line - 1
  end

  -- Find the end line of the paragraph
  while end_line < vim.fn.line '$' and vim.fn.trim(vim.fn.getline(end_line + 1)) ~= '' do
    end_line = end_line + 1
  end

  -- Extract the paragraph text
  local paragraph_lines = {}
  for line = start_line, end_line do
    table.insert(paragraph_lines, vim.fn.getline(line))
  end

  -- Join the lines to create a single string
  local paragraph_text = table.concat(paragraph_lines, '\n')

  -- Print or use the extracted paragraph text as needed
  -- print(paragraph_text)
  -- You can also return the extracted paragraph text for further use
  return paragraph_text
end

-- utilities.readFromFile = function(file_path)
--   local file = io.open(file_path, "r");
--   if file then
--     local content = file:read("*a");
--     file:close();
--     return content;
--   else
--     return nil;
--   end
-- end

readFromFile = function(file_path)
  local bufnr = vim.fn.bufadd(file_path)
  if bufnr ~= 0 then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    vim.api.nvim_buf_delete(bufnr, { force = true })
    if #lines > 0 then
      return table.concat(lines, '\n')
    else
      return 'Error: File is empty.'
    end
  else
    return 'Error: Unable to open the file.'
  end
end

run_shell_command_to_buffer = function(command)
  local output = vim.fn.systemlist(command)
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output)
  vim.cmd 'enew | setlocal buftype=nofile bufhidden=hide noswapfile'
  vim.cmd 'setlocal filetype=text'
  vim.api.nvim_set_current_buf(bufnr)
end

run_shell_to_string = function(command)
  local output = vim.fn.systemlist(command)
  return output
end

readFromFile2 = function(file_path)
  local file = io.open(file_path, 'r') -- Open the file in read mode
  if file then
    local content = file:read '*a'
    file:close()
    if content == '' then
      return 'File was empty'
    else
      return content
    end
    return content
  else
    return 'Error: Unable to open the file.'
  end
end

show_simple_popup = function(text)
  local popup = require 'plenary.popup'
  local popup_opts = {
    line = vim.fn.line '.' + 1,
    col = vim.fn.col '.',
    width = 30,
    height = 3,
    padding = { 0, 1, 0, 1 },
    move_on_insert = true,
    close_on_buf_leave = true,
  }
  ---@diagnostic disable-next-line: discard-returns, param-type-mismatch, unused-local
  local popup_winid, popup_bufnr = popup.create(split_string_at_newlines(text), popup_opts)
end

show_paragraph_in_popup = function()
  local paragraph = extract_paragraph_at_cursor()
  show_simple_popup(paragraph)
end

runRScript = function(text)
  local temp_file1 = vim.fn.tempname()
  local temp_file2 = vim.fn.tempname()
  local file = io.open(temp_file1, 'w')
  if file then
    file:write(text)
    file:close()
  else
    print('Error: Could not open file temp_file1 (' .. temp_file1 .. ') for writing.')
    return
  end
  local command = 'Rscript ' .. temp_file1 .. ' > ' .. temp_file2
  ---@diagnostic disable-next-line: unused-local
  local output = vim.fn.system(command)
  file = io.open(temp_file1, 'w')
  if file then
    file:write(text)
    file:close()
  else
    print 'Error: Could not open file for writing.'
    return
  end
  ---@diagnostic disable-next-line: redefined-local
  local file = io.open(temp_file2, 'r')
  if file then
    local content = file:read '*a'
    return content
  else
    print('Unable to read' .. temp_file2)
  end
end

getCurrentBufferFilePath = function()
  local bufnr = vim.fn.bufnr '%'
  if bufnr ~= 0 then
    return vim.fn.bufname(bufnr)
  else
    return nil
  end
end

extractFilename = function(filepath)
  local filename = string.match(filepath, '[^/\\]+$')
  return filename or filepath
end

strip_newline_symbols = function(text)
  local result = text:gsub('\n', '')
  return result
end

run_lua_text = function(text)
  ---@diagnostic disable-next-line: undefined-global
  vim.cmd('lua ' .. replace_newlines_with_semicolons(text))
end

run_lua_paragraph = function()
  local text = extract_paragraph_at_cursor()
  vim.cmd('lua ' .. strip_newline_symbols(text))
end

split_string_at_newlines = function(text)
  local lines = {}
  for line in text:gmatch '[^\r\n]+' do
    table.insert(lines, line)
  end
  return lines
end


---@diagnostic disable-next-line: unused-local
parse_cpp_test_output = function(output)
  ---@diagnostic disable-next-line: unused-local
  local ret = {}
  local test_output = run_shell_to_string 'make test'
  local ntest_line_idx = 0
  for key, value in pairs(test_output) do
    if value:find('%f[%a]' .. 'test cases' .. '%f[%A]') then
      ntest_line_idx = key
      -- npass_line_idx = key
    end
  end
  local ntests = 0
  local ntests_passed = 0
  if ntest_line_idx == 0 then
    ntests = 0
    ntests_passed = 0
  else
    ntests, ntests_passed = test_output[ntest_line_idx]:match ': (%d+) | (%d+)'
    -- ntests = tonumber(test_output[ntest_line_idx]:match '%d+')
    -- ntests_passing = tonumber(test_output[npass_line_idx]:match '%d+')
  end
  ret['ntests'] = ntests
  ret['passing'] = ntests_passed
  return ret
end

parse_cpp_coverage_ouput = function()
  local ret = {}
  local lout = ''
  local fout = ''
  local test_output = run_shell_to_string 'make coverage'
  local ntest_line_idx = 0
  local npass_line_idx = 0
  for key, value in pairs(test_output) do
    if value:find('%f[%a]' .. 'Overall coverage' .. '%f[%A]') then
      ntest_line_idx = key + 1
      npass_line_idx = key + 2
    end
  end
  ---@diagnostic disable-next-line: unused-local
  local ntests = 0
  ---@diagnostic disable-next-line: unused-local
  local ntests_passing = 0
  if ntest_line_idx == 0 then
    ---@diagnostic disable-next-line: unused-local
    ntests = 0
    ---@diagnostic disable-next-line: unused-local
    ntests_passing = 0
    lout = '100% (0/0)'
    fout = '100% (0/0)'
  else
    ---@diagnostic disable-next-line: unused-local, cast-local-type
    ntests = tonumber(test_output[ntest_line_idx]:match '%d+')
    ---@diagnostic disable-next-line: unused-local, cast-local-type
    ntests_passing = tonumber(test_output[npass_line_idx]:match '%d+')
    local lpercentage, lnumerator, ldenominator =
        string.match(test_output[ntest_line_idx], '(%d+%.?%d*)%% %((%d+) of (%d+) lines%)')
    if lpercentage == nil then
      lout = '100% (0/0)'
    else
      lout = '' .. lpercentage .. '%' .. ' (' .. lnumerator .. '/' .. ldenominator .. ')'
    end

    local fpercentage, fnumerator, fdenominator =
        string.match(test_output[npass_line_idx], '(%d+%.?%d*)%% %((%d+) of (%d+) functions%)')
    if fpercentage == nil then
      fout = '100% (0/0)'
    else
      fout = '' .. fpercentage .. '%' .. ' (' .. fnumerator .. '/' .. fdenominator .. ')'
    end
  end
  ret['lines'] = lout
  ret['functions'] = fout
  return ret
end

-- see if the file exists
file_exists = function(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

init_ldmode = function()
  if not file_exists '/home/jordan/.cache/ldmode' then
    local file = io.open('/home/jordan/.cache/ldmode', 'w')
    ---@diagnostic disable-next-line: need-check-nil
    file:write 'dark'
    ---@diagnostic disable-next-line: need-check-nil
    file:close()
  end
end


-- get all lines from a file, returns an empty
-- list/table if the file does not exist
lines_from = function(file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

get_ldmode = function()
  return lines_from '/home/jordan/.cache/ldmode'
end

waldark_toggle = function()
  io.popen 'waldark '
end

waldark_dark = function()
  io.popen 'waldark --dark'
end

waldark_light = function()
  io.popen 'waldark --light'
end

swap_window_right = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd l'
  local right_win = vim.api.nvim_get_current_win()
  local right_buf = vim.api.nvim_win_get_buf(right_win)
  if current_win ~= right_win then
    -- vim.api.nvim_command 'wincmd h'
    vim.api.nvim_win_set_buf(current_win, right_buf)
    vim.api.nvim_win_set_buf(right_win, current_buf)
  end
  -- return utilities.dump(current_buf)
end

swap_window_left = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd h'
  local left_win = vim.api.nvim_get_current_win()
  local left_buf = vim.api.nvim_win_get_buf(left_win)
  if current_win ~= left_win then
    -- vim.api.nvim_command 'wincmd l'
    vim.api.nvim_win_set_buf(current_win, left_buf)
    vim.api.nvim_win_set_buf(left_win, current_buf)
  end
end

swap_window_up = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd k'
  local up_win = vim.api.nvim_get_current_win()
  local up_buf = vim.api.nvim_win_get_buf(up_win)
  if current_win ~= up_win then
    -- vim.api.nvim_command 'wincmd j'
    vim.api.nvim_win_set_buf(current_win, up_buf)
    vim.api.nvim_win_set_buf(up_win, current_buf)
  end
end

swap_window_down = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd j'
  local down_win = vim.api.nvim_get_current_win()
  local down_buf = vim.api.nvim_win_get_buf(down_win)
  if current_win ~= down_win then
    -- vim.api.nvim_command 'wincmd k'
    vim.api.nvim_win_set_buf(current_win, down_buf)
    vim.api.nvim_win_set_buf(down_win, current_buf)
  end
end

determine_project_type = function()
  local ret = 'unknown'
  local current_dir = vim.fn.getcwd()
  if file_exists(current_dir .. '/.luarc.json') then
    return 'lua'
  end
  if file_exists(current_dir .. '/CMakeLists.txt') then
    return 'cpp'
  end
  return ret
end

slime_send_make_run = function()
  vim.api.nvim_call_function('slime#send', { 'make run\n' })
end

slime_send = function(cmd)
  vim.api.nvim_call_function('slime#send', { cmd .. '\n' })
end

say_hello = function()
  print 'hello world'
end

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


    -- https://github.com/thesimonho/kanagawa-paper.nvim
    { "thesimonho/kanagawa-paper.nvim" },

    { "savq/melange-nvim" },
    -- { "EdenEast/nightfox.nvim" },

    {
      -- https://github.com/nvim-focus/focus.nvim
      'nvim-focus/focus.nvim',
      config = function()
        require("focus").setup({
          enable = false,         -- Enable module
          commands = true,        -- Create Focus commands
          autoresize = {
            enable = true,        -- Enable or disable auto-resizing of splits
            width = 0,            -- Force width for the focused window
            height = 0,           -- Force height for the focused window
            minwidth = 0,         -- Force minimum width for the unfocused window
            minheight = 0,        -- Force minimum height for the unfocused window
            height_quickfix = 10, -- Set the height of quickfix panel
          },
          split = {
            bufnew = false, -- Create blank buffer for new split windows
            tmux = false,   -- Create tmux splits instead of neovim splits
          },
          ui = {
            number = false,                    -- Display line numbers in the focussed window only
            relativenumber = false,            -- Display relative line numbers in the focussed window only
            hybridnumber = false,              -- Display hybrid line numbers in the focussed window only
            absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows
            cursorline = true,                 -- Display a cursorline in the focussed window only
            cursorcolumn = false,              -- Display cursorcolumn in the focussed window only
            colorcolumn = {
              enable = false,                  -- Display colorcolumn in the foccused window only
              list = '+1',                     -- Set the comma-saperated list for the colorcolumn
            },
            signcolumn = true,                 -- Display signcolumn in the focussed window only
            winhighlight = false,              -- Auto highlighting for focussed/unfocussed windows
          }
        })
      end,
    },


    -- {{{ plenary
    {
      "nvim-lua/plenary.nvim",
      event = "BufRead",
      config = function()
        mymap("n", "<leader>bi", "<cmd>lua require'nvp'.show_buffer_info()<cr>")
      end,
    },
    -- }}} plenary



    -- {{{ zen-mode
    {
      "folke/zen-mode.nvim",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      cmd = "ZenMode",
      keys = {
        { "<A-z>", "<CMD>ZenMode<CR>", desc = "Zen Mode" },
      },
    },
    -- }}} zen-mode

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
          -- If you enable messages, then the cmdline is enabled automatically.
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
        { "<Space>tT", "<CMD>TodoTelescope<CR>", desc = "Todos" },
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
              '~/dev/CHARM-3.0/**',
              '~/dev/charm/',
              '~/dev/templates/**/*',
              '~/.config/nvim-playground/**',
              '~/papers/tmc/**'
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
        { '<Space>ii', '<CMD>Workspace LeftPanelToggle<CR>', desc = "Left Sidebar (files)" },
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
        -- some shorthands...
        local s = ls.snippet
        local sn = ls.snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local l = require("luasnip.extras").lambda
        local rep = require("luasnip.extras").rep
        local p = require("luasnip.extras").partial
        local m = require("luasnip.extras").match
        local n = require("luasnip.extras").nonempty
        local dl = require("luasnip.extras").dynamic_lambda
        local fmt = require("luasnip.extras.fmt").fmt
        local fmta = require("luasnip.extras.fmt").fmta
        local types = require("luasnip.util.types")
        local conds = require("luasnip.extras.conditions")
        local conds_expand = require("luasnip.extras.conditions.expand")

        -- If you're reading this file for the first time, best skip to around line 190
        -- where the actual snippet-definitions start.

        -- Every unspecified option will be set to the default.
        ls.setup({
          keep_roots = true,
          link_roots = true,
          link_children = true,

          -- Update more often, :h events for more info.
          update_events = "TextChanged,TextChangedI",
          -- Snippets aren't automatically removed if their text is deleted.
          -- `delete_check_events` determines on which events (:h events) a check for
          -- deleted snippets is performed.
          -- This can be especially useful when `history` is enabled.
          delete_check_events = "TextChanged",
          ext_opts = {
            [types.choiceNode] = {
              active = {
                virt_text = { { "choiceNode", "Comment" } },
              },
            },
          },
          -- treesitter-hl has 100, use something higher (default is 200).
          ext_base_prio = 300,
          -- minimal increase in priority.
          ext_prio_increase = 1,
          enable_autosnippets = true,
          -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
          -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
          store_selection_keys = "<Tab>",
          -- luasnip uses this function to get the currently active filetype. This
          -- is the (rather uninteresting) default, but it's possible to use
          -- eg. treesitter for getting the current filetype by setting ft_func to
          -- require("luasnip.extras.filetype_functions").from_cursor (requires
          -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
          -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
          ft_func = function()
            return vim.split(vim.bo.filetype, ".", {plain = true})
          end,
        })

        -- args is a table, where 1 is the text in Placeholder 1, 2 the text in
        -- placeholder 2,...
        local function copy(args)
          return args[1]
        end

        -- 'recursive' dynamic snippet. Expands to some text followed by itself.
        local rec_ls
        rec_ls = function()
          return sn(
            nil,
            c(1, {
              -- Order is important, sn(...) first would cause infinite loop of expansion.
              t(""),
              sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
            })
          )
        end

        -- complicated function for dynamicnode.
        local function jdocsnip(args, _, old_state)
          -- !!! old_state is used to preserve user-input here. don't do it that way!
          -- using a restorenode instead is much easier.
          -- view this only as an example on how old_state functions.
          local nodes = {
            t({ "/**", " * " }),
            i(1, "a short description"),
            t({ "", "" }),
          }

          -- these will be merged with the snippet; that way, should the snippet be updated,
          -- some user input eg. text can be referred to in the new snippet.
          local param_nodes = {}

          if old_state then
            nodes[2] = i(1, old_state.descr:get_text())
          end
          param_nodes.descr = nodes[2]

          -- at least one param.
          if string.find(args[2][1], ", ") then
            vim.list_extend(nodes, { t({ " * ", "" }) })
          end

          local insert = 2
          ---@diagnostic disable-next-line: unused-local
          for indx, arg in ipairs(vim.split(args[2][1], ", ", {plain = true})) do
            -- get actual name parameter.
            arg = vim.split(arg, " ", {plain = true})[2]
            if arg then
              local inode
              -- if there was some text in this parameter, use it as static_text for this new snippet.
              if old_state and old_state[arg] then
                inode = i(insert, old_state["arg" .. arg]:get_text())
              else
                inode = i(insert)
              end
              vim.list_extend(
                nodes,
                { t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
              )
              param_nodes["arg" .. arg] = inode

              insert = insert + 1
            end
          end

          if args[1][1] ~= "void" then
            local inode
            if old_state and old_state.ret then
              inode = i(insert, old_state.ret:get_text())
            else
              inode = i(insert)
            end

            vim.list_extend(
              nodes,
              { t({ " * ", " * @return " }), inode, t({ "", "" }) }
            )
            param_nodes.ret = inode
            insert = insert + 1
          end

          if vim.tbl_count(args[3]) ~= 1 then
            local exc = string.gsub(args[3][2], " throws ", "")
            local ins
            if old_state and old_state.ex then
              ins = i(insert, old_state.ex:get_text())
            else
              ins = i(insert)
            end
            vim.list_extend(
              nodes,
              { t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
            )
            param_nodes.ex = ins
            insert = insert + 1
          end

          vim.list_extend(nodes, { t({ " */" }) })

          local snip = sn(nil, nodes)
          -- error on attempting overwrite.
          snip.old_state = param_nodes
          return snip
        end

        -- make sure to not pass an invalid command, as io.popen() may write over nvim-text.
        local function bash(_, _, command)
          local file = io.popen(command, "r")
          local res = {}
          ---@diagnostic disable-next-line: need-check-nil
          for line in file:lines() do
            table.insert(res, line)
          end
          return res
        end

        -- returns a snippet_node wrapped around an insertnode whose initial
        -- text value is set to the current date in the desired format.
       ---@diagnostic disable-next-line: unused-local, redefined-local
        local date_input = function(args, snip, old_state, fmt)
       ---@diagnostic disable-next-line: redefined-local
          local fmt = fmt or "%y-%m-%d"
          return sn(nil, i(1, os.date(fmt)))
        end

        -- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
        -- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
        -- for snippets that should expand directly after the trigger is typed).
        --
        -- opts can also specify a key. by passing an unique key to each add_snippets, it's possible to reload snippets by
        -- re-`:luafile`ing the file in which they are defined (eg. this one).
        ls.add_snippets("all", {
          -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
          s("fn", {
            -- Simple static text.
            t("//Parameters: "),
            -- function, first parameter is the function, second the Placeholders
            -- whose text it gets as input.
            f(copy, 2),
            t({ "", "function " }),
            -- Placeholder/Insert.
            i(1),
            t("("),
            -- Placeholder with initial text.
            i(2, "int foo"),
            -- Linebreak
            t({ ") {", "\t" }),
            -- Last Placeholder, exit Point of the snippet.
            i(0),
            t({ "", "}" }),
          }),
          s("class", {
            -- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
            c(1, {
              t("public "),
              t("private "),
            }),
            t("class "),
            i(2),
            t(" "),
            c(3, {
              t("{"),
              -- sn: Nested Snippet. Instead of a trigger, it has a position, just like insertNodes. !!! These don't expect a 0-node!!!!
              -- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
              sn(nil, {
                t("extends "),
                -- restoreNode: stores and restores nodes.
                -- pass position, store-key and nodes.
                r(1, "other_class", i(1)),
                t(" {"),
              }),
              sn(nil, {
                t("implements "),
                -- no need to define the nodes for a given key a second time.
                r(1, "other_class"),
                t(" {"),
              }),
            }),
            t({ "", "\t" }),
            i(0),
            t({ "", "}" }),
          }),
          -- Alternative printf-like notation for defining snippets. It uses format
          -- string with placeholders similar to the ones used with Python's .format().
          s(
            "fmt1",
            fmt("To {title} {} {}.", {
              i(2, "Name"),
              i(3, "Surname"),
              title = c(1, { t("Mr."), t("Ms.") }),
            })
          ),
          -- To escape delimiters use double them, e.g. `{}` -> `{{}}`.
          -- Multi-line format strings by default have empty first/last line removed.
          -- Indent common to all lines is also removed. Use the third `opts` argument
          -- to control this behaviour.
          s(
            "fmt2",
            fmt(
              [[
		foo({1}, {3}) {{
			return {2} * {4}
		}}
		]],
              {
                i(1, "x"),
                rep(1),
                i(2, "y"),
                rep(2),
              }
            )
          ),
          -- Empty placeholders are numbered automatically starting from 1 or the last
          -- value of a numbered placeholder. Named placeholders do not affect numbering.
          s(
            "fmt3",
            fmt("{} {a} {} {1} {}", {
              t("1"),
              t("2"),
              a = t("A"),
            })
          ),
          -- The delimiters can be changed from the default `{}` to something else.
          s("fmt4", fmt("foo() { return []; }", i(1, "x"), { delimiters = "[]" })),
          -- `fmta` is a convenient wrapper that uses `<>` instead of `{}`.
          s("fmt5", fmta("foo() { return <>; }", i(1, "x"))),
          -- By default all args must be used. Use strict=false to disable the check
          s(
            "fmt6",
            fmt("use {} only", { t("this"), t("not this") }, { strict = false })
          ),
          -- Use a dynamicNode to interpolate the output of a
          -- function (see date_input above) into the initial
          -- value of an insertNode.
          s("novel", {
            t("It was a dark and stormy night on "),
            d(1, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
            t(" and the clocks were striking thirteen."),
          }),
          -- Parsing snippets: First parameter: Snippet-Trigger, Second: Snippet body.
          -- Placeholders are parsed into choices with 1. the placeholder text(as a snippet) and 2. an empty string.
          -- This means they are not SELECTed like in other editors/Snippet engines.
          ls.parser.parse_snippet(
            "lspsyn",
            "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
          ),

          -- When wordTrig is set to false, snippets may also expand inside other words.
          ls.parser.parse_snippet(
            { trig = "te", wordTrig = false },
            "${1:cond} ? ${2:true} : ${3:false}"
          ),

          -- When regTrig is set, trig is treated like a pattern, this snippet will expand after any number.
          ls.parser.parse_snippet({ trig = "%d", regTrig = true }, "A Number!!"),
          -- Using the condition, it's possible to allow expansion only in specific cases.
          s("cond", {
            t("will only expand in c-style comments"),
          }, {
            ---@diagnostic disable-next-line: unused-local
            condition = function(line_to_cursor, matched_trigger, captures)
              -- optional whitespace followed by //
              return line_to_cursor:match("%s*//")
            end,
          }),
          -- there's some built-in conditions in "luasnip.extras.conditions.expand" and "luasnip.extras.conditions.show".
          s("cond2", {
            t("will only expand at the beginning of the line"),
          }, {
            condition = conds_expand.line_begin,
          }),
          s("cond3", {
            t("will only expand at the end of the line"),
          }, {
            condition = conds_expand.line_end,
          }),
          -- on conditions some logic operators are defined
          s("cond4", {
            t("will only expand at the end and the start of the line"),
          }, {
            -- last function is just an example how to make own function objects and apply operators on them
            condition = conds_expand.line_end
                + conds_expand.line_begin
                * conds.make_condition(function()
                  return true
                end),
          }),
          -- The last entry of args passed to the user-function is the surrounding snippet.
          s(
            { trig = "a%d", regTrig = true },
            f(function(_, snip)
              return "Triggered with " .. snip.trigger .. "."
            end, {})
          ),
          -- It's possible to use capture-groups inside regex-triggers.
          s(
            { trig = "b(%d)", regTrig = true },
            f(function(_, snip)
              return "Captured Text: " .. snip.captures[1] .. "."
            end, {})
          ),
          s({ trig = "c(%d+)", regTrig = true }, {
            t("will only expand for even numbers"),
          }, {
            ---@diagnostic disable-next-line: unused-local
            condition = function(line_to_cursor, matched_trigger, captures)
              return tonumber(captures[1]) % 2 == 0
            end,
          }),
          -- Use a function to execute any shell command and print its text.
          s("bash", f(bash, {}, { user_args = { "ls" } })),
          -- Short version for applying String transformations using function nodes.
          s("transform", {
            i(1, "initial text"),
            t({ "", "" }),
            -- lambda nodes accept an l._1,2,3,4,5, which in turn accept any string transformations.
            -- This list will be applied in order to the first node given in the second argument.
            l(l._1:match("[^i]*$"):gsub("i", "o"):gsub(" ", "_"):upper(), 1),
          }),

          s("transform2", {
            i(1, "initial text"),
            t("::"),
            i(2, "replacement for e"),
            t({ "", "" }),
            -- Lambdas can also apply transforms USING the text of other nodes:
            l(l._1:gsub("e", l._2), { 1, 2 }),
          }),
          s({ trig = "trafo(%d+)", regTrig = true }, {
            -- env-variables and captures can also be used:
            l(l.CAPTURE1:gsub("1", l.TM_FILENAME), {}),
          }),
          -- Set store_selection_keys = "<Tab>" (for example) in your
          -- luasnip.config.setup() call to populate
          -- TM_SELECTED_TEXT/SELECT_RAW/SELECT_DEDENT.
          -- In this case: select a URL, hit Tab, then expand this snippet.
          s("link_url", {
            t('<a href="'),
            f(function(_, snip)
              -- TM_SELECTED_TEXT is a table to account for multiline-selections.
              -- In this case only the first line is inserted.
              return snip.env.TM_SELECTED_TEXT[1] or {}
            end, {}),
            t('">'),
            i(1),
            t("</a>"),
            i(0),
          }),
          -- Shorthand for repeating the text in a given node.
          s("repeat", { i(1, "text"), t({ "", "" }), rep(1) }),
          -- Directly insert the ouput from a function evaluated at runtime.
          s("part", p(os.date, "%Y")),
          -- use matchNodes (`m(argnode, condition, then, else)`) to insert text
          -- based on a pattern/function/lambda-evaluation.
          -- It's basically a shortcut for simple functionNodes:
          s("mat", {
            i(1, { "sample_text" }),
            t(": "),
            m(1, "%d", "contains a number", "no number :("),
          }),
          -- The `then`-text defaults to the first capture group/the entire
          -- match if there are none.
          s("mat2", {
            i(1, { "sample_text" }),
            t(": "),
            m(1, "[abc][abc][abc]"),
          }),
          -- It is even possible to apply gsubs' or other transformations
          -- before matching.
          s("mat3", {
            i(1, { "sample_text" }),
            t(": "),
            m(
              1,
              l._1:gsub("[123]", ""):match("%d"),
              "contains a number that isn't 1, 2 or 3!"
            ),
          }),
          -- `match` also accepts a function in place of the condition, which in
          -- turn accepts the usual functionNode-args.
          -- The condition is considered true if the function returns any
          -- non-nil/false-value.
          -- If that value is a string, it is used as the `if`-text if no if is explicitly given.
          s("mat4", {
            i(1, { "sample_text" }),
            t(": "),
            m(1, function(args)
              -- args is a table of multiline-strings (as usual).
              return (#args[1][1] % 2 == 0 and args[1]) or nil
            end),
          }),
          -- The nonempty-node inserts text depending on whether the arg-node is
          -- empty.
          s("nempty", {
            i(1, "sample_text"),
            n(1, "i(1) is not empty!"),
          }),
          -- dynamic lambdas work exactly like regular lambdas, except that they
          -- don't return a textNode, but a dynamicNode containing one insertNode.
          -- This makes it easier to dynamically set preset-text for insertNodes.
          s("dl1", {
            i(1, "sample_text"),
            t({ ":", "" }),
            dl(2, l._1, 1),
          }),
          -- Obviously, it's also possible to apply transformations, just like lambdas.
          s("dl2", {
            i(1, "sample_text"),
            i(2, "sample_text_2"),
            t({ "", "" }),
            dl(3, l._1:gsub("\n", " linebreak ") .. l._2, { 1, 2 }),
          }),
        }, {
          key = "all",
        })



        -- {{{ lua snippets
        ls.add_snippets("lua", {
          -- Very long example for a java class.
          s("new-module", {
            t({ "local M = {}", "", "", }),
            i(1),
            t({ "", "", "return M" }),
          }),

          s("lowercase-global", {
            t({ "---@diagnostic disable-next-line: lowercase-global", }),
          }),

          s("unused-local", {
            t({ "---@diagnostic disable-next-line: unused-local", }),
          }),

        }, {
          key = "lua",
        })
        -- }}} lua snippets


        ls.add_snippets("java", {
          -- Very long example for a java class.
          s("fn", {
            d(6, jdocsnip, { 2, 4, 5 }),
            t({ "", "" }),
            c(1, {
              t("public "),
              t("private "),
            }),
            c(2, {
              t("void"),
              t("String"),
              t("char"),
              t("int"),
              t("double"),
              t("boolean"),
              i(nil, ""),
            }),
            t(" "),
            i(3, "myFunc"),
            t("("),
            i(4),
            t(")"),
            c(5, {
              t(""),
              sn(nil, {
                t({ "", " throws " }),
                i(1),
              }),
            }),
            t({ " {", "\t" }),
            i(0),
            t({ "", "}" }),
          }),
        }, {
          key = "java",
        })

        ls.add_snippets("tex", {
          -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
          -- \item as necessary by utilizing a choiceNode.
          s("ls", {
            t({ "\\begin{itemize}", "\t\\item " }),
            i(1),
            d(2, rec_ls, {}),
            t({ "", "\\end{itemize}" }),
          }),
        }, {
          key = "tex",
        })

        -- set type to "autosnippets" for adding autotriggered snippets.
        ls.add_snippets("all", {
          s("autotrigger", {
            t("autosnippet"),
          }),
        }, {
          type = "autosnippets",
          key = "all_auto",
        })

        -- in a lua file: search lua-, then c-, then all-snippets.
        ls.filetype_extend("lua", { "c" })
        -- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
        ls.filetype_set("cpp", { "c" })

        -- Beside defining your own snippets you can also load snippets from "vscode-like" packages
        -- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.

        require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets

        -- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
        -- a similar `package.json`)
        require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

        -- You can also use lazy loading so snippets are loaded on-demand, not all at once (may interfere with lazy-loading luasnip itself).
        require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

        -- You can also use snippets in snipmate format, for example <https://github.com/honza/vim-snippets>.
        -- The usage is similar to vscode.

        -- One peculiarity of honza/vim-snippets is that the file containing global
        -- snippets is _.snippets, so we need to tell luasnip that the filetype "_"
        -- contains global snippets:
        ls.filetype_extend("all", { "_" })

        require("luasnip.loaders.from_snipmate").load({ include = { "c" } }) -- Load only snippets for c.

        -- Load snippets from my-snippets folder
        -- The "." refers to the directory where of your `$MYVIMRC` (you can print it
        -- out with `:lua print(vim.env.MYVIMRC)`.
        -- NOTE: It's not always set! It isn't set for example if you call neovim with
        -- the `-u` argument like this: `nvim -u yeet.txt`.
        require("luasnip.loaders.from_snipmate").load({ path = { "./my-snippets" } })
        -- If path is not specified, luasnip will look for the `snippets` directory in rtp (for custom-snippet probably
        -- `~/.config/nvim/snippets`).

        require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading

        -- see DOC.md/LUA SNIPPETS LOADER for some details.
        require("luasnip.loaders.from_lua").load({ include = { "c" } })
        require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "cpp" } })
      end,
      keys = {
        { '<Space>su', '<CMD>Telescope ultisnips<CR>', desc = 'Ultisnip Snippets' },
        { '<Space>ss', '<CMD>Telescope luasnip<CR>',   desc = 'Luasnip Snippets' }
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
      lazy = false,
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
          -- cmakelang = {},
          -- cmake_language_server = {},
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
        { '<Space>ff', '<CMD>Neotree toggle<CR>', desc = 'File Tree' },
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
        'nvim-lua/popup.nvim',
        -- 'tomasky/bookmarks.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
        'fhill2/telescope-ultisnips.nvim',
        'nvim-telescope/telescope-media-files.nvim',

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
        pcall(require('telescope').load_extension, 'media_files')
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
      -- keys = {
      --   { '<A-return>', '<CMD>SlimeSend<CR>', desc = 'Send to REPL', mode = { "v", "n" } }
      -- },
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
    mymap('n', '<A-S-return>', '<CMD>source %<CR>')
    -- mymap('n', '<A-S-return>', '<CMD>silent make<CR>')
    -- mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
    -- mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
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
    -- mymap('n', '<A-return>', '<CMD>SlimeSend<CR>')
    -- mymap('v', '<A-return>', '<CMD>SlimeSend<CR>')
  end
})

-- }}} Javascript

-- }}} Filetype configs

-- {{{ Misc inbox

---@diagnostic disable-next-line: unused-local
-- local playround = require 'playground'


wrapped_slime = function()
  vim.cmd("sleep 10m")      -- Adjust the sleep as necessary
  vim.cmd("'<,'>SlimeSend") -- Send to Slime
end

---@diagnostic disable-next-line: redundant-parameter
mymap('v', '<A-return>', ':lua wrapped_slime()<CR>', { noremap = true, silent = true })
mymap('n', '<A-return>', '<CMD>SlimeSendCurrentLine<CR>')

vim.api.nvim_set_keymap('n', 'gl', '<Plug>(Luadev-Run)', { noremap = false, silent = true })


vim.api.nvim_create_user_command('Format',
  function() vim.lsp.buf.format({ async = true }) end, { nargs = 0 })

mymap('n', '<Space>F', '<CMD>Format<CR>')

-- }}} Misc inbox

-- {{{ Post plugin option fixes
vim.opt.number = false
-- }}} Post plugin option fixes

-- End init.lua
