vim.api.nvim_create_user_command('ReloadFTPlugins', 'execute "source" glob($MYVIMRC .. "ftplugin/*.vim")', {})
