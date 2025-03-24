local pickers = require('telescope.pickers')
local config = require('telescope.config').values
local previewers = require('telescope.previewers')
local finders = require('telescope.finders')
local utils = require('telescope.previewers.utils')

local M = {}

function M.show_docker_images(opts)
  pickers.new(opts, {
    finder = finders.new_table({
      results = {
      {name = "image1", value = {1, 2, 3, 4, 5,}},
      {name = "image2", value = {1, 1, 3, 3, 5,}},
      {name = "image3", value = {5, 2, 3, 8, 5,}},
    },
    entry_maker = function(entry)
      return {
        value = entry,
        display = entry.name,
        ordinal = entry.name,
      }
    end,
  }),
    sorter = config.generic_sorter(opts),
    previewer = previewers.new_buffer_previewer({
      title = "Docker Image Details",
      define_preview = function(self, entry)
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true,
          vim.iter({"```lua",
          vim.split(vim.inspect(entry.value), "\n"),
          "```"
        }):flatten():totable())
        utils.highlighter(self.state.bufnr, "markdown")
      end
        }),
    }):find()
end

M.show_docker_images()

-- vim.tbl_flatten({"Hello", "World", {"Hello", "World"}})

return M



