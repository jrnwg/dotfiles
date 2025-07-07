return {
  "folke/tokyonight.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "rebelot/kanagawa.nvim",
  "ellisonleao/gruvbox.nvim",
  "olimorris/onedarkpro.nvim",
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onenord").load()
    end,
  },
}
