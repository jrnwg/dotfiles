-- lua/core/telescope.lua

local telescope = require "telescope"
local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

telescope.setup {
  extensions = {
    ["ui-select"] = themes.get_dropdown(),
  },
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
      n = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
}

-- Load extensions
telescope.load_extension "fzf"
telescope.load_extension "ui-select"

-- Keymaps
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S][G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  }
end, { desc = "[S]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[N]eovim files" })
