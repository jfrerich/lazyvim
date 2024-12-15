-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { ".cdsinit", ".cdsenv", "*.il" },
  callback = function()
    vim.opt.filetype = "skill"
  end,
})
-- Create an autocmd to run isort on saving Python files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.cmd("silent !isort %")
  end,
})
