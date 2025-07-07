return {
  "aserowy/tmux.nvim",
  config = function()
    local tmux = require "tmux"

    tmux.setup {
      copy_sync = {
        enable = false,
      },
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = false,
        resize_step_x = 5,
        resize_step_y = 5,
      },
      swap = {
        cycle_navigation = false,
        enable_default_keybindings = false,
      },
    }

    vim.keymap.set("n", "<A-h>", tmux.move_left)
    vim.keymap.set("n", "<A-j>", tmux.move_bottom)
    vim.keymap.set("n", "<A-k>", tmux.move_top)
    vim.keymap.set("n", "<A-l>", tmux.move_right)

    vim.keymap.set("n", "<A-H>", tmux.resize_left)
    vim.keymap.set("n", "<A-J>", tmux.resize_bottom)
    vim.keymap.set("n", "<A-K>", tmux.resize_top)
    vim.keymap.set("n", "<A-L>", tmux.resize_right)
  end,
}
