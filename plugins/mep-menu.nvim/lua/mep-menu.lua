local M = {}

-- Default options
local default_opts = {
    buttons = {},
    visible = true,
    width = 50,
}

local function create_menubar(buttons)
    local menubar_buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
    local lines = {}

    for _, button in ipairs(buttons) do
        table.insert(lines, string.format(" %s ", button.text))
    end

    -- Check if there are lines to display
    if #lines == 0 then
        print("No buttons to display in the menubar.")
        return
    end

    -- Set buffer lines
    vim.api.nvim_buf_set_lines(menubar_buf, 0, -1, false, lines)

    -- Create a floating window for the menubar
    local opts = {
        relative = 'editor',
        width = M.opts.width,
        height = #lines,
        row = vim.o.lines - #lines - 1, -- Position near the bottom
        col = (vim.o.columns - M.opts.width) / 2,
        anchor = 'SW',
        style = 'minimal',
        border = 'rounded',
    }

    M.menubar_win = vim.api.nvim_open_win(menubar_buf, true, opts)

    -- Set up close event handler to clear menubar_win when closed
    vim.cmd(string.format(
        'augroup MenubarClose\n' ..
        '  autocmd! * <buffer=%d>\n' ..
        '  autocmd WinClosed <buffer=%d> lua require("mep-menu").close_menubar()\n' ..
        'augroup END',
        menubar_buf, menubar_buf
    ))

    -- Set up Enter key mappings for each button using unique closures
    for i, button in ipairs(buttons) do
        -- Create a closure for the button action
        local action = button.action
        local button_action_name = string.format('M.button_action_%d', i)

        -- Define a function in the global namespace to call the respective action
        _G[button_action_name] = function()
            action()
        end

        -- Map the Enter key to the respective action function
        vim.api.nvim_buf_set_keymap(
            menubar_buf,
            'n',
            string.format('<CR>', i),
            string.format(':lua %s()<CR>', button_action_name),
            { noremap = true, silent = true }
        )
    end
end

-- Close menubar window and reset the menubar_win variable
function M.close_menubar()
    if M.menubar_win then
        vim.api.nvim_win_close(M.menubar_win, true)
        M.menubar_win = nil
        M.opts.visible = false
    end
end

-- Toggle the menubar visibility
M.toggle = function()
    if not M.menubar_win then
        create_menubar(M.opts.buttons)
    else
        close_menubar() -- Close it safely
    end
end

-- Setup function to merge user options with defaults
M.setup = function(opts)
    M.opts = vim.tbl_deep_extend("force", default_opts, opts or {})
    if #M.opts.buttons == 0 then
        print("No buttons to display in the menubar.")
    else
        M.toggle() -- Toggle on by default if buttons exist
    end
end

-- Example function body (to be implemented)
M.myfun = function()
    print("Function executed.")
end

-- This function handles button clicks
function M.on_button_click(button_action)
    if type(button_action) == "function" then
        button_action()
    end
end

return M
