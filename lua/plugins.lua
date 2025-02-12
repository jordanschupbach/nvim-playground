
require("lazy").setup({
  spec = { 

    -- {{{ Git signs
    -- https://github.com/lewis6991/gitsigns.nvim
    { 'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {
          signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged_enable = true,
          signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
          linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
          word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
          watch_gitdir = {
            follow_files = true
          },
          auto_attach = true,
          attach_to_untracked = false,
          current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
          },
          current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
          sign_priority = 6,
          update_debounce = 100,
          status_formatter = nil, -- Use default
          max_file_length = 40000, -- Disable if file is longer than this (in lines)
          preview_config = {
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

    { 'mrjones2014/smart-splits.nvim' },

    -- {{{ Incline
    { 'b0o/incline.nvim',

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
      { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
      { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
      -- { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
    }
  end,
}

      end,

      event = 'VeryLazy',
    },
    -- }}} Incline

    -- {{{ Neotree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    },
    -- }}} Neotree

    -- {{{ NerdIcons
    {'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({
       border = 'single',       -- Border
       prompt = '󰨭 ',           -- Prompt Icon
       preview_prompt = ' ',   -- Preview Prompt Icon
       width = 0.5,             -- float window width
       down = '<C-n>',          -- Move down in preview
       up = '<C-p>',            -- Move up in preview
       copy = '<C-y>',          -- Copy to the clipboard
       register = '+',          -- Register to copy to
    }) end},
    -- }}} NerdIcons

    -- {{{ Emoji.nvim
    {
      "allaman/emoji.nvim",
      version = "1.0.0", -- optionally pin to a tag
      ft = "markdown", -- adjust to your needs
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
        enable_cmp_integration = true,
        -- optional if your plugin installation directory
        -- is not vim.fn.stdpath("data") .. "/lazy/
        plugin_path = vim.fn.expand("$HOME/plugins/"),
      },
      config = function(_, opts)
        require("emoji").setup(opts)
        -- optional for telescope integration
        local ts = require('telescope').load_extension 'emoji'
        vim.keymap.set('n', '<leader>se', ts.emoji, { desc = '[S]earch [E]moji' })
      end,
    },
    -- }}} Emoji.nvim

    -- {{{ blink.cmp
    {
      "saghen/blink.cmp",
      dependencies = {
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
      },
      version = 'v0.9.3',
      opts = {
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono'
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
	  providers = {
            emoji = {
              module = "blink-emoji",
              name = "Emoji",
              score_offset = 15,
              opts = { insert = true },
            }
          },
        },
      },
      opts_extend = { "sources.default" },
      preset = {}
    },
    -- }}} blink.cmp

    -- {{{ Neogit
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        -- "ibhagwan/fzf-lua",              -- optional
        -- "echasnovski/mini.pick",         -- optional
      },
      config = function()

        local function mymap(mode, key, value)
          vim.keymap.set(mode, key, value, { silent = true, remap = true })
        end

        local neogit = require('neogit')
        neogit.setup {}

        mymap('n', '<Space>gg', '<CMD>Neogit kind=floating<CR>')
      end,

    },
    -- }}} Neogit

  },

  install = { colorscheme = { "habamax" } },

  checker = { enabled = true },

})
