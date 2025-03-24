local M = {}

--- hello_world
---
--- This is a simple function that prints "hello world" to the console.
--- @return nil
M.hello_world = function()
  print("hello world")
end

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


-- toggle_todo()



return M
