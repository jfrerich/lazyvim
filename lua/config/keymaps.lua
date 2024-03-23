-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- " Split Windows
map("n", "<leader>h", "<cmd>split<CR>")
map("n", "<leader>v", "<cmd>vsplit<CR>")

-- show buffers
map("n", ";", "<cmd> Telescope buffers <CR>")
