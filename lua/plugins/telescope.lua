return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  defaults = {
    mappings = {
      i = {
        -- Stay in current buffer on <CR> (insert mode)
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
      },
      n = {
        -- Stay in current buffer on <CR> (normal mode)
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
      },
    },
  },
  opts = {
    pickers = {
      buffers = {
        ignore_current_buffer = true,
      },
    },
  },
}

-- return {
--   "telescope.nvim",
--   dependencies = {
--     "nvim-telescope/telescope-fzf-native.nvim",
--     build = "make",
--     config = function()
--       require("telescope").load_extension("fzf")
--     end,
--   },
-- }

-- if vim.fn.executable("rg") == 1 then
--   return {
--     "telescope",
--     defaults = {
--       vimgrep_arguments = {
--         "rg",
--         "--line-number",
--         "--no-heading",
--         "--column",
--         "--smart-case",
--         "--silent",
--         "--vimgrep",
--       },
--       dependencies = {
--         "nvim-telescope/telescope-fzf-native.nvim",
--         build = "make",
--         config = function()
--           require("telescope").load_extension("fzf")
--         end,
--       },
--     },
--     keys = {
--       { "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>" },
--       { "<leader>/", false },
--     },
--   }
-- else
--   if vim.fn.executable("ag") == 1 then
--     return {
--       "telescope",
--       keys = {
--         { "<leader>/", false },
--       },
--       { "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>" },
--       defaults = {
--         vimgrep_arguments = {
--           "ag",
--           "--noheading",
--           "--column",
--           "--smart-case",
--           "--silent",
--           "--vimgrep",
--         },
--       },
--       dependencies = {
--         "nvim-telescope/telescope-fzf-native.nvim",
--         build = "make",
--         config = function()
--           require("telescope").load_extension("fzf")
--         end,
--       },
--     }
--   end
-- end
