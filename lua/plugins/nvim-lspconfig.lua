require("lspconfig").perlpls.setup({})
--   "perlnavigator",
--   settings = {
--     perlPath = "perl",
--     enableWarnings = true,
--     perltidyProfile = "",
--     perlcriticProfile = "",
--     perlcriticEnabled = true,
--   },
-- }

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      perlnavigator = {},
    },
  },
}

-- add pyright to lspconfig
-- {
--   "neovim/nvim-lspconfig",
--   ---@class PluginLspOpts
--   opts = {
--     ---@type lspconfig.options
--     servers = {
--       -- pyright will be automatically installed with mason and loaded with lspconfig
--       perlnavigator = {},
--     },
--   },
-- }
-- )
