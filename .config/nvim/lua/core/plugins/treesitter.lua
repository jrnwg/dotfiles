return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "bash", "lua", "python" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    "nvim-treesitter/playground",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>th",
        "<cmd>TSHighlightCapturesUnderCursor<cr>",
        { desc = "Treesitter Highlight Info" }
      )
    end,
  },
}
