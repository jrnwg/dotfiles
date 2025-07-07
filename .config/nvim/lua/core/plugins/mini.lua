return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      local statusline = require "mini.statusline"
      statusline.setup()
      statusline.selection_location = function()
        return "%2l:%-2v"
      end
    end,
  },
}
