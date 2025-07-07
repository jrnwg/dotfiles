local map = vim.keymap.set

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- emacs insert/command
map("i", "<C-a>", "<ESC>^i")
map("i", "<C-e>", "<End>")
for _, mode in ipairs { "i", "c" } do
  vim.keymap.set(mode, "<C-n>", "<Down>")
  vim.keymap.set(mode, "<C-p>", "<Up>")

  vim.keymap.set(mode, "<C-b>", "<Left>")
  vim.keymap.set(mode, "<C-f>", "<Right>")
  vim.keymap.set(mode, "<C-a>", "<Home>")
  vim.keymap.set(mode, "<C-e>", "<End>")

  vim.keymap.set(mode, "<M-b>", "<C-Left>")
  vim.keymap.set(mode, "<M-f>", "<C-Right>")

  vim.keymap.set(mode, "<C-w>", "<C-w>")
  vim.keymap.set(mode, "<M-d>", "<C-o>dw") -- insert mode
end

vim.keymap.set("i", "<C-u>", "<C-u>")
vim.keymap.set("i", "<C-k>", "<C-o>D")
vim.keymap.set("c", "<C-u>", "<C-u>")
vim.keymap.set("c", "<C-k>", "<C-\\>e strpart(getcmdline(), 0, getcmdpos()-1)<CR>")

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

map("n", "<leader>c/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>c/", "gc", { desc = "toggle comment", remap = true })

map("n", "<leader><tab>", "<cmd>b#<cr>", { desc = "Switch to last buffer" })
