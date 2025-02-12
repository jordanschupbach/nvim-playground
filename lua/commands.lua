-- User commands

vim.api.nvim_create_user_command('ReloadFTPlugins', 'execute "source" glob($MYVIMRC .. "ftplugin/*.vim")', {})
vim.api.nvim_create_user_command('SayHello', "<CMD>require'playground'.hello_world()<CR>", {})
