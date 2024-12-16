-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- " Split Windows
map("n", "<leader>h", "<cmd>split<CR>")
map("n", "<leader>v", "<cmd>vsplit<CR>")

-- show buffers
map("n", ";", "<Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>")

map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<A-h", "<C-\\><C-N><C-w>h")
map("t", "<A-j", "<C-\\><C-N><C-w>j")
map("t", "<A-k", "<C-\\><C-N><C-w>k")
map("t", "<A-l", "<C-\\><C-N><C-w>l")

for _, mode in pairs({ "i", "v", "n" }) do
  vim.keymap.del(mode, "<A-j>")
end
-- local builtin = require("telescope.builtin")
-- function fuzzyFindFiles()
--   builtin.grep_string({
--     path_display = { "smart" },
--     only_sort_text = true,
--     word_match = "-w",
--     search = "",
--   })
-- end
--
-- vim.keymap.set("n", "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>")

-- map("n", "<leader>rg", live_grep_args_shortcuts.grep_word_under_cursor)
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
