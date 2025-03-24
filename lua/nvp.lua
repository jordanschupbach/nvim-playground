-- NOTE: Need to add as a dependency somehow?
local popup = require('plenary.popup')


local M = {}

mymap = function(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end


--- hello_world
--- This is a simple function that prints "hello world" to the console.
--- @return nil
---
--- @usage
--- nvp.hello_world()
M.hello_world = function()
  print("hello world")
end

print("hello world")
print("hello worldz")
print("hello worldzzz")


wrapped_slime = function()
  -- Ensure visual selection is maintained before running SlimeSend
  vim.cmd("normal! gv") -- Re-select the visual selection
  vim.cmd("sleep 10m")  -- Adjust the sleep as necessary
  vim.cmd("normal! gv") -- Re-select the visual selection
  vim.cmd("sleep 10m")  -- Adjust the sleep as necessary
  vim.cmd("'<,'>SlimeSend")   -- Send to Slime
  vim.cmd("sleep 10m")  -- Adjust the sleep as necessary
end

mymap('v', '<A-return>', ':lua wrapped_slime()<CR>', { noremap = true, silent = true })

-- vim.getregion(vim.getpos('v'), vim.getpos('.'), #{ type: mode() })


-- vim.api.nvim_set_keymap('v', '<A-Return>', '<C-c><C-c>', { noremap = true, silent = true })

get_visual_selection = function()
  -- Enter visual mode
  vim.cmd("normal! gv")
  -- Wait a moment for marks to be set if needed
  vim.cmd("sleep 10m")  -- Adjust the sleep as necessary
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
  -- Exit visual mode
  vim.cmd("normal! gv")
  return lines
  -- return table.concat(lines, '\n')
end

function send_lines_to_buffer()
  -- Get current cursor position and visual selection
  local original_pos = vim.fn.getpos('.')
  local current_bufnr = vim.api.nvim_get_current_buf()
  local visual_lines = get_visual_selection()
  dump(visual_lines)
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  local prior_win_id = vim.fn.bufwinid(current_bufnr)
  -- Get the target buffer and check if it exists
  if not vim.api.nvim_buf_is_valid(SendTo_Bufnr) then
    print("Target buffer does not exist.")
    return
  end

  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
  else -- todo handle case not on screen
    return
  end

  -- -- Enter insert mode
  vim.cmd("startinsert")

  vim.api.nvim_feedkeys('G', 'm', true)
  vim.api.nvim_feedkeys('i', 'm', true)
  for _, line in ipairs(visual_lines) do
    vim.api.nvim_feedkeys(line, 'm', true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'm', true)
  end


  -- if prior_win_id ~= -1 then
  --   vim.api.nvim_set_current_win(prior_win_id)
  -- else -- todo handle case not on screen
  --   return
  -- end


  -- -- Restore original cursor position and return to the previous buffer
  -- vim.fn.setpos('.', original_pos)
  -- vim.api.nvim_set_current_buf(vim.fn.bufnr('%'))  -- Switch back to the previous buffer
end




--- Sends current line to SendTo buffer
-- @see register_sendto_buffer, send_lines_to_buffer
---@diagnostic disable-next-line: lowercase-global
M.send_line_to_buffer = function()
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
  vim.api.nvim_feedkeys(current_line, 'm', true) -- Input the current line
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'm', true) -- Press Enter

  -- Use vim.schedule to ensure the following code runs after feedkeys
  vim.schedule(function()
    -- Return to the original window and restore the cursor position
    vim.api.nvim_set_current_win(vim.fn.bufwinid(original_bufnr))
    vim.api.nvim_win_set_cursor(0, original_cursor_pos) -- Restore cursor position
  end)
end



M.show_buffer_info = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local buflines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local line_count = #buflines
  local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
  local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
  local readonly = vim.api.nvim_buf_get_option(bufnr, 'readonly')
  local info = {
    "Buffer Information:",
    "Buffer Number: " .. bufnr,
    "Window Number: " .. winid,
    "Name: " .. bufname,
    "Line Count: " .. line_count,
    "Modified: " .. tostring(modified),
    "Filetype: " .. (filetype ~= '' and filetype or 'none'),
    "Read-only: " .. tostring(readonly),
  }

  local width = 50
  local height = #info + 2

  local opts = {
    title = 'Buffer Info',
    border = true,
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = 5,
    col = 5,
  }

  local bufnr_info = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr_info, 0, -1, false, info)

  local win_id = popup.create(bufnr_info, opts)
  vim.api.nvim_win_set_option(win_id, 'winhighlight', 'Normal:Normal')
end
-- To bind this function to a key
-- vim.api.nvim_set_keymap('n', '<leader>bi', ':lua show_buffer_info()<CR>', { noremap = true, silent = true })

-- M.show_buffer_info()

-- M.hello_world()

return M
