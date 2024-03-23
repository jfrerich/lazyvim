-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- " Split Windows
map("n", "<leader>h", "<cmd>split<CR>")
map("n", "<leader>v", "<cmd>vsplit<CR>")

-- show buffers
map("n", ";", "<cmd> Telescope buffers <CR>")

local telescope, builtin = require("telescope"), require("telescope.builtin")
function fuzzyFindFiles()
  builtin.grep_string({
    path_display = { "smart" },
    only_sort_text = true,
    word_match = "-w",
    search = "",
  })
end

vim.keymap.set("n", "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>")

-- map("n", "<leader>rg", live_grep_args_shortcuts.grep_word_under_cursor)
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
-- map("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)
