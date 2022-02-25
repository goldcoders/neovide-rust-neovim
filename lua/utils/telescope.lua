local actions = require("telescope.actions")

local M = {}


function M.search_in_buffer()
  local opts = {
    attach_mappings = function(_, map)
      map("i", "<C-j>", actions.move_selection_next)
      map("i", "<C-k>", actions.move_selection_previous)

      -- Continue with the other mappings
      return true
    end,
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.search_dotfiles()
  local opts = {
    cwd = "~/.dotfiles",
  }
  require("telescope.builtin").git_files(opts)
end

return M
