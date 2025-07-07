return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      spec = {
        { "<leader>s", group = "[S]earch" },
        { "<leader>d", group = "[D]ebug" },
      },
    },
  },
}
