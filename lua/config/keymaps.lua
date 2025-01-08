-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- " Split Windows
local wk = require("which-key")
wk.add({
  { "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split", mode = "n" },
  { "<leader>h", "<cmd>split<cr>", desc = "Horizonal Split", mode = "n" },
  { "<leader>y", "<cmd>YankyRingHistory<cr>", desc = "Yanky History", mode = "n" },
  -- hide default keymaps from which-key
  { "<leader>|", hidden = true },
  { "<leader>-", hidden = true },
})

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

map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

-- after putting, use these to iterate through the saved yanked texts
map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")
