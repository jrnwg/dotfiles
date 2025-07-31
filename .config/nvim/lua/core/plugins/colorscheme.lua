return {
  { "catppuccin/nvim", name = "catppuccin" },
  "rebelot/kanagawa.nvim",
  "ellisonleao/gruvbox.nvim",
  "olimorris/onedarkpro.nvim",
  "EdenEast/nightfox.nvim",
  "rmehri01/onenord.nvim",
  "rebelot/kanagawa.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd "colorscheme tokyonight"
    end,
  },
}
