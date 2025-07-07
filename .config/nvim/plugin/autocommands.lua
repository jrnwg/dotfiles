vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Save and restore cursor positon",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Run current python file",
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<localleader>r", function()
      vim.cmd "write"
      vim.cmd("terminal python " .. vim.fn.expand "%")
    end, { buffer = true, desc = "Run file" })
  end,
})
