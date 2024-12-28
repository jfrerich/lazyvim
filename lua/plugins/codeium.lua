return {
  "Exafunction/codeium.nvim",
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    enable_cmp_source = vim.g.ai_cmp,
    virtual_text = {
      enabled = not vim.g.ai_cmp,
      key_bindings = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
  },
}
--   "Exafunction/codeium.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--   },
--   config = function()
--     require("codeium").setup({
--       enable_chat = true,
--     })
--   end,
-- }
-- return {
--   "Exafunction/codeium.vim",
--   config = function()
--     -- Change '<C-g>' here to any keycode you like.
--     vim.keymap.set("i", "<C-g>", function()
--       return vim.fn["codeium#Accept"]()
--     end, { expr = true, silent = true })
--     vim.keymap.set("i", "<c-;>", function()
--       return vim.fn["codeium#CycleCompletions"](1)
--     end, { expr = true, silent = true })
--     vim.keymap.set("i", "<c-,>", function()
--       return vim.fn["codeium#CycleCompletions"](-1)
--     end, { expr = true, silent = true })
--     vim.keymap.set("i", "<c-x>", function()
--       return vim.fn["codeium#Clear"]()
--     end, { expr = true, silent = true })
--   end,
-- }
