vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup { import = "core/plugins" }
